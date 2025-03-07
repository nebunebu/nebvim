{ pkgs, ... }:
let
  # TODO: move functions to ./nix/lib.nix
  mkLazyLoadable = pluginName: {
    ${pluginName} = pkgs.vimPlugins.${pluginName}.overrideAttrs (_: {
      optional = true;
    });
  };

  mkLazyLoadables =
    plugins: builtins.foldl' (acc: plugin: acc // (mkLazyLoadable plugin)) { } plugins;
in
mkLazyLoadables [
  "markview-nvim"
  "urlview-nvim"
  "triptych-nvim"
  "telescope-nvim"
  "telescope-fzf-native-nvim"

  "cellular-automaton-nvim"
  "codecompanion-nvim"
  "helpview-nvim"
  "nix-develop-nvim"
  "nvim-dap-ui"
  "nvim-nio"
  "nvim-test"
  "obsidian-nvim"
  "oil-nvim"
  "otter-nvim"
  "quarto-nvim"
  "rustaceanvim"
  "telescope-dap-nvim"
  "telescope-manix"
  "triptych-nvim"
  "urlview-nvim"
]
// {
  inherit (pkgs.vimPlugins.nvim-treesitter)
    withAllGrammars
    ;

  inherit (pkgs.vimPlugins)
    comment-nvim
    lz-n
    rose-pine
    which-key-nvim
    vim-tmux-navigator
    lualine-nvim
    barbecue-nvim
    blink-cmp
    conform-nvim
    dressing-nvim
    fidget-nvim
    helpview-nvim
    image-nvim
    img-clip-nvim
    indent-blankline-nvim
    luasnip
    marks-nvim
    mini-animate
    nerdy-nvim
    nvim-autopairs
    nvim-colorizer-lua
    nvim-lint
    nvim-lspconfig
    nvim-navic
    nvim-surround
    nvim-treesitter-endwise
    nvim-web-devicons
    one-small-step-for-vimkind
    plenary-nvim
    snacks-nvim
    telescope-emoji-nvim
    telescope-git-conflicts-nvim
    tiny-devicons-auto-colors-nvim
    tiny-inline-diagnostic-nvim
    todo-comments-nvim

    # NOTE: not in nixpkgs
    # volt-nvim
    # tiny-code-action-nvim
    # telescope-repo-nvim
    # telescope-heading-nvim
    # taskwarrior-nvim
    # px-to-rem-nvim
    # haunt-nvim
    # minty-nvim
    # git-dev-nvim
    # global-note-nvim
    ;
}
