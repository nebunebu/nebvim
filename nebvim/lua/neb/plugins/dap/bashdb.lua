local dap = require("dap")

dap.adapters.bashdb = {
	type = "executable",
	command = "bashdb",
	name = "bashdb",
	options = {
		env = {
			DEBUG_DAP = "true",
			TERM = "xterm-256color", -- Try to fix the emacs terminal issue
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
