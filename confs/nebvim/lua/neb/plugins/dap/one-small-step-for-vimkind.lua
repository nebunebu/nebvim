-- ============================================================================
-- One Small Step for Vimkind - Neovim Lua Debugger
-- ============================================================================
-- Repository: https://github.com/jbyuki/one-small-step-for-vimkind
--
-- USAGE WITH DEBUGMASTER (THREE-STEP WORKFLOW):
--   1. Open a Neovim Lua file (e.g., a plugin config or init.lua)
--   2. Press <leader>d to enter debug mode
--   3. Press 't' to set breakpoints at lines you want to inspect
--   4. Press 'c' to start debugging (launches debug server on port 8086)
--   5. From ANOTHER Neovim terminal, execute the code that triggers the breakpoint
--   6. The debugger will pause at breakpoints in the first instance
--   7. Use debug mode keys to navigate:
--      - 'o' to step over (next line)
--      - 'm' to step into (enter function calls)
--      - 'q' to step out (exit function)
--      - 'r' to run to cursor
--      - 'u' to toggle variables/scopes panel
--
-- DEBUGGING NEOVIM PLUGINS:
--   - Start the debug server in one Neovim instance
--   - Set breakpoints in plugin code
--   - Use a second Neovim instance to trigger the code
--   - The first instance will pause and show variables/call stack
--
-- DEBUGGING THIS CONFIG:
--   - Open any Lua file from this config (e.g., lua/neb/plugins/blink.lua)
--   - Set breakpoints and start debugging
--   - Open a new terminal and run: nvim --headless -c "lua require('your-module').function()"
--   - The debugger will catch the execution
--
-- REQUIREMENTS:
--   - one-small-step-for-vimkind plugin (already configured)
--   - debugmaster.nvim with osv_integration enabled (configured in debugmaster.lua)
--   - Two Neovim instances (one for debugging, one for triggering)
-- ============================================================================

local dap = require("dap")

dap.configurations.lua = {
	{
		type = "nlua",
		request = "attach",
		name = "Attach to running Neovim instance",
	},
}

dap.adapters.nlua = function(callback, config)
	callback({ type = "server", host = config.host or "127.0.0.1", port = config.port or 8086 })
end
