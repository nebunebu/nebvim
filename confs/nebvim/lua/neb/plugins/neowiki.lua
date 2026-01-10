return {
	"neowiki",
	cmd = { "Neowiki" },
	ft = "markdown",
	keys = {
		{ "<leader>ww", "<cmd>lua require('neowiki').open_wiki()<cr>", desc = "Open Wiki" },
		{ "<leader>wT", "<cmd>lua require('neowiki').open_wiki_new_tab()<cr>", desc = "Open Wiki in Tab" },
	},
	after = function()
		require("neowiki").setup({
			wiki_dirs = {
				{ name = "quartz", path = "~/Projects/quartz/content" },
				{ name = "scratchpad", path = "~/.scratchpad" },
			},
			index_file = "index.md",
			discover_nested_roots = true,

			keymaps = {
				action_link = "<CR>",
				action_link_vsplit = "<S-CR>",
				action_link_split = "<C-CR>",
				toggle_task = "<leader>wt",
				next_link = "<Tab>",
				prev_link = "<S-Tab>",
				jump_to_index = "<Backspace>",
				delete_page = "<leader>wd",
				cleanup_links = "<leader>wc",
				navigate_back = "[[",
				navigate_forward = "]]",
			},

			floating_wiki = {
				open = {
					relative = "editor",
					width = 0.85,
					height = 0.85,
					border = "rounded",
				},

				style = {},
			},
		})
	end,
}
