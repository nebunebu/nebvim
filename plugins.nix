{ pkgs, ... }:
{
  inherit (pkgs.vimPlugins)
    # Utilities
    plenary-nvim

    # LSP
    lsp-zero-nvim
    nvim-lspconfig
    lspkind-nvim
    fidget-nvim

    # Completion
    luasnip
    nvim-cmp
    cmp-nvim-lsp
    cmp-buffer
    cmp_luasnip
    cmp-async-path

    # NoteTaking
    mkdnflow-nvim

    # File Explorers
    triptych-nvim
    oil-nvim

    # Color
    # Startup
    alpha-nvim
    fortune-nvim

    # Media
    image-nvim

    # Terminal Integration
    # Git
    # Motion

    # Editing Support
    indent-blankline-nvim
    nvim-autopairs
    nvim-treesitter-endwise
    comment-nvim
    todo-comments-nvim

    # Tmux
    vim-tmux-navigator

    # UI and Aesthetics
    rose-pine# colorscheme
    lualine-nvim
    rainbow-delimiters-nvim
    helpview-nvim

    # Formatters and Linters
    nvim-lint
    conform-nvim


    hardtime-nvim
    cellular-automaton-nvim
    precognition-nvim
    nvim-surround
    toggleterm-nvim
    nix-develop-nvim
    markview-nvim
    tiny-inline-diagnostic-nvim


    nvim-colorizer-lua
    img-clip-nvim

    which-key-nvim
    nvim-web-devicons
    nvim-navic
    barbecue-nvim

    marks-nvim
    neogit


    # Telescope
    telescope-nvim
    telescope-project-nvim

    quarto-nvim
    otter-nvim
    dressing-nvim

    ;
}
