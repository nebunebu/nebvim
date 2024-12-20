require("neb.options")
require("neb.colorscheme")
require("neb.autocmd")
require("neb.commands")

require("lz.n").load("neb.lz")

local lz_plugins = {
	"cellular-automaton",
	"helpview",
	"triptych",
	"nix-develop",
	"global-note",
	"urlview",
	"taskwarrior",
	"telescope",
	-- NOTE: I don't think this is working with nested dirs
	-- "dap.dap-ui",
	-- NOTE: Not Lazy Loading
	"markview",
	"quarto",
}

require("neb.lz").setup(lz_plugins)

-- require("lz.n").load(require("neb.plugins.dap.dap-ui"))

require("neb.plugins.fortune") -- must be before alpha
require("neb.plugins.alpha")

require("neb.plugins.oil")
require("neb.plugins.autopairs")
require("neb.plugins.barbecue")
require("neb.plugins.colorizer")
require("neb.plugins.conform")

require("neb.plugins.minty")
-- require("neb.plugins.px-to-rem")
require("neb.plugins.git-dev")

require("neb.plugins.nvim-test")

-- NOTE: Tiny
require("neb.plugins.tiny.inline-diagnostic")
require("neb.plugins.tiny.code-action")
require("neb.plugins.tiny.devicons-auto-colors")

require("neb.plugins.mini.animate")

-- NOTE: Snacks
require("neb.plugins.snacks").setup()

require("neb.plugins.dap.bashdb")
require("neb.plugins.dap.one-small-step-for-vimkind")

require("neb.plugins.endwise")

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
require("neb.plugins.lsp.lspconfig")
require("neb.plugins.lsp.fidget")

-- Blink
require("neb.plugins.blink")
