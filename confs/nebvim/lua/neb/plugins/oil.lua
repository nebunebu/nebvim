-- return {
--
-- 	"oil",
-- 	-- FIX: set so that opens on opening a directory
-- 	-- keys = {},
-- 	after = function()
-- 		require("oil").setup({
-- 			keymaps = {
-- 				["<BS>"] = "actions.parent",
-- 			},
-- 		})
-- 	end,
-- }
--
require("oil").setup({
	cleanup_delay_ms = 4000,
	lsp_file_methods = {
		enable = false,
	},
	keymaps = {
		["<BS>"] = "actions.parent",
	},
	preview_win = {
		update_on_cursor_moved = true,
		max_file_size_mb = 100,
		-- win_options = {},
	},
	float = {
		preview_split = "right",
	},
})

vim.api.nvim_create_user_command("OilToggleFloat", function()
	require("oil").toggle_float()
end, {})
