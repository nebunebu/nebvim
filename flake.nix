{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixpkgs-unstable";

    nightly = {
      url = "github:nix-community/neovim-nightly-overlay";
      inputs = {
        nixpkgs.follows = "nixpkgs";
      };
    };

    flake-parts.url = "github:hercules-ci/flake-parts";

    tolerable = {
      url = "github:wires-org/tolerable-nvim-nix";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        nightly.follows = "nightly";
      };
    };

    nixneovimplugins = {
      url = "github:NixNeovim/NixNeovimPlugins";
      # inputs = {
      #   nixpkgs.follows = "nixpkgs";
      #   flake-utils.follows = "flake-utils";
      # };
    };

    flake-utils.url = "github:numtide/flake-utils";

    statix = {
      url = "github:oppiliappan/statix";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        flake-parts.follows = "flake-parts";
      };
    };

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
            localSystem = system;
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
