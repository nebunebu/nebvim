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
                    flakePlugins = [
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
                      (pkgs.vimUtils.buildVimPlugin {
                        src = inputs.triptych-nvim;
                        name = "triptych";
                      })
                    ];
                  in
                  flakePlugins
                  ++ [ pkgs.vimPlugins.nvim-treesitter.withAllGrammars ]
                  ++ builtins.attrValues {
                    inherit (pkgs.vimPlugins)
                      rose-pine # colorscheme
                      which-key-nvim
                      plenary-nvim
                      nvim-web-devicons
                      nvim-navic
                      barbecue-nvim
                      lualine-nvim

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

                      telescope-nvim
                      # mkdnflow-nvim

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
                      bashPackages = builtins.attrValues {
                        inherit (pkgs.nodePackages)
                          bash-language-server # bashls
                          ;
                        inherit (pkgs)
                          shellcheck # shellcheck
                          shfmt # shfmt
                          ;
                      };
                      generalPackages = builtins.attrValues { inherit (pkgs) ripgrep direnv; };
                      markdownPackages = builtins.attrValues { inherit (pkgs) markdown-oxide markdownlint-cli; };
                      nixPackages = builtins.attrValues {
                        inherit (pkgs)
                          nixd
                          deadnix
                          statix
                          nixfmt-rfc-style
                          ;
                      };
                      serializedDataPackages = builtins.attrValues {
                        inherit (pkgs)
                          vscode-langservers-extracted # jsonls
                          jq-lsp # jqls
                          yaml-language-server # yamlls
                          ;
                      };
                    in
                    bashPackages ++ generalPackages ++ markdownPackages ++ nixPackages ++ serializedDataPackages
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
                luaPackages = builtins.attrValues {
                  inherit (pkgs) lua-language-server stylua;
                  inherit (pkgs.luajitPackages) luacheck;
                };
              in
              luaPackages;
          };
        }
      );
    };
}
