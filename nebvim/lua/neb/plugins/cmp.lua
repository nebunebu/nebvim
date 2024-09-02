local cmp = require("cmp")
local cmp_action = require("lsp-zero").cmp_action()

local sources = {
	{ name = "luasnip" },
	{ name = "nvim_lsp" },
	{ name = "buffer" },
	{ name = "async_path" },
	-- { name = "cmdline" },
	-- { name = "cmd-cmdline-history" },
	-- { name = "obsidian.nvim" },
	-- { name = "dap" },
	-- { name = "vim-dadbod-completion" },
	-- { name = "cmp_yanky" },
	-- { name = "dotenv" },
}

local formatting = {
	fields = { "abbr", "kind", "menu" },
	format = require("lspkind").cmp_format({
		mode = "symbol_text", -- show only symbol annotations
		maxwidth = 50, -- prevent the popup from showing more than provided characters
		ellipsis_char = "...", -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead
	}),
}

cmp.setup({
	sources = sources,
	formatting = formatting,
	preselect = "item",
	completion = {
		completeopt = "menu,menuone,noinsert",
	},
	mapping = cmp.mapping.preset.insert({
		["<CR>"] = cmp.mapping.confirm({ select = true }),
		["<Tab>"] = cmp_action.luasnip_supertab(),
		["<S-Tab>"] = cmp_action.luasnip_shift_supertab(),
	}),
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
})
