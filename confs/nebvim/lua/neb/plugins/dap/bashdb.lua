-- ============================================================================
-- BashDB - Bash Debugger DAP Configuration
-- ============================================================================
-- Repository: https://sourceforge.net/projects/bashdb/
--
-- USAGE WITH DEBUGMASTER:
--   1. Open a bash script (e.g., script.sh)
--   2. Press <leader>d to enter debug mode
--   3. Press 't' to set breakpoints at desired lines
--   4. Press 'c' to start debugging
--   5. Select "Launch file" configuration
--   6. Use debug mode keys to navigate:
--      - 'o' to step over (execute next line)
--      - 'm' to step into (enter functions)
--      - 'q' to step out (exit current function)
--      - 'r' to run to cursor
--      - 'u' to toggle variables/scopes panel
--
-- DEBUGGING A BASH SCRIPT:
--   - The script will run in debug mode
--   - Execution pauses at breakpoints
--   - View variables and call stack in the side panel
--   - Terminal output appears in integrated terminal
--
-- REQUIREMENTS:
--   - pkgs.bashdb (Bash debugger)
--   - A bash script with executable permissions
-- ============================================================================

local dap = require("dap")

dap.adapters.bashdb = {
	type = "executable",
	command = "bashdb",
	name = "bashdb",
	options = {
		env = {
			DEBUG_DAP = "true",
			TERM = "xterm-256color", -- Fix terminal compatibility issues
		},
	},
}

dap.configurations.sh = {
	{
		type = "bashdb",
		request = "launch",
		name = "Launch file",
		showDebugOutput = true,
		trace = true,
		file = "${file}",
		program = "${file}",
		cwd = "${workspaceFolder}",
		args = {},
		env = {},
		terminalKind = "integrated",
	},
}
