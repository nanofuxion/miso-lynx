pkgs:
let
  source = import ./source.nix pkgs;
in
with pkgs.haskell.lib;
self: super:
{
  counter-bundle = pkgs.writeScriptBin "counter-bundle" ''
    set -euo pipefail
    cd ${source.miso-lynx}
    ./reload
  '';

  inherit (pkgs) bun idris2 nodejs;
}
