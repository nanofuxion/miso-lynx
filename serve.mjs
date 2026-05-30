#!/usr/bin/env bun
/**
 * Static server for dist/ — load main.lynx.bundle in LynxExplorer.
 *
 * Usage: bun serve.mjs [port]
 * Binds 0.0.0.0 (LAN). Default port: 8080 (falls back if busy).
 */

import { join, normalize } from 'node:path';
import { fileURLToPath } from 'node:url';
import { existsSync } from 'node:fs';
import os from 'node:os';
import qrcode from 'qrcode-terminal';

const root = join(fileURLToPath(new URL('.', import.meta.url)), 'dist');
const preferred = Number(process.argv[2] ?? process.env.PORT ?? 8080);
const host = process.env.HOST ?? '0.0.0.0';

const bundle = join(root, 'main.lynx.bundle');
if (!existsSync(bundle)) {
  console.error('Missing dist/main.lynx.bundle — run: bun run preview');
  process.exit(1);
}

function lanIp() {
  for (const ifaces of Object.values(os.networkInterfaces())) {
    if (!ifaces) continue;
    for (const iface of ifaces) {
      const v4 = iface.family === 'IPv4' || iface.family === 4;
      if (v4 && !iface.internal) return iface.address;
    }
  }
  return null;
}

const mime = {
  '.bundle': 'application/octet-stream',
  '.js': 'text/javascript',
  '.json': 'application/json',
  '.html': 'text/html',
};

const handler = {
  async fetch(req) {
    const url = new URL(req.url);
    let path = decodeURIComponent(url.pathname);
    if (path === '/') path = '/main.lynx.bundle';

    const filePath = normalize(join(root, path.replace(/^\//, '')));
    if (!filePath.startsWith(root)) {
      return new Response('Forbidden', { status: 403 });
    }

    const file = Bun.file(filePath);
    if (!(await file.exists())) {
      return new Response('Not found', { status: 404 });
    }

    const ext = filePath.slice(filePath.lastIndexOf('.'));
    return new Response(file, {
      headers: {
        'Content-Type': mime[ext] ?? 'application/octet-stream',
        'Access-Control-Allow-Origin': '*',
        'Cache-Control': 'no-cache',
      },
    });
  },
};

function listen(port) {
  return Bun.serve({ hostname: host, port, ...handler });
}

let port = preferred;
let server;

for (let attempt = 0; attempt < 20; attempt++) {
  try {
    server = listen(port);
    break;
  } catch (err) {
    if (err?.code !== 'EADDRINUSE') throw err;
    if (process.argv[2] || process.env.PORT) {
      console.error(`Port ${port} is in use. Try: bun serve.mjs ${port + 1}`);
      console.error('Or free the port: lsof -ti :' + port + ' | xargs kill');
      process.exit(1);
    }
    port++;
  }
}

if (!server) {
  console.error('Could not find a free port.');
  process.exit(1);
}

if (port !== preferred) {
  console.warn(`Port ${preferred} was busy — using ${port} instead.`);
}

const ip = lanIp();
const phoneUrl = ip
  ? `http://${ip}:${port}/main.lynx.bundle`
  : `http://<your-lan-ip>:${port}/main.lynx.bundle`;

console.log('');
console.log('  miso-lynx dev server');
console.log('  ─────────────────────');
console.log(`  Listening:  ${host}:${port}`);
console.log(`  Phone URL:  ${phoneUrl}`);
console.log('');
console.log('  Scan in LynxExplorer (same Wi‑Fi):');
console.log('');

qrcode.generate(phoneUrl, { small: true }, (code) => {
  console.log(code);
  console.log('  Ctrl+C to stop.');
  console.log('');
});
