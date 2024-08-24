{ pkgs, ... }:
{
  inherit (pkgs.vimPlugins)
    image-nvim
    hardtime-nvim
    precognition-nvim
    nvim-surround
    toggleterm-nvim
    nix-develop-nvim
    triptych-nvim
    markview-nvim
    oil-nvim
    tiny-inline-diagnostic-nvim


    nvim-colorizer-lua
    img-clip-nvim

    rose-pine# colorscheme
    which-key-nvim
    plenary-nvim
    nvim-web-devicons
    nvim-navic
    barbecue-nvim
    lualine-nvim
    alpha-nvim
    fortune-nvim

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
    cmp-async-path

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

    # Telescope
    telescope-nvim
    telescope-project-nvim
    # telescope-manix
    quarto-nvim
    otter-nvim
    dressing-nvim

    mkdnflow-nvim

    # tmux
    vim-tmux-navigator
    ;
}
