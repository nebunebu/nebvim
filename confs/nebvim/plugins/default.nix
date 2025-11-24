{ pkgs, lib, ... }:
let
  treesitter-kulala-http-grammar = import ./kulala-http-grammar.nix { inherit pkgs; };

  nvim-treesitter-with-kulala =
    pkgs.vimPlugins.nvim-treesitter.withAllGrammars.overrideAttrs
      (finalAttrs: {
        postInstall = finalAttrs.postInstall or "" + ''
          mkdir -p $out/parser
          ln -s ${treesitter-kulala-http-grammar}/parser/kulala_http.so $out/parser/
        '';
      });

  # From nixpkgs
  vimPlugins = lib.lz.fromVimPlugins [
    "lz-n"
    "vim-tmux-navigator"
    "luasnip"
    "nvim-treesitter-endwise"
    "debugmaster-nvim"
    "spellwarn-nvim"
    "kulala-nvim"
    "blink-cmp" # need to set fuzzy if in extraPlugins

    # "neotest"
    # "neotest-python"
    # "neotest-plenary"
    # "neotest-go"
    # "neotest-haskell"
    # "neotest-bash"
    # "neotest-busted"
  ];

  # from NixNeovimPlugins
  extraPlugins = lib.lz.fromExtraVimPlugins [
    "direnv-nvim" # not in nixpkgs
    "tiny-code-action-nvim" # not in nixpkgs

    "Comment-nvim"
    "markview-nvim"
    "nvim-lint"
    "conform-nvim"

    "urlview-nvim"
    "triptych-nvim"
    "cellular-automaton-nvim"
    "helpview-nvim"
    "nvim-dap-ui"
    "nvim-nio"
    "grug-far-nvim"
    "oil-nvim"
    "rustaceanvim"
    "nui-nvim"
    "gitsigns-nvim"
    "outline-nvim"
    "fidget-nvim"
    "nvim-highlight-colors"
    "rose-pine"
    "which-key-nvim"
    "lualine-nvim"
    "barbecue-nvim"
    "dressing-nvim"
    "img-clip-nvim"
    "indent-blankline-nvim"
    "marks-nvim"
    "rainbow-delimiters-nvim"
    "nvim-autopairs"
    "nvim-navic"
    "nvim-surround"
    "nvim-web-devicons"
    "one-small-step-for-vimkind"
    "plenary-nvim"
    "snacks-nvim"
    "tiny-devicons-auto-colors-nvim"
    "tiny-inline-diagnostic-nvim"
    "todo-comments-nvim"
  ];

  customPlugins = import ./custom.nix { inherit pkgs lib; };

  optionalPlugins =
    vimPlugins ++ extraPlugins ++ customPlugins ++ [ nvim-treesitter-with-kulala ]
  # [ pkgs.vimPlugins.nvim-treesitter.withAllGrammars ]
  ;
in
lib.lz.mkOptional optionalPlugins
