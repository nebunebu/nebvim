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
                plugins = with pkgs.vimPlugins; [
                  plenary-nvim

                  # keybindings
                  which-key-nvim

                  # syntax
                  nvim-treesitter.withAllGrammars

                  # icons
                  nvim-web-devicons

                  # colorscheme
                  rose-pine

                  # bars and lines
                  barbecue-nvim
                  nvim-navic

                  # statusline
                  lualine-nvim

                  # lsp
                  lsp-zero-nvim
                  nvim-lspconfig
                  lspkind-nvim
                  fidget-nvim

                  # cmp
                  nvim-cmp
                  cmp-buffer
                  luasnip
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

                  # comments
                  comment-nvim
                  todo-comments-nvim

                  # file browsing
                  telescope-nvim
                  (pkgs.vimUtils.buildVimPlugin {
                    src = inputs.triptych-nvim;
                    name = "triptych";
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
                  (pkgs.lib.makeBinPath [
                    pkgs.ripgrep

                    # NOTE: always available language servers
                    pkgs.vscode-langservers-extracted # for jsonls
                    pkgs.markdown-oxide
                    # TODO: add bashls
                  ])
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
            packages = [
              # NOTE: project specific language servers
              pkgs.nixd
              pkgs.lua-language-server

              # linters
              pkgs.luajitPackages.luacheck
              pkgs.deadnix
              pkgs.statix

              # formatters
              pkgs.stylua
              pkgs.nixfmt-rfc-style
            ];
          };
        }
      );
    };
}
