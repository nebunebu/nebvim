require("obsidian").setup({
	workspaces = {
		{
			name = "vault",
			path = "~/.vault",
		},
	},

	-- notes_subdir = "03 - Notes",

	-- daily_notes = {
	-- },

	completion = {
		nvim_cmp = true,
		min_chars = 2,
	},

	new_notes_location = "current_dir",

	preferred_link_style = "markdown",

	disable_frontmatter = false,

	-- open_app_foreground = true,
	--
	picker = {
		name = "telescope.nvim",
	},

	sort_by = "modified",
	sort_reversed = true,

	open_notes_in = "current",
})
