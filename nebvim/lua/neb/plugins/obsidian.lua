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

	after = function()
		require("obsidian").setup({
			workspaces = {
				{
					name = ".vault",
					path = "~/.vault",
					overrides = {
						notes_subdir = [[32 - Capture]],
					},
				},
			},
			completion = {
				nvim_cmp = false,
				min_chars = 2,
			},

			new_notes_location = "notes_subdir",
			open_notes_in = "vsplit",

			preferred_link_style = "markdown",
			disable_frontmatter = false,
			-- open_app_foreground = true,
			picker = {
				name = "telescope.nvim",
			},
			sort_by = "modified",
			sort_reversed = true,
			-- open_notes_in = [[32 - Capture]],
			ui = {
				enable = false, -- set to false to disable all additional syntax features
			},
		})
	end,
}
