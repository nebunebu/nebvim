require("neb.options")
require("neb.colorscheme")
require("neb.autocmd")
require("neb.commands")
require("neb.filetype")

require("lz.n").load("neb.lz")

local lz_plugins = {
	"comment",
	"triptych",
	"cellular-automaton",
	"dap.dap-ui",
	"helpview",
	"urlview",
	"neowiki",
	"gitsigns",
	-- "which-key",
	"conform",
	"oil",
	"nvim-lint",
	"todo-comments",
	"luasnip",
	"neotest",
	"surround",
	"endwise",
	"rainbow-delimiters",
	"autopairs",
	"nvim-highlight-colors",
	"img-clip",
	"rustaceanvim",
	"snipbrowzurr",
	"debugmaster",
	"spellwarn",
}

-- require("neb.plugins.git-dev")
-- require("neb.plugins.haunt")
-- require("neb.plugins.image")
-- require("neb.plugins.px-to-rem")
--
-- NOTE: prob should be in ./lua/neb/plugins/lsp/ui/
-- require("neb.plugins.barbecue")

require("neb.lz").setup(lz_plugins)

require("neb.plugins.lsp")

require("neb.plugins.grug-far")
require("neb.plugins.which-key")

require("neb.plugins.direnv")

require("neb.plugins.lualine")
require("neb.plugins.treesitter")
require("neb.plugins.kulala")

require("neb.plugins.blink")
require("neb.plugins.snacks").setup()

require("lz.n").load(require("neb.plugins.dap.dap-ui"))
require("neb.plugins.dap.bashdb") -- Patched to work with Bash 5.3+
require("neb.plugins.dap.one-small-step-for-vimkind")
require("neb.plugins.dap.delve")

-- require("neb.plugins.tiny.code-action")
require("neb.plugins.tiny.devicons-auto-colors")
require("neb.plugins.tiny.inline-diagnostic")
