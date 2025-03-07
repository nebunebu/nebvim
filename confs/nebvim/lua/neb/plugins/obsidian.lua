return {
	"obsidian",
	ft = { "markdown" },
	-- cmd = {""},
	keys = {
		{ "<leader>o", group = "Obsidian" },

		{ "<leader>of", group = "Obsidian Find" },
		{ "<leader>ofb", "<cmd>ObsidianBacklinks<CR>", desc = "Find Backlinks in Current Buffer" },
		{ "<leader>off", "<cmd>ObsidianQuickSwitch<CR>", desc = "Find file in vault" },
		{ "<leader>ofg", "<cmd>ObsidianSearch<CR>", desc = "rg vault" },
		{ "<leader>ofl", "<cmd>ObsidianLinks<CR>", desc = "Find Links in Current Buffer" },
		{ "<leader>oft", "<cmd>ObsidianTags<CR>", desc = "Find Tags in Vault" },

		{ "<leader>on", group = "Obsidian New" },
		{ "<leader>onn", "<cmd>ObsidianNew<CR>", desc = "Open a new note" },
		{ "<leader>ont", "<cmd>ObsidianNewFromTemplate<CR>", desc = "Create a New Note from a Template" },
		{ "<leader>onl", "<cmd>ObsidianLinkNew<CR>", desc = "Create a new link from visually selected text" },

		{ "<leader>oc", "<cmd>ObsidianToggleCheckbox<CR>", desc = "Toggle checkbox" },
		{ "<leader>op", "<cmd>ObsidianPasteImg<CR>", desc = "Paste image from clipboard" },
		{ "<leader>ot", "<cmd>ObsidianTemplate<CR>", desc = "Insert template" },

		{ "<leader>ol", "<cmd>ObsidianLink<CR>", mode = "v", desc = "Create link from selection" },
		{ "<leader>ox", "<cmd>ObsidianExtractNote<CR>", mode = "v", desc = "Extract selection to note" },
		{ "<leader>ox", "<cmd>ObsidianExtractNote<CR>", mode = "v", desc = "Extract selection to note" },
	},

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
			attachments = {
				img_folder = [[04 - Assets/Images]],
			},
			completion = {
				nvim_cmp = false,
				min_chars = 2,
			},

			new_notes_location = "notes_subdir",
			-- open_notes_in = "vsplit",
			open_notes_in = "current",

			preferred_link_style = "markdown",
			disable_frontmatter = false,
			picker = { name = "telescope.nvim" },
			sort_by = "modified",
			sort_reversed = true,
			ui = { enable = false },

			note_path_func = function(spec)
				local path = spec.dir / spec.id
				return path:with_suffix(".md")
			end,

			note_id_func = function(title)
				if title ~= nil then
					local lower_title = title:lower()
					local formatted = lower_title:gsub(" ", "_"):gsub("[^a-z0-9-_]", "")
					return formatted
				else
					return tostring(os.time())
				end
			end,
		})
	end,
}
