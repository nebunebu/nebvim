require("which-key").setup({})

local wk = require("which-key")

wk.add({
	{
		mode = "n",
		{ "<leader>h", "<cmd>nohlsearch<cr>", desc = "dehighlight search" },
		{ "<leader>/", "<cmd>lua require('Comment.api').toggle.linewise.current<cr>", desc = "Toggle Comment" },
		{ "<leader>t", "<cmd>Triptych<cr>", desc = "Open Triptych" },
		{ "<leader>p", "<cmd>PasteImage<cr>", desc = "Paste Image" },

		-- Markdown
		{ "<leader>m", group = "markdown", icon = " " },
		{ "<leader>mv", "<cmd>Markview toggleAll<cr>", desc = "Toggle Markview" },
		{ "<leader>mc", "<cmd>GenerateTOC<cr>", desc = "Generate Markodwn TOC" },

		-- Direnv
		{ "<leader>d", group = "direnv", icon = "" },

		-- Telescope
		{ "<leader>f", group = "telescope" },
		{ "<leader>fc", "<cmd>Telescope current_buffer_fuzzy_find<CR>", desc = "Find in current buffer" },
		{ "<leader>ff", "<cmd>Telescope find_files<CR>", desc = "Find files" },
		{ "<leader>fg", "<cmd>Telescope live_grep<CR>", desc = "Find with live_grep" },
		{ "<leader>fh", "<cmd>Telescope help_tags<CR>", desc = "Find help tags" },
		{ "<leader>fm", "<cmd>Telescope man_pages<CR>", desc = "Find man pages" },
		{ "<leader>fo", "<cmd>Telescope oldfiles<CR>", desc = "Find old files" },
		-- { "<leader>fp", "<cmd>Telescope projects<CR>", desc = "Find in projects" },
	},
	{
		mode = { "x" },
		{ "<", "<gv", desc = "Dedent and keep selection" },
		{ ">", ">gv", desc = "Indent and keep selection" },
		{
			"<leader>/",
			"<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
			desc = "Toggle Comment",
		},
	},
})
