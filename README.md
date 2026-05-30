<h1 align="center">miso-lynx</h1>

**Miso Lynx** is the [miso-lynx](https://github.com/haskell-miso/miso-lynx) API rebuilt in **Idris2**, targeting [LynxJS](https://lynxjs.org/) on iOS, Android, and HarmonyOS.

## Quick Start

Requirements: [Idris2](https://idris2.readthedocs.io/), [Bun](https://bun.sh/)

```bash
git clone <repo>
cd miso-lynx2
bun install
bun run preview
```

This builds `dist/main.lynx.bundle` and starts a dev server with a **QR code** for [LynxExplorer](https://lynxjs.org) on your phone (same Wi‑Fi).

To build only (no server):

```bash
./reload
```

### Serve for LynxExplorer

```bash
bun run serve      # serve existing bundle
bun run preview    # build + serve (recommended)
```

The server binds **`0.0.0.0`** and prints a **QR code** with your LAN URL for LynxExplorer on a phone (same Wi‑Fi).

Example URL:

```
http://192.168.1.42:8080/main.lynx.bundle
```

Custom port: `bun serve.mjs 3000`

## Counter example

See [`examples/counter/Main.idr`](examples/counter/Main.idr):

```idris
main : IO ()
main = lynx lynxEvents counterComponent
```

## Layout

| Path | Role |
|------|------|
| `src/Miso/Lynx/` | Lynx bindings (library) |
| `idris-miso/` | Minimal Miso runtime (like upstream `miso`) |
| `examples/counter/` | Counter example |
| `examples/miso-native-examples.ipkg` | Example package |
| `ts/` | Lynx PAPI bridge |
| `js/miso.js` | Miso diff runtime (from upstream miso) |
| `js/miso-lynx.js` | Compiled TS bridge |
| `miso-lynx.ipkg` | Library package |

## Development

```bash
bun run js              # rebuild Lynx TS bridge
idris2 --build miso-lynx.ipkg
./reload                # full bundle
```

## License

BSD3 — see [LICENSE](LICENSE)
