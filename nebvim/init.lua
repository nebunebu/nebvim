require("neb.options")
require("neb.colorscheme")
require("neb.autocmd")

require("neb.plugins.fortune") -- must be before alpha
require("neb.plugins.alpha")

-- FIX: Broken
-- require("neb.plugins.direnv")
require("neb.plugins.autopairs")
require("neb.plugins.barbecue")
require("neb.plugins.cellular-automaton")
require("neb.plugins.colorizer")
require("neb.plugins.conform")
require("neb.plugins.smear-cursor")

require("neb.commands")

require("neb.plugins.minty")
-- require("neb.plugins.spaceless")
require("neb.plugins.git-dev")
require("neb.plugins.urlview")

-- NOTE: Snacks
require("neb.plugins.snacks").setup({})

-- NOTE: DAP
require("neb.plugins.dap.dap-ui")
require("neb.plugins.dap.one-small-step-for-vimkind")

require("neb.plugins.easypick")
require("neb.plugins.endwise")
require("neb.plugins.helpview")

-- FIX: Broken
-- require("neb.plugins.image")

require("neb.plugins.img-clip")
require("neb.plugins.nvim-lint")
require("neb.plugins.lualine")
require("neb.plugins.luasnip")

-- FIX: Broken
-- require("neb.plugins.markview")

require("neb.plugins.nix-develop")
require("neb.plugins.oil")
require("neb.plugins.quarto")
require("neb.plugins.rainbow-delimiters")
require("neb.plugins.surround")
require("neb.plugins.telescope")
require("neb.plugins.todo-comments")
require("neb.plugins.toggleterm")
require("neb.plugins.treesitter")
require("neb.plugins.triptych")
require("neb.plugins.which-key")

require("neb.plugins.haunt")
require("neb.plugins.yamlmatter")

require("neb.plugins.obsidian")

require("neb.plugins.tiny-inline-diagnostic")
require("neb.plugins.tiny-code-action")
require("neb.plugins.tiny-devicons-auto-colors")

-- NOTE: Lsp
require("neb.plugins.lsp.lsp-zero")
require("neb.plugins.lsp.lspconfig")
require("neb.plugins.lsp.fidget")

-- NOTE: Cmp
require("neb.plugins.cmp")
