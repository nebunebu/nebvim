require("blink.cmp").setup({
	keymap = {
		preset = "enter",
		["<Tab>"] = {
			"select_next",
			"snippet_forward",
			"fallback",
		},

		["<S-Tab>"] = {
			"select_prev",
			"snippet_backward",
			"fallback",
		},
		["<C-d>"] = { "show", "show_documentation", "hide_documentation" },
		["<C-e>"] = { "hide" },
		["<C-b>"] = { "scroll_documentation_up", "fallback" },
		["<C-f>"] = { "scroll_documentation_down", "fallback" },
	},

	appearance = {
		use_nvim_cmp_as_default = false,
		nerd_font_variant = "mono",
	},

	sources = {
		default = {
			"lsp", -- Language server completions
			"luasnip", -- Snippet completions (LuaSnip integration)
			"buffer", -- Current buffer text
			"path", -- File system paths
		},
		providers = {
			-- LuaSnip provider configuration
			luasnip = {
				name = "luasnip",
				module = "blink.cmp.sources.luasnip",
				score_offset = 10, -- Prioritize snippets slightly over buffer completions
				opts = {
					use_show_condition = true, -- Only show snippets that match the current context
					show_autosnippets = false, -- Don't show autosnippets in completion menu
				},
			},
		},

		-- cmdline = {
		-- 	sources = {},
		-- },
	},

	completion = {
		list = {
			max_items = 15,
		},

		menu = {
			border = "rounded",
			-- auto_show = function(ctx)
			-- 	return ctx.mode ~= "cmdline" or not vim.tbl_contains({ "/", "?" }, vim.fn.getcmdtype())
			-- end,
		},

		documentation = {
			auto_show = true,
			auto_show_delay_ms = 250,
			window = {
				border = "rounded",
			},
		},
	},

	signature = {
		enabled = true,
		window = {
			border = "rounded",
		},
	},
})
