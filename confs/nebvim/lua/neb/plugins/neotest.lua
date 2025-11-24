return {
	"neotest",
	event = "VeryLazy",
	after = function()
		require("neotest").setup({
			adapters = {
				require("neotest-python")({
					dap = { justMyCode = false },
					runner = "pytest",
				}),
				require("neotest-plenary"),
				require("neotest-go"),
				require("neotest-haskell"),
				require("neotest-bash")({
					-- Use bats for bash tests by default
					-- Can also detect and run other test frameworks
				}),
				-- require("neotest-busted"),
			},
			-- Status signs
			status = {
				enabled = true,
				virtual_text = false,
				signs = true,
			},
			-- Icons
			icons = {
				passed = "✓",
				running = "●",
				failed = "✗",
				skipped = "⊘",
				unknown = "?",
				non_collapsible = "─",
				collapsed = "─",
				expanded = "╮",
				child_prefix = "├",
				final_child_prefix = "╰",
				child_indent = "│",
				final_child_indent = " ",
			},
			-- Floating window options
			floating = {
				border = "rounded",
				max_height = 0.6,
				max_width = 0.6,
				options = {},
			},
			-- Summary window options
			summary = {
				enabled = true,
				animated = true,
				follow = true,
				expand_errors = true,
				mappings = {
					attach = "a",
					clear_marked = "M",
					clear_target = "T",
					debug = "d",
					debug_marked = "D",
					expand = { "<CR>", "<2-LeftMouse>" },
					expand_all = "e",
					jumpto = "i",
					mark = "m",
					next_failed = "J",
					output = "o",
					prev_failed = "K",
					run = "r",
					run_marked = "R",
					short = "O",
					stop = "u",
					target = "t",
					watch = "w",
				},
			},
			-- Output window options
			output = {
				enabled = true,
				open_on_run = "short",
			},
			-- Output panel options
			output_panel = {
				enabled = true,
				open = "botright split | resize 15",
			},
			-- Diagnostic options
			diagnostic = {
				enabled = true,
				severity = vim.diagnostic.severity.ERROR,
			},
			-- Run options
			run = {
				enabled = true,
			},
			-- Quickfix options
			quickfix = {
				enabled = true,
				open = false,
			},
			-- Consumer options
			consumers = {},
			-- Default strategy
			default_strategy = "integrated",
			-- Log level
			log_level = vim.log.levels.WARN,
		})
	end,
}
