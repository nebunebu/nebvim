{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixpkgs-unstable";
    tolerable = {
      url = "github:wires-org/tolerable-nvim-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };


  outputs = inputs: let
    inherit (inputs) self nixpkgs;
    forAllSystems = function:
      nixpkgs.lib.genAttrs [
        "x86_64-linux"
        "x86_64-darwin"
        "aarch64-linux"
        "aarch64-darwin"
      ] (system: function nixpkgs.legacyPackages.${system});
  in {
    packages = forAllSystems (pkgs: {
      neovim = inputs.tolerable.makeNeovimConfig "nebvim" {
        inherit pkgs;
        src = pkgs.lib.fileset.toSource {
          root = ./.;
          fileset = ./nebvim;
        };
        config = {
          plugins = with pkgs.vimPlugins; [
            rose-pine
            lualine-nvim
          ];
        };
      };
    });
    # TODO: add checks
    devShells = forAllSystems (pkgs: {
      default = pkgs.mkShell {
        name = "nebvim";
        packages = [ pkgs.cowsay ];
      };
    });
  };
}
