{ pkgs, ... }:

# Plugins from nixpkgs-unstable

{
  inherit (pkgs.vimPlugins)

    # Utilities
    plenary-nvim
    mini-nvim

    vim-tridactyl

    # Colorscheme
    rose-pine

    # Testing
    nvim-test

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

    urlview-nvim


    # DAP
    nvim-dap
    # nvim-dap-virtualtext
    nvim-dap-ui
    nvim-nio
    one-small-step-for-vimkind
    telescope-dap-nvim

    # Linting
    nvim-lint
    tiny-inline-diagnostic-nvim

    # Formatting
    conform-nvim

    # Telescope
    telescope-nvim
    telescope-fzf-native-nvim
    # telescope-manix

    # Editing Support
    indent-blankline-nvim
    nvim-autopairs
    nvim-treesitter-endwise
    rainbow-delimiters-nvim
    nvim-surround

    # Comments
    comment-nvim
    todo-comments-nvim

    # File Explorers
    triptych-nvim
    oil-nvim

    # Status Line
    lualine-nvim
    # lualine-lsp-progress
    # git-prompt-string-lualine-nvim

    # UI and Aesthetics
    helpview-nvim
    markview-nvim
    nvim-web-devicons
    dressing-nvim

    # Image Handling
    img-clip-nvim
    image-nvim

    # Git
    neogit

    # Marks
    marks-nvim

    # Keybinds
    which-key-nvim

    # Nix Direnv
    nix-develop-nvim

    # Colors
    nvim-colorizer-lua


    # Writing
    obsidian-nvim
    quarto-nvim
    otter-nvim

    # Startup
    fortune-nvim
    alpha-nvim

    # Tmux Integration
    vim-tmux-navigator
    # nvim-tmux-navigator-nvim = { url = "github:alexghergh/nvim-tmux-navigation"; flake = false; };

    # Other
    cellular-automaton-nvim
    ;
}

