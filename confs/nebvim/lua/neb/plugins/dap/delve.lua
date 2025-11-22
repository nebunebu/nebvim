-- ============================================================================
-- Delve - Go Debugger DAP Configuration
-- ============================================================================
-- Repository: https://github.com/go-delve/delve
--
-- USAGE WITH DEBUGMASTER:
--   1. Open a Go file (e.g., main.go)
--   2. Press <leader>d to enter debug mode
--   3. Press 't' to set breakpoints at desired lines
--   4. Press 'c' to start debugging
--   5. Select "Launch file" or "Launch test" configuration
--   6. Use debug mode keys to navigate:
--      - 'o' to step over
--      - 'm' to step into
--      - 'q' to step out
--      - 'r' to run to cursor
--      - 'u' to toggle variables/scopes panel
--
-- DEBUGGING A GO PROGRAM:
--   - "Launch file": Debug the current file
--   - "Launch test": Debug tests in the current package
--   - "Attach to process": Attach to a running Go process (requires PID)
--
-- REQUIREMENTS:
--   - pkgs.delve (Go debugger)
--   - A Go project with a main package or tests
-- ============================================================================

local dap = require("dap")

-- Configure Delve adapter
dap.adapters.delve = {
	type = "server",
	port = "${port}",
	executable = {
		command = "dlv",
		args = { "dap", "-l", "127.0.0.1:${port}" },
	},
}

-- Go debugging configurations
dap.configurations.go = {
	{
		type = "delve",
		name = "Launch file",
		request = "launch",
		program = "${file}",
	},
	{
		type = "delve",
		name = "Launch test",
		request = "launch",
		mode = "test",
		program = "${file}",
	},
	{
		type = "delve",
		name = "Attach to process",
		request = "attach",
		mode = "local",
		processId = require("dap.utils").pick_process,
	},
}
