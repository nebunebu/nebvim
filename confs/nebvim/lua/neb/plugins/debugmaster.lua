-- ============================================================================
-- debugmaster.nvim - Debug mode for Neovim with DAP integration
-- ============================================================================
-- Repository: https://github.com/miroshQa/debugmaster.nvim
-- Documentation: https://github.com/miroshQa/debugmaster.nvim/blob/main/doc/RECIPES.md
--
-- USAGE:
--   Toggle debug mode: <leader>d (in normal or visual mode)
--
-- DEBUG MODE KEYBINDINGS:
--   H  - View help/all commands
--   u  - Toggle side panel (variables, scopes, etc.)
--   U  - Toggle float mode
--   t  - Set/toggle breakpoint at current line
--   c  - Start debugging (or continue if paused)
--   o  - Step over (next line, skip function calls)
--   m  - Step into (enter function calls)
--   q  - Step out (finish current function)
--   r  - Run to cursor
--
-- TERMINAL MODE:
--   <C-\> - Exit terminal mode
--
-- LUA DEBUGGING WORKFLOW:
--   1. Open a Neovim Lua file
--   2. Press <leader>d to enter debug mode
--   3. Press 't' to set breakpoints where you want to pause
--   4. Press 'c' to start debugging
--   5. Trigger the breakpoint by executing the code
--   6. Use 'o' (step over), 'm' (step into), 'q' (step out) to navigate
--
-- BASH DEBUGGING WORKFLOW:
--   1. Open a bash script
--   2. Press <leader>d to enter debug mode
--   3. Press 't' to set breakpoints
--   4. Press 'c' to start debugging (will prompt for launch config)
--   5. Navigate with 'o', 'm', 'q'
--
-- GO DEBUGGING WORKFLOW:
--   1. Open a Go file
--   2. Press <leader>d to enter debug mode
--   3. Press 't' to set breakpoints
--   4. Press 'c' to start debugging
--   5. Navigate with 'o', 'm', 'q'
-- ============================================================================

return {
	"debugmaster-nvim",
	keys = {
		{
			"<leader>d",
			function()
				require("debugmaster").mode.toggle()
			end,
			mode = { "n", "v" },
			desc = "Toggle Debug Mode",
		},
	},
	after = function()
		local dm = require("debugmaster")

		-- Enable Neovim Lua debugging with one-small-step-for-vimkind
		dm.plugins.osv_integration.enabled = true

		-- Optional: Exit debug mode with Escape
		vim.keymap.set("n", "<Esc>", dm.mode.disable, { desc = "Exit Debug Mode" })

		-- Exit terminal mode (useful when debugging)
		vim.keymap.set("t", "<C-\\>", "<C-\\><C-n>", { desc = "Exit Terminal Mode" })

		-- Optional customization examples:
		-- Remap a debug mode key (uncomment to use)
		-- dm.keys.get("o").key = "n"  -- Change step over from 'o' to 'n'

		-- Disable cursor highlight in debug mode (uncomment to disable)
		-- dm.plugins.cursor_hl.enabled = false

		-- Customize debug cursor highlight color
		vim.api.nvim_set_hl(0, "dCursor", { bg = "#FF2C2C" })
	end,
}
