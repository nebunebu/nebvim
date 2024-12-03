require("nvim-test").setup({
	run = true, -- run tests (using for debug)
	commands_create = true, -- create commands (TestFile, TestLast, ...)
	filename_modifier = ":.", -- modify filenames before tests run(:h filename-modifiers)
	silent = false, -- less notifications
	term = "terminal", -- a terminal to run ("terminal"|"toggleterm")
	termOpts = {
		direction = "float", -- terminal's direction ("horizontal"|"vertical"|"float")
		width = 96, -- terminal's width (for vertical|float)
		height = 24, -- terminal's height (for horizontal|float)
		go_back = false, -- return focus to original window after executing
		stopinsert = "auto", -- exit from insert mode (true|false|"auto")
		keep_one = true, -- keep only one terminal for testing
	},
	runners = { -- setup tests runners
		cs = "nvim-test.runners.dotnet",
		go = "nvim-test.runners.go-test",
		haskell = "nvim-test.runners.hspec",
		javascriptreact = "nvim-test.runners.jest",
		javascript = "nvim-test.runners.jest",
		lua = "nvim-test.runners.busted",
		python = "nvim-test.runners.pytest",
		ruby = "nvim-test.runners.rspec",
		rust = "nvim-test.runners.cargo-test",
		typescript = "nvim-test.runners.jest",
		typescriptreact = "nvim-test.runners.jest",
	},
})

require("nvim-test.runners.jest"):setup({
	command = "~/node_modules/.bin/jest", -- a command to run the test runner
	args = { "--collectCoverage=false" }, -- default arguments
	env = { CUSTOM_VAR = "value" }, -- custom environment variables

	file_pattern = "\\v(__tests__/.*|(spec|test))\\.(js|jsx|coffee|ts|tsx)$", -- determine whether a file is a testfile
	find_files = { "{name}.test.{ext}", "{name}.spec.{ext}" }, -- find testfile for a file

	filename_modifier = nil, -- modify filename before tests run (:h filename-modifiers)
	working_directory = nil, -- set working directory (cwd by default)
})

require("nvim-test.runners.busted"):setup({
	command = "busted",
	args = { "-p", "_spec.lua$", "--lpath=?.lua;src/?.lua;../?.lua;../src/?.lua" },
	env = {},
	file_pattern = "\\v(.+_spec\\.lua|.+\\.lua)$",
	find_files = { "{name}_spec.{ext}" },
	filename_modifier = nil,
	working_directory = nil,
})

vim.api.nvim_create_autocmd("TermOpen", {
	pattern = "*",
	callback = function()
		local win_config = vim.api.nvim_win_get_config(0)
		if win_config.relative ~= "" then
			-- Terminal mode mappings
			vim.keymap.set("t", "<Esc>", [[<C-\><C-n>:q<CR>]], { buffer = true, nowait = true })
			vim.keymap.set("t", "q", [[<C-\><C-n>:q<CR>]], { buffer = true, nowait = true })

			-- Normal mode mappings
			vim.keymap.set("n", "<Esc>", ":q<CR>", { buffer = true, nowait = true })
			vim.keymap.set("n", "q", ":q<CR>", { buffer = true, nowait = true })
		end
	end,
})
