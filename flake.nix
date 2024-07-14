{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixpkgs-unstable";
    tolerable = {
      url = "github:wires-org/tolerable-nvim-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Plugins
    direnv-nvim = {
      url = "github:NotAShelf/direnv.nvim";
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

    markview = {
      url = "github:OXY2DEV/markview.nvim";
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
                    # FIX: refactor this
                    triptych = pkgs.vimUtils.buildVimPlugin {
                      src = inputs.triptych-nvim;
                      name = "triptych";
                    };
                  in
                  with pkgs.vimPlugins;
                  [
                    triptych
                    plenary-nvim
                    # keybindings
                    which-key-nvim

                    # syntax
                    nvim-treesitter.withAllGrammars

                    # icons
                    # nvim-web-devicons

                    # colorscheme
                    rose-pine

                    {
                      plugin = barbecue-nvim;
                      dependencies = [ nvim-navic ];
                    }

                    {
                      plugin = lualine-nvim;
                      # dependencies = [];
                    }

                    marks-nvim
                    neogit

                    # lsp
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

                    # formatters
                    conform-nvim

                    # linters
                    nvim-lint

                    # editing support
                    indent-blankline-nvim
                    nvim-autopairs
                    rainbow-delimiters-nvim
                    {
                      plugin = nvim-treesitter-endwise;
                      dependencies = [ nvim-treesitter.withAllGrammars ];
                    }

                    # comments
                    comment-nvim
                    todo-comments-nvim

                    # file browsing
                    telescope-nvim
                    {
                      plugin = cheatsheet-nvim;
                      dependencies = [
                        popup-nvim
                        plenary-nvim
                        telescope-nvim
                      ];
                    }
                    {
                      plugin = mkdnflow-nvim;
                      dependencies = [ plenary-nvim ];
                    }
                    (pkgs.vimUtils.buildVimPlugin {
                      src = inputs.markdown-toc;
                      name = "markdown-toc";
                    })
                    (pkgs.vimUtils.buildVimPlugin {
                      src = inputs.markview;
                      name = "markview";
                    })
                    (pkgs.vimUtils.buildVimPlugin {
                      src = inputs.direnv-nvim;
                      name = "direnv";
                    })
                    # tmux
                    vim-tmux-navigator
                  ];
              };
            }).overrideAttrs
              (old: {
                generatedWrapperArgs = (old.generatedWrapperArgs or [ ]) ++ [
                  "--prefix"
                  "PATH"
                  ":"
                  (pkgs.lib.makeBinPath (
                    builtins.attrValues {
                      inherit (pkgs)
                        ripgrep
                        direnv
                        markdown-oxide
                        markdownlint-cli
                        vscode-langservers-extracted # for jsonls
                        nixd
                        deadnix
                        statix
                        nixfmt-rfc-style
                        ;
                      inherit (pkgs.nodePackages) bash-language-server;
                    }
                  ))
                ];
              });
        }
      );

      # TODO: add checks
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
                luaPackages = builtins.attrValues {
                  inherit (pkgs) lua-language-server stylua;
                  inherit (pkgs.luajitPackages) luacheck;
                };
                nixPackages = builtins.attrValues {
                  inherit (pkgs)
                    nixd
                    deadnix
                    statix
                    nixfmt-rfc-style
                    ;
                };
              in
              luaPackages ++ nixPackages;
          };
        }
      );
    };
}
