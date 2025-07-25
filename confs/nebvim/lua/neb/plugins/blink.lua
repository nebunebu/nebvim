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
			"avante",
			"lsp",
			"buffer",
			"path",
			-- "luasnip",
		},
		providers = {
			avante = {
				module = "blink-cmp-avante",
				name = "Avante",
				opts = {
					-- options for blink-cmp-avante
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
