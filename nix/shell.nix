{ inputs, ... }:
inputs.nixpkgs.legacyPackages
|> builtins.mapAttrs (
  system: _:
  let
    pkgs = inputs.nixpkgs.legacyPackages.${system};
  in
  {
    default = pkgs.mkShell {
      name = "nebvim";
      packages = [
      ];
    };
  }
)
