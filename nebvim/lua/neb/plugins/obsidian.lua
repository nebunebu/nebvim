return {
	"obsidian",
	ft = { "markdown" },
	-- cmd = {
	-- 	"",
	-- },
	keys = {
		{ "<leader>o", group = "Obsidian" },
		{ "<leader>of", group = "Obsidian Find" },
		{ "<leader>off", "<cmd>ObsidianQuickSwitch<CR>", desc = "Find file in vault" },
		{ "<leader>ofg", "<cmd>ObsidianSearch<CR>", desc = "rg vault" },
		{ "<leader>ofl", "<cmd>ObsidianLinks<CR>", desc = "Find Links in Current Buffer" },
		{ "<leader>ofb", "<cmd>ObsidianBacklinks<CR>", desc = "Find Backlinks in Current Buffer" },
		{ "<leader>oft", "<cmd>ObsidianTags<CR>", desc = "Find Tags in Vault" },
		{ "<leader>on", group = "Obsidian New" },
		{ "<leader>onn", "<cmd>ObsidianNew<CR>", desc = "Open a new note" },
		{ "<leader>ont", "<cmd>ObsidianNewFromTemplate<CR>", desc = "Create a New Note from a Template" },
	},

	-- "<cmd>ObsidianFollowLink<CR>",
	-- "<cmd>ObsidianBacklinks<CR>",
	-- "<cmd>ObsidianTags<CR>",
	-- "<cmd>ObsidianToday<CR>",
	-- "<cmd>ObsidianTemplate<CR>",
	-- "<cmd>ObsidianSearch<CR>",
	-- "<cmd>ObsidianLink<CR>",
	-- "<cmd>ObsidianLinkNew<CR>",
	-- "<cmd>ObsidianLinks<CR>",
	-- "<cmd>ObsidianExtractNote<CR>",
	-- "<cmd>ObsidianWorkspace<CR>",
	-- "<cmd>ObsidianPasteImg<CR>",
	-- "<cmd>ObsidianRename<CR>",
	-- "<cmd>ObsidianToggleCheckbox<CR>",
	-- "<cmd>ObsidianNewFromTemplate<CR>",
	-- "<cmd>ObsidianTOC<CR>",
	--
	-- mode = { "x" },
	-- { "<leader>onl", "<cmd>ObsidianLinkNew<CR>", desc = "Create a new link from visually selected text" },
	-- { "<", "<gv", desc = "Dedent and keep selection" },
	-- { ">", ">gv", desc = "Indent and keep selection" },

	after = function()
		require("obsidian").setup({
			workspaces = {
				{
					name = ".vault",
					path = "~/.vault",
				},
			},
			completion = {
				nvim_cmp = false,
				min_chars = 2,
			},
			new_notes_location = "current_dir",
			preferred_link_style = "markdown",
			disable_frontmatter = false,
			-- open_app_foreground = true,
			picker = {
				name = "telescope.nvim",
			},
			sort_by = "modified",
			sort_reversed = true,

			open_notes_in = "current",

			ui = {
				enable = false, -- set to false to disable all additional syntax features
				update_debounce = 200, -- update delay after a text change (in milliseconds)
				max_file_length = 5000, -- disable UI features for files with more than this many lines
				-- Define how various check-boxes are displayed
				checkboxes = {
					-- NOTE: the 'char' value has to be a single character, and the highlight groups are defined below.
					[" "] = { char = "󰄱", hl_group = "ObsidianTodo" },
					["x"] = { char = "", hl_group = "ObsidianDone" },
					[">"] = { char = "", hl_group = "ObsidianRightArrow" },
					["~"] = { char = "󰰱", hl_group = "ObsidianTilde" },
					["!"] = { char = "", hl_group = "ObsidianImportant" },
					-- Replace the above with this if you don't have a patched font:
					-- [" "] = { char = "☐", hl_group = "ObsidianTodo" },
					-- ["x"] = { char = "✔", hl_group = "ObsidianDone" },

					-- You can also add more custom ones...
				},
				-- Use bullet marks for non-checkbox lists.
				bullets = { char = "•", hl_group = "ObsidianBullet" },
				external_link_icon = { char = "", hl_group = "ObsidianExtLinkIcon" },
				-- Replace the above with this if you don't have a patched font:
				-- external_link_icon = { char = "", hl_group = "ObsidianExtLinkIcon" },
				reference_text = { hl_group = "ObsidianRefText" },
				highlight_text = { hl_group = "ObsidianHighlightText" },
				tags = { hl_group = "ObsidianTag" },
				block_ids = { hl_group = "ObsidianBlockID" },
				hl_groups = {
					-- The options are passed directly to `vim.api.nvim_set_hl()`. See `:help nvim_set_hl`.
					ObsidianTodo = { bold = true, fg = "#f78c6c" },
					ObsidianDone = { bold = true, fg = "#89ddff" },
					ObsidianRightArrow = { bold = true, fg = "#f78c6c" },
					ObsidianTilde = { bold = true, fg = "#ff5370" },
					ObsidianImportant = { bold = true, fg = "#d73128" },
					ObsidianBullet = { bold = true, fg = "#89ddff" },
					ObsidianRefText = { underline = true, fg = "#c792ea" },
					ObsidianExtLinkIcon = { fg = "#c792ea" },
					ObsidianTag = { italic = true, fg = "#89ddff" },
					ObsidianBlockID = { italic = true, fg = "#89ddff" },
					ObsidianHighlightText = { bg = "#75662e" },
				},
			},
		})
	end,
}
