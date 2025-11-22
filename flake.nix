{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixpkgs-unstable";

    tolerable = {
      url = "github:wires-org/tolerable-nvim-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixneovimplugins.url = "github:NixNeovim/NixNeovimPlugins";

    statix.url = "github:oppiliappan/statix";

    treefmt-nix = {
      url = "github:numtide/treefmt-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs: {
    devShells = import ./nix/shell.nix { inherit inputs; };
    checks = import ./nix/checks.nix { inherit inputs; };
    formatter = import ./nix/formatter.nix { inherit inputs; };
    packages =
      inputs.nixpkgs.legacyPackages
      |> builtins.mapAttrs (
        system: _pkgs:
        let
          pkgs = import inputs.nixpkgs {
            inherit system;
            overlays = import ./nix/overlays.nix { inherit inputs; };
          };
        in
        {
          default = pkgs.lib.mkNvimConf "nebvim";
          nebvim = pkgs.lib.mkNvimConf "nebvim";
          manvim = pkgs.lib.mkNvimConf "manvim";
        }
      );
  };
}
