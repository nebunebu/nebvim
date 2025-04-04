{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixpkgs-unstable";
    tolerable = {
      url = "github:wires-org/tolerable-nvim-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs: {
    devShells = import ./nix/shell.nix { inherit inputs; };
    packages =
      inputs.nixpkgs.legacyPackages
      |> builtins.mapAttrs (
        system: _:
        let
          pkgs = inputs.nixpkgs.legacyPackages.${system};
          mkNvimConf = (import ./nix/lib.nix { inherit inputs pkgs; }).mkNvimConf;
        in
        {
          default = (mkNvimConf "nebvim");
          nebvim = (mkNvimConf "nebvim");
          manvim = (mkNvimConf "manvim");
          testvim = (mkNvimConf "testvim");
        }
      );
  };
}
