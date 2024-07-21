require("which-key").setup({})

local wk = require("which-key")

wk.add({
	{
		mode = "n",
		{ "<leader>h", "<cmd>nohlsearch<cr>", desc = "dehighlight search" },
		{ "<leader>/", "<cmd>lua require('Comment.api').toggle.linewise.current()<cr>", desc = "Toggle Comment" },
		{ "<leader>t", "<cmd>Triptych<cr>", desc = "Open Triptych" },
		{ "<leader>p", "<cmd>PasteImage<cr>", desc = "Paste Image" },
		{ "<leader>b", "<cmd>AlphaTab<cr>", desc = "Open Alpha in new tab" },

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
		-- NOTE: project keybinds
		-- Default mappings (normal mode):
		-- d 	delete currently selected project
		-- r 	rename currently selected project
		-- c 	create a project*
		-- s 	search inside files within your project
		-- b 	browse inside files within your project
		-- w 	change to the selected project's directory without opening it
		-- R 	find a recently opened file within your project
		-- f 	find a file within your project (same as <CR>)
		-- o 	change current cd scope
		{ "<leader>fp", "<cmd>Telescope project<CR>", desc = "Find in project" },
		{ "<leader>fc", group = "telescope character" },
		{ "<leader>fcg", "<cmd>Telescope nerdy<CR>", desc = "Find nerdfont glyph" },
		{ "<leader>fce", "<cmd>Telescope emoji<CR>", desc = "Find emoji" },
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
