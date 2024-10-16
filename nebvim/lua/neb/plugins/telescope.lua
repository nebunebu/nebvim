local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")

require("telescope").setup({
	defaults = {
		-- layout_config = {
		-- 	vertical = { width = 0.75 },
		-- 	-- other layout configuration here
		-- },
		-- other defaults configuration here
	},
	-- other configuration values here
	pickers = {
		help_tags = {
			mappings = {
				i = {
					["<CR>"] = function(prompt_bufnr)
						actions.close(prompt_bufnr)
						local selection = action_state.get_selected_entry()
						-- Custom action here
						vim.cmd("HauntHelp " .. selection.value)
					end,
				},
			},
		},
		man_pages = {
			sections = { "ALL" },
			mappings = {
				i = {
					["<CR>"] = function(prompt_bufnr)
						actions.close(prompt_bufnr)
						local selection = action_state.get_selected_entry()
						-- Custom action here
						vim.cmd("HauntMan " .. selection.value)
					end,
				},
			},
		},
	},
	extensions = {
		emoji = {
			action = function(emoji)
				vim.api.nvim_put({ emoji.value }, "c", false, true)
			end,
		},
	},
})

-- [[ NOTE: consider using https://github.com/nvim-telescope/telescope-symbols.nvim/ instead of  nerdy and emoji
-- ]]
--

require("telescope").load_extension("project")
require("telescope").load_extension("nerdy")
require("telescope").load_extension("emoji")
require("telescope").load_extension("conflicts")
require("telescope").load_extension("dap")
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
-- telescope-dap.nvim
-- telescope-git-diffs.nvim
-- toggleterm-manager.nvim
-- ad-telescope-extensions.nvim
-- telescope-extension-maker
