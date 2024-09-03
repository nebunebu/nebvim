{ inputs, ... }:
builtins.mapAttrs
  (
    system: _:
    let
      pkgs = import inputs.nixpkgs {
        inherit system;
        overlays = [ inputs.tool-suites.overlays.default ];
      };
    in
    {
      default = pkgs.mkShell {
        name = "testShell";
        packages = [
          pkgs.tool-suite.lua
        ];
      };
    }
  )
  inputs.nixpkgs.legacyPackages
