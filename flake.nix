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
              indent-blankline-nvim
              lualine-nvim
              vim-tmux-navigator
              telescope-nvim
              which-key-nvim
              (pkgs.vimUtils.buildVimPlugin {
                src = inputs.triptych-nvim;
                name = "triptych";
              })

              # NOTE: Lsp
              lsp-zero-nvim
              nvim-lspconfig
            ];
          };
        }).overrideAttrs (old: {
          generatedWrapperArgs = (old.generatedWrapperArgs or []) ++ [
            "--prefix"
            "PATH"
            ":"
            (pkgs.lib.makeBinPath [
              pkgs.ripgrep

              # NOTE: always available language servers
              # pkgs.marksman
              pkgs.vscode-langservers-extracted # for jsonls
              pkgs.markdown-oxide
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
          packages = [
            # NOTE: project specific language servers
            pkgs.nixd
            pkgs.lua-language-server
          ];
        };
      }
    );
  };
}
