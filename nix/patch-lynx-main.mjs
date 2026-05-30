#!/usr/bin/env node
/**
 * Patch Idris2 JS output for Lynx main-thread (lepusng / QuickContext).
 *
 * - Remove auto main() at load (native calls renderPage first)
 * - Register globalThis.__startIdrisApp for renderPage hook
 * - Replace ES6 class / BigInt usage unsupported by lepusng
 */
import { readFileSync, writeFileSync } from 'fs';

const path = process.argv[2];
if (!path) {
  console.error('usage: patch-lynx-main.mjs <counter.js>');
  process.exit(1);
}

let src = readFileSync(path, 'utf8');

// BigInt literals
src = src.replace(/\b(-?\d+)n\b/g, '$1');

// ES6 class -> function constructor (lepusng)
src = src.replace(
  /class IdrisError extends Error \{ \}/,
  'function IdrisError(x){this.message=x;} IdrisError.prototype=Object.create(Error.prototype);',
);

// BigInt runtime calls -> Number fallbacks
src = src.replace(/BigInt\.asIntN\(\d+, x\)/g, 'x');
src = src.replace(/BigInt\.asUintN\(\d+, x\)/g, 'x');
src = src.replace(/BigInt\.asUintN\(\d+, ([^)]+)\)/g, '($1)');
src = src.replace(/return BigInt\(s\)/g, 'return Number(s)');
src = src.replace(/BigInt\(/g, 'Number(');

// Symbol — not supported by lepusng
src = src.replace(/Symbol\('idrisworld'\)/g, "'__idrisworld__'");

// Fix Idris PrimIO double-wrap (events/renderer were undefined)
src = src.replace(
  /return Miso_Render_prim__renderApp\(undefined, undefined, \$0, \$1, \$2\.a1, \$2\.a2, \$2\.a3, \$3\);/,
  'return Miso_Render_prim__renderApp($0, $1, $2.a1, $2.a2, $2.a3, $3);',
);
src = src.replace(
  /try\{__mainExpression_0\(\)\}catch\(e\)\{if\(e instanceof IdrisError\)\{console\.log\('ERROR: ' \+ e\.message\)\}else\{throw e\} \}/,
  `globalThis.__startIdrisApp = function (_data) {
  try { __mainExpression_0(); } catch (e) {
    if (e instanceof IdrisError) { console.log('ERROR: ' + e.message); }
    else { throw e; }
  }
};`,
);

writeFileSync(path, src);
console.log('patched for Lynx main-thread:', path);
