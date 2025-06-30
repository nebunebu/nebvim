require("neb.options")
require("neb.colorscheme")
require("neb.autocmd")
require("neb.commands")

require("lz.n").load("neb.lz")

local lz_plugins = {
	"triptych",
	"cellular-automaton",
	"dap.dap-ui",
	"helpview",
	"taskwarrior",
	"telescope",
	"urlview",
}

require("neb.lz").setup(lz_plugins)

require("neb.plugins.nvim-highlight-colors")

require("neb.plugins.avante")
require("neb.plugins.blink-cmp-avante")

require("neb.plugins.direnv")
require("neb.plugins.nvim-highlight-colors")

require("neb.plugins.lualine")
require("neb.plugins.neowiki")
require("neb.plugins.treesitter")
require("neb.plugins.which-key")

require("neb.plugins.blink")
require("neb.plugins.conform")
require("neb.plugins.endwise")
require("neb.plugins.lsp.lspconfig")
require("neb.plugins.nvim-lint")
require("neb.plugins.rainbow-delimiters")
require("neb.plugins.snacks").setup()
require("neb.plugins.surround")
require("neb.plugins.todo-comments")

require("lz.n").load(require("neb.plugins.dap.dap-ui"))
require("neb.plugins.autopairs")
require("neb.plugins.barbecue")
require("neb.plugins.dap.bashdb")
require("neb.plugins.dap.one-small-step-for-vimkind")
-- require("neb.plugins.git-dev")
-- require("neb.plugins.haunt")
-- require("neb.plugins.image")
require("neb.plugins.img-clip")
require("neb.plugins.lsp.fidget")
require("neb.plugins.luasnip")
-- require("neb.plugins.minty")
require("neb.plugins.nvim-test")
require("neb.plugins.oil")
-- require("neb.plugins.px-to-rem")
require("neb.plugins.rustaceanvim")
-- require("neb.plugins.tiny.code-action")
require("neb.plugins.tiny.devicons-auto-colors")
require("neb.plugins.tiny.inline-diagnostic")
