{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixpkgs-unstable";
    tolerable = {
      url = "github:wires-org/tolerable-nvim-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Plugins
    # direnv-nvim = {
    #   url = "github:NotAShelf/direnv.nvim";
    #   flake = false;
    # };

    # direnv-vim = {
    #   url = "github:direnv/direnv.vim";
    #   flake = false;
    # };

    # NOTE: made pr
    tiny-inline-diagnostic-nvim = {
      url = "github:rachartier/tiny-inline-diagnostic.nvim";
      flake = false;
    };

    helpview-nvim = {
      url = "github:OXY2DEV/helpview.nvim";
      flake = false;
    };

    tiny-code-action-nvim = {
      url = "github:rachartier/tiny-code-action.nvim";
      flake = false;
    };

    tiny-devicons-auto-colors-nvim = {
      url = "github:rachartier/tiny-devicons-auto-colors.nvim";
      flake = false;
    };

    flow-nvim = {
      url = "github:0xstepit/flow.nvim";
      flake = false;
    };

    triptych-nvim = {
      url = "github:simonmclean/triptych.nvim";
      flake = false;
    };

    markdown-toc = {
      url = "github:ChuufMaster/markdown-toc";
      flake = false;
    };

    fortune = {
      url = "github:rubiin/fortune.nvim";
      flake = false;
    };

    # NOTE: think in nixpkgs
    markview = {
      url = "github:OXY2DEV/markview.nvim";
      flake = false;
    };

    img-clip = {
      url = "github:HakonHarnes/img-clip.nvim";
      flake = false;
    };

    nerdy-nvim = {
      url = "github:2KAbhishek/nerdy.nvim";
      flake = false;
    };

    telescope-emoji-nvim = {
      url = "github:xiyaowong/telescope-emoji.nvim";
      flake = false;
    };
    easypick-nvim = {
      url = "github:axkirillov/easypick.nvim";
      flake = false;
    };

    telescope-git-conflicts-nvim = {
      url = "github:Snikimonkd/telescope-git-conflicts.nvim";
      flake = false;
    };
  };

  outputs =
    inputs:
    let
      forAllSystems = inputs.nixpkgs.lib.genAttrs [
        "x86_64-linux"
        "x86_64-darwin"
        "aarch64-linux"
        "aarch64-darwin"
      ];
    in
    {
      packages = forAllSystems (
        system:
        let
          pkgs = inputs.nixpkgs.legacyPackages.${system};
        in
        {
          default =
            (inputs.tolerable.makeNeovimConfig "nebvim" {
              inherit pkgs;
              src = pkgs.lib.fileset.toSource {
                root = ./.;
                fileset = ./nebvim;
              };
              config = {
                plugins =
                  let
                    flakePlugins = [
                      # (pkgs.vimUtils.buildVimPlugin {
                      #   src = inputs.direnv-vim;
                      #   name = "direnv-vim";
                      # })
                      (pkgs.vimUtils.buildVimPlugin {
                        src = inputs.markdown-toc;
                        name = "markdown-toc";
                      })
                      (pkgs.vimUtils.buildVimPlugin {
                        src = inputs.flow-nvim;
                        name = "flow-nvim";
                      })
                      (pkgs.vimUtils.buildVimPlugin {
                        src = inputs.fortune;
                        name = "fortune";
                      })
                      (pkgs.vimUtils.buildVimPlugin {
                        src = inputs.markview;
                        name = "markview";
                      })
                      (pkgs.vimUtils.buildVimPlugin {
                        src = inputs.helpview;
                        name = "helpview";
                      })
                      # (pkgs.vimUtils.buildVimPlugin {
                      #   src = inputs.direnv-nvim;
                      #   name = "direnv";
                      # })
                      (pkgs.vimUtils.buildVimPlugin {
                        src = inputs.triptych-nvim;
                        name = "triptych";
                      })
                      (pkgs.vimUtils.buildVimPlugin {
                        src = inputs.img-clip;
                        name = "img-clip";
                      })
                      (pkgs.vimUtils.buildVimPlugin {
                        src = inputs.nerdy-nvim;
                        name = "nerdy-nvim";
                      })
                      (pkgs.vimUtils.buildVimPlugin {
                        src = inputs.telescope-emoji-nvim;
                        name = "telescope-emoji-nvim";
                      })
                      (pkgs.vimUtils.buildVimPlugin {
                        src = inputs.easypick-nvim;
                        name = "easypick-nvim";
                      })
                      (pkgs.vimUtils.buildVimPlugin {
                        src = inputs.telescope-git-conflicts-nvim;
                        name = "telescope-git-conflicts-nvim";
                      })
                      (pkgs.vimUtils.buildVimPlugin {
                        src = inputs.tiny-inline-diagnostic-nvim;
                        name = "tiny-inline-diagnostic-nvim";
                      })
                      (pkgs.vimUtils.buildVimPlugin {
                        src = inputs.tiny-code-action-nvim;
                        name = "tiny-code-action-nvim";
                      })
                      (pkgs.vimUtils.buildVimPlugin {
                        src = inputs.tiny-devicons-auto-colors-nvim;
                        name = "tiny-devicons-auto-colors-nvim";
                      })
                    ];
                  in
                  flakePlugins
                  ++ [ pkgs.vimPlugins.nvim-treesitter.withAllGrammars ]
                  ++ builtins.attrValues {
                    inherit (pkgs.vimPlugins)
                      image-nvim
                      nvim-surround
                      toggleterm-nvim
                      nix-develop-nvim

                      nvim-colorizer-lua

                      rose-pine# colorscheme
                      which-key-nvim
                      plenary-nvim
                      nvim-web-devicons
                      nvim-navic
                      barbecue-nvim
                      lualine-nvim
                      alpha-nvim

                      marks-nvim
                      neogit
                      lsp-zero-nvim
                      nvim-lspconfig
                      lspkind-nvim
                      fidget-nvim

                      # cmp
                      luasnip
                      nvim-cmp
                      cmp-nvim-lsp
                      cmp-buffer
                      cmp_luasnip
                      cmp-async-path

                      # formatters
                      conform-nvim

                      # linters
                      nvim-lint

                      # editing support
                      indent-blankline-nvim
                      nvim-autopairs
                      rainbow-delimiters-nvim
                      nvim-treesitter-endwise

                      comment-nvim
                      todo-comments-nvim

                      # Telescope
                      telescope-nvim
                      telescope-project-nvim
                      # telescope-manix
                      quarto-nvim
                      otter-nvim
                      dressing-nvim

                      mkdnflow-nvim

                      # tmux
                      vim-tmux-navigator
                      ;
                  };
              };
            }).overrideAttrs
              (old: {
                generatedWrapperArgs = (old.generatedWrapperArgs or [ ]) ++ [
                  "--prefix"
                  "PATH"
                  ":"
                  (pkgs.lib.makeBinPath (
                    let
                      useToolSuite = filePath: builtins.attrValues (import filePath { inherit pkgs; });
                    in
                    useToolSuite ./toolSuites/bash.nix
                      ++ useToolSuite ./toolSuites/general.nix
                      ++ useToolSuite ./toolSuites/markdown.nix
                      ++ useToolSuite ./toolSuites/nix.nix
                      ++ useToolSuite ./toolSuites/serializedData.nix
                  ))
                ];
              });
        }
      );

      devShells = forAllSystems (
        system:
        let
          pkgs = inputs.nixpkgs.legacyPackages.${system};
        in
        {
          default = pkgs.mkShell {
            name = "nebvim";
            packages =
              let
                useToolSuite = filePath: builtins.attrValues (import filePath { inherit pkgs; });
              in
              useToolSuite ./toolSuites/lua.nix;
          };
        }
      );
    };
}
