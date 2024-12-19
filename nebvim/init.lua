require("neb.options")
require("neb.colorscheme")
require("neb.autocmd")

require("neb.debug")

require("lz.n").load("neb.lz")

require("lz.n").load(require("neb.plugins.taskwarrior"))
require("lz.n").load(require("neb.plugins.urlview"))
require("lz.n").load(require("neb.plugins.markview"))
require("lz.n").load(require("neb.plugins.cellular-automaton"))
require("lz.n").load(require("neb.plugins.triptych"))
require("lz.n").load(require("neb.plugins.nix-develop"))
require("lz.n").load(require("neb.plugins.telescope"))
require("lz.n").load(require("neb.plugins.quarto"))
require("lz.n").load(require("neb.plugins.global-note"))

require("lz.n").load(require("neb.plugins.dap.dap-ui"))

require("neb.plugins.fortune") -- must be before alpha
require("neb.plugins.alpha")

require("neb.plugins.oil")
require("neb.plugins.autopairs")
require("neb.plugins.barbecue")
require("neb.plugins.colorizer")
require("neb.plugins.conform")

require("neb.commands")

require("neb.plugins.minty")
require("neb.plugins.px-to-rem")
require("neb.plugins.git-dev")

require("neb.plugins.nvim-test")

-- NOTE: Tiny
require("neb.plugins.tiny.inline-diagnostic")
require("neb.plugins.tiny.code-action")
require("neb.plugins.tiny.devicons-auto-colors")

-- NOTE: Mini
require("neb.plugins.mini.animate")

-- NOTE: Snacks
require("neb.plugins.snacks").setup()

-- NOTE: DAP
require("neb.plugins.dap.dap-ui")
require("neb.plugins.dap.bashdb")
require("neb.plugins.dap.one-small-step-for-vimkind")

require("neb.plugins.easypick")
require("neb.plugins.endwise")
require("neb.plugins.helpview")

-- require("neb.plugins.image")
require("neb.plugins.img-clip")

require("neb.plugins.nvim-lint")
require("neb.plugins.lualine")
require("neb.plugins.luasnip")

require("neb.plugins.rainbow-delimiters")
require("neb.plugins.surround")
require("neb.plugins.todo-comments")
require("neb.plugins.treesitter")
require("neb.plugins.which-key")

require("neb.plugins.haunt")
require("neb.plugins.yamlmatter")

-- require("neb.plugins.obsidian")

-- NOTE: Lsp
-- require("neb.plugins.lsp.lsp-zero")
require("neb.plugins.lsp.lspconfig")
require("neb.plugins.lsp.fidget")

-- NOTE: Cmp
-- require("neb.plugins.cmp")

-- Blink
require("neb.plugins.blink")
