{ pkgs, ... }:
let
  mkLazyLoadable = pluginName: {
    ${pluginName} = pkgs.vimPlugins.${pluginName}.overrideAttrs (_: { optional = true; });
  };
  mkLazyLoadables = plugins: builtins.foldl' (acc: plugin: acc // (mkLazyLoadable plugin)) { } plugins;
in
mkLazyLoadables [
  "cellular-automaton-nvim"
  "markview-nvim"
  "nvim-test"
  "urlview-nvim"

  # Quarto
  "quarto-nvim"
  "otter-nvim"

  # "oil-nvim"
  "triptych-nvim"
  "nix-develop-nvim"
  # Debugging
  "nvim-dap-ui"
  "nvim-nio"
  # Telescope
  "telescope-nvim"
  "telescope-fzf-native-nvim"
  "telescope-dap-nvim"
] // {

  # TODO: add as lazy loaded
  # - nvim-dap
  # - helpview-nvim
  ## markdown ft
  # - image-nvim
  # -img-clip-nvim
  # obsidian-nvim

  inherit (pkgs.vimPlugins)

    lz-n

    # Utilities
    plenary-nvim
    mini-nvim

    vim-tridactyl

    # Colorscheme
    rose-pine

    # # DAP
    # nvim-dap-virtualtext
    one-small-step-for-vimkind

    # LSP
    lsp-zero-nvim
    nvim-lspconfig
    lspkind-nvim
    fidget-nvim
    barbecue-nvim
    nvim-navic

    # Snippets
    luasnip

    # Completion
    nvim-cmp
    cmp-nvim-lsp
    # cmp-nvim-lua
    cmp-buffer
    cmp_luasnip
    cmp-async-path


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
    # lualine-lsp-progress
    # git-prompt-string-lualine-nvim

    # UI and Aesthetics
    helpview-nvim
    nvim-web-devicons
    dressing-nvim

    # Image Handling
    img-clip-nvim
    image-nvim

    # Git
    # TODO: maybe just remove
    neogit

    # Marks
    marks-nvim

    # Keybinds
    which-key-nvim


    # Colors
    nvim-colorizer-lua


    # Writing
    obsidian-nvim

    # Startup
    fortune-nvim
    alpha-nvim

    # Tmux Integration
    vim-tmux-navigator
    ;
}
