/* idris-miso runtime — builds miso vtrees from Idris ADTs and runs the app loop */

const VNodeType = 1;
const VTextType = 2;
const VFragType = 3;

function idrisListToArray(cell) {
  const out = [];
  while (cell && cell.h === undefined) {
    out.push(cell.a1);
    cell = cell.a2;
  }
  return out;
}

function idrisPairsToObject(cell) {
  const obj = {};
  for (const p of idrisListToArray(cell)) {
    if (p && p.a1 !== undefined) obj[p.a1] = p.a2;
  }
  return obj;
}

function createVNode(tag, ns) {
  return {
    type: VNodeType,
    tag,
    ns: ns || 'html',
    props: {},
    css: {},
    events: { bubbles: {}, captures: {} },
    children: [],
    domRef: null,
    parent: null,
    key: null,
    nextSibling: null,
  };
}

function createVText(text) {
  return {
    type: VTextType,
    ns: 'text',
    text: text ?? '',
    domRef: null,
    parent: null,
    key: null,
    nextSibling: null,
  };
}

function installMisoContext() {
  const drawing = globalThis.miso.drawingContext;
  if (!drawing) return;
  globalThis.miso.context = {
    createElement: (tag) => drawing.createElement(tag),
  };
}

function addEventHandler(node, phase, eventName, dispatch, action) {
  const bucket = phase === 1 ? node.events.captures : node.events.bubbles;
  bucket[eventName] = {
    options: { preventDefault: false, stopPropagation: false },
    runEvent: (_ev, _domRef) => {
      dispatch(action);
    },
  };
}

const LYNX_EVENT_TYPES = {
  bubbles: 'bindEvent',
  captures: 'capture-bind',
};

function syncLynxEventBindings(vtree) {
  if (!vtree) return;
  if (vtree.type === VNodeType && vtree.domRef) {
    for (const phase of ['bubbles', 'captures']) {
      const lynxType = LYNX_EVENT_TYPES[phase];
      const bucket = vtree.events[phase];
      for (const name in bucket) {
        const entry = bucket[name];
        __AddEvent(vtree.domRef, lynxType, name, {
          type: 'worklet',
          value: () => entry.runEvent(null, vtree.domRef),
        });
      }
    }
  }
  if (vtree.children) {
    for (const child of vtree.children) syncLynxEventBindings(child);
  }
}

function buildVTree(view, dispatch, parseAttr) {
  if (!view || view.h === undefined) return null;
  if (view.h === 1) {
    return createVText(view.a1);
  }
  const tag = view.a1;
  const attrs = idrisListToArray(view.a2);
  const children = idrisListToArray(view.a3);
  const node = createVNode(tag, 'html');
  for (const attr of attrs) {
    if (!attr || attr.h === undefined) continue;
    if (attr.h === 0) {
      node.props[attr.a1] = attr.a2;
    } else if (attr.h === 1) {
      node.css[attr.a1] = attr.a2;
    } else if (attr.h === 2) {
      addEventHandler(node, 0, attr.a1, dispatch, attr.a2);
    }
  }
  const built = children.map((c) => buildVTree(c, dispatch, parseAttr)).filter(Boolean);
  for (let i = 0; i < built.length; i++) {
    built[i].parent = node;
    if (i + 1 < built.length) built[i].nextSibling = built[i + 1];
  }
  node.children = built;
  return node;
}


globalThis.idrisMiso = {
  renderApp(eventsCell, rendererName, initModel, updateFn, viewFn) {
    if (globalThis[rendererName] && !globalThis[rendererName].componentContext) {
      globalThis[rendererName].componentContext = {
        mountComponent: () => {},
        unmountComponent: () => {},
        modelHydration: () => {},
      };
    }
    globalThis.miso.setDrawingContext(rendererName);
    installMisoContext();
    /* renderPage is invoked by Lynx native before app code runs */
    let model = initModel;
    let currentTree = null;

    const dispatch = (action) => {
      model = updateFn(model, action);
      render();
    };

    const render = () => {
      const view = viewFn(model);
      const next = buildVTree(view, dispatch);
      const mount = globalThis.document?.body ?? globalThis.page;
      if (!mount) {
        console.error('idrisMiso: no mount point');
        return;
      }
      globalThis.miso.diff(currentTree, next, mount, globalThis.miso.drawingContext);
      syncLynxEventBindings(next);
      if (globalThis.miso.drawingContext.flush) {
        globalThis.miso.drawingContext.flush();
      }
      currentTree = next;
    };

    render();
  },
};
