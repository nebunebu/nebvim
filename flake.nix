{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixpkgs-unstable";
    tolerable = {
      url = "github:wires-org/tolerable-nvim-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Plugins
    triptych-nvim = {
      url = "github:simonmclean/triptych.nvim";
      flake = false;
    };
  };

  outputs = inputs: let
    forAllSystems = inputs.nixpkgs.lib.genAttrs [
      "x86_64-linux"
      "x86_64-darwin"
      "aarch64-linux"
      "aarch64-darwin"
    ];
  in {
    packages = forAllSystems (system:
      let
        pkgs = inputs.nixpkgs.legacyPackages.${system};
      in {
        default = (inputs.tolerable.makeNeovimConfig "nebvim" {
          inherit pkgs;
          src = pkgs.lib.fileset.toSource {
            root = ./.;
            fileset = ./nebvim;
          };
          config = {
            plugins = with pkgs.vimPlugins; [
              plenary-nvim
              nvim-web-devicons
              rose-pine
              nvim-treesitter.withAllGrammars
              comment-nvim
              todo-comments-nvim
              nvim-autopairs
              rainbow-delimiters-nvim
              lualine-nvim
              vim-tmux-navigator
              telescope-nvim
              which-key-nvim
              (pkgs.vimUtils.buildVimPlugin {
                src = inputs.triptych-nvim;
                name = "triptych";
              })
            ];
          };
        }).overrideAttrs (old: {
          generatedWrapperArgs = (old.generatedWrapperArgs or []) ++ [
            "--prefix"
            "PATH"
            ":"
            (pkgs.lib.makeBinPath [
              pkgs.ripgrep
            ])
          ];
        });
      }
    );

    # TODO: add checks
    devShells = forAllSystems (system:
      let
        pkgs = inputs.nixpkgs.legacyPackages.${system};
      in {
        default = pkgs.mkShell {
          name = "nebvim";
          packages = [ ];
        };
      }
    );
  };
}
