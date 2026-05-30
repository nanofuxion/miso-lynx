{
  description = "miso-lynx — Idris2 Lynx mobile framework";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system;
          overlays = [ (import ./nix/overlay.nix) ];
        };
      in {
        packages.default = pkgs.counter-bundle;
        packages.counter-bundle = pkgs.counter-bundle;

        devShells.default = pkgs.mkShell {
          buildInputs = with pkgs; [ idris2 bun nodejs ];
        };
      });
}
