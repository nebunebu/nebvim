{ pkgs, ... }:
let
  mkLazyLoadable = pluginName: {
    ${pluginName} = pkgs.vimPlugins.${pluginName}.overrideAttrs (_: {
      optional = true;
    });
  };
  mkLazyLoadables =
    plugins: builtins.foldl' (acc: plugin: acc // (mkLazyLoadable plugin)) { } plugins;
in
mkLazyLoadables [
  "cellular-automaton-nvim"
  "markview-nvim"
  "nvim-test"
  "urlview-nvim"
  "rustaceanvim"
  # Quarto
  "quarto-nvim"
  "otter-nvim"
  "oil-nvim"
  "triptych-nvim"
  "nix-develop-nvim"
  # Debugging
  "nvim-dap-ui"
  "nvim-nio"
  # Telescope
  "telescope-nvim"
  "telescope-fzf-native-nvim"
  "telescope-manix"
  "telescope-dap-nvim"
  "helpview-nvim"
  # Markdown
  "obsidian-nvim"
]
// {

  # TODO: add as lazy loaded
  # - nvim-dap
  ## markdown ft
  # - image-nvim
  # -img-clip-nvim

  inherit (pkgs.vimPlugins)
    # NOTE: don't lazy load
    lz-n
    blink-cmp
    plenary-nvim
    rose-pine
    mini-animate

    # Utilities

    vim-tridactyl

    # Colorscheme

    # # DAP
    # nvim-dap-virtualtext
    one-small-step-for-vimkind

    # LSP
    nvim-lspconfig
    fidget-nvim
    barbecue-nvim
    nvim-navic

    # Snippets
    luasnip

    # Linting
    nvim-lint
    tiny-inline-diagnostic-nvim

    # Formatting
    conform-nvim

    # Editing Support
    indent-blankline-nvim
    nvim-autopairs
    nvim-treesitter-endwise
    rainbow-delimiters-nvim
    nvim-surround

    # Comments
    comment-nvim
    todo-comments-nvim

    # Status Line
    lualine-nvim

    # UI and Aesthetics
    helpview-nvim
    nvim-web-devicons
    dressing-nvim

    # Image Handling
    img-clip-nvim
    image-nvim

    # Marks
    marks-nvim

    # Keybinds
    which-key-nvim

    # Colors
    nvim-colorizer-lua

    # Startup
    fortune-nvim
    alpha-nvim

    # Tmux Integration
    vim-tmux-navigator
    ;
}
