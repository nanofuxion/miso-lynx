{ overlays ? []
}:
with (import ./nix { inherit overlays; });

{
  inherit pkgs;

  counter-bundle = pkgs.counter-bundle;

  inherit (pkgs) bun idris2;
}
