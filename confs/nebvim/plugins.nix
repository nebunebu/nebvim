{ pkgs, lib, ... }:
let
  vimPlugins = lib.lz.fromVimPlugins [
    "urlview-nvim"
    "triptych-nvim"
    "telescope-nvim"
    "telescope-fzf-native-nvim"
    "cellular-automaton-nvim"
    "helpview-nvim"
    "nvim-dap-ui"
    "nvim-nio"
    "nvim-test"
    "oil-nvim"
    "rustaceanvim"
    "telescope-dap-nvim"
    "telescope-manix"
    "blink-cmp-avante"
    "avante-nvim"
    "nui-nvim"
    "render-markdown-nvim"
    "gitsigns-nvim"
    "outline-nvim"
    "fidget-nvim"
    "fortune-nvim"
    "nvim-highlight-colors"
    "comment-nvim"
    "lz-n"
    "rose-pine"
    "which-key-nvim"
    "vim-tmux-navigator"
    "lualine-nvim"
    "barbecue-nvim"
    "blink-cmp"
    "conform-nvim"
    "dressing-nvim"
    "img-clip-nvim"
    "indent-blankline-nvim"
    "luasnip"
    "marks-nvim"
    "nerdy-nvim"
    "rainbow-delimiters-nvim"
    "nvim-autopairs"
    "nvim-lint"
    "nvim-navic"
    "nvim-surround"
    "nvim-treesitter-endwise"
    "nvim-web-devicons"
    "one-small-step-for-vimkind"
    "plenary-nvim"
    "snacks-nvim"
    "telescope-emoji-nvim"
    "telescope-git-conflicts-nvim"
    "tiny-devicons-auto-colors-nvim"
    "tiny-inline-diagnostic-nvim"
    "todo-comments-nvim"
  ];

  extraPlugins = lib.lz.fromExtraVimPlugins [
    "direnv-nvim"
  ];

  customPlugins = [
    (lib.lz.build {
      pname = "neowiki-nvim";
      version = "unstable-2025-06-27";
      src = pkgs.fetchFromGitHub {
        owner = "echaya";
        repo = "neowiki.nvim";
        rev = "411766d31c76dc2613fca6ec45d025bac7ee1ac4";
        hash = "sha256-soMQN7oDx9HVS/crNcu6ilYoOtGXP/aMk7NfPYUjsXg=";
      };
    })
  ];

  optionalPlugins = vimPlugins ++ extraPlugins ++ customPlugins;
in
lib.lz.mkOptional optionalPlugins
// {
  inherit (pkgs.vimPlugins.nvim-treesitter) withAllGrammars;
}
