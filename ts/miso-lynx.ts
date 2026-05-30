import { drawingContext, eventContext } from './miso/context/lynx';

/* lepusng-safe stubs — do not bundle JSBI/text-encoding on main thread */
if (typeof globalThis['BigInt'] === 'undefined') {
  globalThis['BigInt'] = function (x: any) {
    return Number(x) || 0;
  };
}

/* Polyfills global rAF w/ lynx */
globalThis['requestAnimationFrame'] = lynx['requestAnimationFrame'];
globalThis['cancelAnimationFrame'] = lynx['cancelAnimationFrame'];

/* export native context globally */
globalThis['native'] = {};
globalThis['native']['drawingContext'] = drawingContext;
globalThis['native']['eventContext'] = eventContext;

if (!globalThis['native']['componentContext']) {
  globalThis['native']['componentContext'] = {
    mountComponent: function () {},
    unmountComponent: function () {},
    modelHydration: function () {},
  };
}

/* Used for event handling on main thread */
globalThis['runWorklet'] = (worklet, params) => {
  return worklet(params);
}

/* First function call, create global page, synonym to body for Haskell layer */
globalThis['renderPage'] = function (data) {
  var page = __CreatePage('0', 0);
  var pageId = __GetElementUniqueID(page);
  globalThis['native']['currentPageId'] = pageId;
  globalThis['page'] = page;

  /* sets page as root node to document, like body */
  globalThis['document'] = {};
  globalThis['document']['body'] = page;

  /* Start Idris app after Lynx provides Element PAPI (calledByNative contract) */
  if (typeof globalThis.__startIdrisApp === 'function' && !globalThis.__idrisAppStarted) {
    globalThis.__idrisAppStarted = true;
    globalThis.__startIdrisApp(data);
  }
};

/*
  dmj: this is for something, not sure what, can be exposed to Haskell layer if need be.
  For now let's just log out the lynx object.
 */
globalThis['processData'] = function () {

}

/* dmj: invoke lynx behaviors, convenience function */
globalThis['invokeExec'] = function
  ( selector: string,
    method: string,
    params: Object,
    success: (result: any) => void,
    fail: (result: string) => void
  )

{

 /* set arguments object */
 const args = {
   params: params,
   method: method,
   success: success,
   fail: fail
 };

 /* invoke exec */
 return lynx.createSelectorQuery()
     .select(selector)
     .invoke(args)
     .exec();
}
