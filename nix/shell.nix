{ inputs, ... }:
inputs.nixpkgs.legacyPackages
|> builtins.mapAttrs (
  _system: pkgs: {
    default = pkgs.mkShell {
      name = "nebvim";
      packages = [
      ];
    };
  }
)
