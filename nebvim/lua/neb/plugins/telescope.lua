require("telescope").setup({
	defaults = {
		-- layout_config = {
		-- 	vertical = { width = 0.75 },
		-- 	-- other layout configuration here
		-- },
		-- other defaults configuration here
	},
	-- other configuration values here
	extensions = {
		emoji = {
			action = function(emoji)
				vim.api.nvim_put({ emoji.value }, "c", false, true)
			end,
		},
	},
})

require("telescope").load_extension("project")
require("telescope").load_extension("nerdy")
require("telescope").load_extension("emoji")
-- NOTE: extensions to add
-- telescope-repo.nvim
-- telescope-tele-tabby
-- browser-bookmarks.nvim
-- nvim-neoclip.lua
-- telescope-tmuxinator.nvim
-- cheatsheet.nvim
-- telescope-windowizer.nvim
-- telescope-manix
-- easypick.nvim
-- telescope-tabs
-- telescope-git-conflicts
-- telescope-dap.nvim
-- telescope-git-diffs.nvim
-- toggleterm-manager.nvim
-- ad-telescope-extensions.nvim
-- telescope-extension-maker
