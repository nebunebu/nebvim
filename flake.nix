{
  outputs = inputs: {
    packages = builtins.mapAttrs
      (system: _:
        let
          # {{{ FOLD: define pkgs
          pkgs = import inputs.nixpkgs {
            inherit system;
            overlays = [ inputs.tool-suites.overlays.default ];
          };
          # }}}

          # {{{ mkFlakePlugins function
          mkFlakePlugins = map
            (plugin: pkgs.vimUtils.buildVimPlugin {
              src = inputs.${plugin};
              name = plugin;
            })
            (
              inputs.nixpkgs.lib.filter (inputs.nixpkgs.lib.hasSuffix "-nvim") (inputs.nixpkgs.lib.attrNames inputs)
            );
          # }}}
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
                plugins = mkFlakePlugins
                  ++ [ pkgs.vimPlugins.nvim-treesitter.withAllGrammars ];
              };
            }).overrideAttrs
              (old: {
                generatedWrapperArgs =
                  let
                    toolSuites = builtins.attrValues
                      {
                        # FIX: image-nvim complains that magick is not
                        # in path. It is in pkgs.tool-suite.nvim-tools
                        # adding here results in set not list error.
                        # inherit (pkgs.lua51Packages) magick;
                        inherit (pkgs.tool-suite)
                          bash
                          json
                          nix
                          md
                          nvim-tools
                          xml
                          yaml
                          ;
                      };
                    toolPath = pkgs.lib.makeBinPath (builtins.concatLists toolSuites);
                  in
                  (old.generatedWrapperArgs or [ ]) ++ [
                    "--prefix"
                    "PATH"
                    ":"
                    (builtins.toString toolPath)
                  ];
              });
        }
      )
      inputs.nixpkgs.legacyPackages;

    devShells = import ./nix/shell.nix { inherit inputs; };
  };

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixpkgs-unstable";
    tolerable = {
      url = "github:wires-org/tolerable-nvim-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    tool-suites.url = "github:nebunebu/tool-suites";

    # {{{  NOTE: Flake Inputs for plugins

    # Utilities
    plenary-nvim = { url = "github:nvim-lua/plenary.nvim"; flake = false; };

    # LSP
    lsp-zero-nvim = { url = "github:VonHeikemen/lsp-zero.nvim"; flake = false; };
    lspconfig-nvim = { url = "github:neovim/nvim-lspconfig"; flake = false; };
    lspkind-nvim = { url = "github:onsails/lspkind.nvim"; flake = false; };
    fidget-nvim = { url = "github:j-hui/fidget.nvim"; flake = false; };
    barbecue-nvim = { url = "github:utilyre/barbecue.nvim"; flake = false; };
    nvim-navic-nvim = { url = "github:SmiteshP/nvim-navic"; flake = false; };

    # DAP
    dap-nvim = { url = "github:mfussenegger/nvim-dap"; flake = false; };
    dap-ui-nvim = { url = "github:rcarriga/nvim-dap-ui"; flake = false; };
    nio-nvim = { url = "github:nvim-neotest/nvim-nio"; flake = false; };
    one-small-step-for-vimkind-nvim = { url = "github:jbyuki/one-small-step-for-vimkind"; flake = false; };
    telescope-dap-nvim = { url = "github:nvim-telescope/telescope-dap.nvim"; flake = false; };

    # Linting
    nvim-lint-nvim = { url = "github:mfussenegger/nvim-lint"; flake = false; };
    tiny-inline-diagnostic-nvim = { url = "github:rachartier/tiny-inline-diagnostic.nvim"; flake = false; };

    # Formatters
    conform-nvim = { url = "github:stevearc/conform.nvim"; flake = false; };

    # Completion
    nvim-cmp-nvim = { url = "github:hrsh7th/nvim-cmp"; flake = false; };
    cmp-nvim-lsp-nvim = { url = "github:hrsh7th/cmp-nvim-lsp"; flake = false; };
    cmp-buffer-nvim = { url = "github:hrsh7th/cmp-buffer"; flake = false; };
    cmp-luasnip-nvim = { url = "github:saadparwaiz1/cmp_luasnip"; flake = false; };
    cmp-async-path-nvim = { url = "github:FelipeLema/cmp-async-path"; flake = false; };

    # Snippets
    luasnip-nvim = { url = "github:L3MON4D3/LuaSnip"; flake = false; };

    # Editing Support
    indent-blankline-nvim = { url = "github:lukas-reineke/indent-blankline.nvim"; flake = false; };
    nvim-autopairs-nvim = { url = "github:windwp/nvim-autopairs"; flake = false; };
    nvim-treesitter-endwise-nvim = { url = "github:RRethy/nvim-treesitter-endwise"; flake = false; };
    rainbow-delimitters-nvim = { url = "github:HiPhish/rainbow-delimiters.nvim"; flake = false; };
    nvim-surround-nvim = { url = "github:kylechui/nvim-surround"; flake = false; };

    # Comments
    comment-nvim = { url = "github:numToStr/Comment.nvim"; flake = false; };
    todo-comments-nvim = { url = "github:folke/todo-comments.nvim"; flake = false; };

    # File Explorers
    triptych-nvim = { url = "github:simonmclean/triptych.nvim"; flake = false; }; # Swap to yazi plugin
    oil-nvim = { url = "github:stevearc/oil.nvim"; flake = false; };

    # Telescope
    telescope-nvim = { url = "github:nvim-telescope/telescope.nvim"; flake = false; };
    telescope-project-nvim = { url = "github:nvim-telescope/telescope-project.nvim"; flake = false; }; # replace with whatever auto adds git repos
    nerdy-nvim = { url = "github:2KAbhishek/nerdy.nvim"; flake = false; };
    telescope-emoji-nvim = { url = "github:xiyaowong/telescope-emoji.nvim"; flake = false; };
    easypick-nvim = { url = "github:axkirillov/easypick.nvim"; flake = false; };
    telescope-git-conflicts-nvim = { url = "github:Snikimonkd/telescope-git-conflicts.nvim"; flake = false; };

    # Startup
    alpha-nvim = { url = "github:goolord/alpha-nvim"; flake = false; };
    fortune-nvim = { url = "github:rubiin/fortune.nvim"; flake = false; };

    # Tmux Integration
    vim-tmux-navigator-nvim = { url = "github:christoomey/vim-tmux-navigator"; flake = false; };
    # nvim-tmux-navigator-nvim = { url = "github:alexghergh/nvim-tmux-navigation"; flake = false; };

    # Stuff not in nixpkgs
    journal-nvim = { url = "github:jakobkhansen/journal.nvim"; flake = false; };
    tiny-code-action-nvim = { url = "github:rachartier/tiny-code-action.nvim"; flake = false; };
    tiny-devicons-auto-colors-nvim = { url = "github:rachartier/tiny-devicons-auto-colors.nvim"; flake = false; };
    markdown-toc-nvim = { url = "github:ChuufMaster/markdown-toc"; flake = false; };

    # UI and Aesthetics
    rose-pine-nvim = { url = "github:rose-pine/neovim"; flake = false; };
    nvim-lualine-nvim = { url = "github:nvim-lualine/lualine.nvim"; flake = false; };
    helpview-nvim = { url = "github:OXY2DEV/helpview.nvim"; flake = false; };
    markview-nvim = { url = "github:OXY2DEV/markview.nvim"; flake = false; };
    nvim-web-devicons-nvim = { url = "github:nvim-tree/nvim-web-devicons"; flake = false; };
    dressing-nvim = { url = "github:stevearc/dressing.nvim"; flake = false; };

    # Writing
    mkdnflow-nvim = { url = "github:jakewvincent/mkdnflow.nvim"; flake = false; };
    quarto-nvim = { url = "github:quarto-dev/quarto-nvim"; flake = false; };
    otter-nvim = { url = "github:jmbuhr/otter.nvim"; flake = false; };

    # Image Handling
    img-clip-nvim = { url = "github:HakonHarnes/img-clip.nvim"; flake = false; };
    image-nvim = { url = "github:3rd/image.nvim"; flake = false; };

    # Terminal Integration
    toggleterm-nvim = { url = "github:akinsho/toggleterm.nvim"; flake = false; };

    # Git Integration
    neogit-nvim = { url = "github:NeogitOrg/neogit"; flake = false; };

    # Marks
    marks-nvim = { url = "github:chentoast/marks.nvim"; flake = false; };

    # Keybinds
    which-key-nvim = { url = "github:folke/which-key.nvim"; flake = false; };

    # Nix Direnv Integration
    nix-develop-nvim = { url = "github:figsoda/nix-develop.nvim"; flake = false; };

    # Colors
    colorize-lua-nvim = { url = "github:norcalli/nvim-colorizer.lua"; flake = false; };

    # Other
    cellular-automaton-nvim = { url = "github:Eandrju/cellular-automaton.nvim"; flake = false; };

    # Vim Habits
    # hardtime-nvim
    # precognition-nvim
    # }}}
  };
}
