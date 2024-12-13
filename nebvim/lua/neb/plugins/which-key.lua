require("which-key").setup({})
local wk = require("which-key")

local function copy_diagnostics()
	local diagnostics = vim.diagnostic.get()
	if #diagnostics == 0 then
		vim.notify("No diagnostics found")
		return
	end

	local lines = {}
	for _, d in ipairs(diagnostics) do
		table.insert(lines, string.format("Line %d: %s", d.lnum + 1, d.message))
	end

	vim.fn.setreg("+", table.concat(lines, "\n"))
	vim.notify(#diagnostics .. " diagnostics copied to clipboard")
end

wk.add({
	{
		mode = "n",
		{ "<leader>h", "<cmd>nohlsearch<cr>", desc = "dehighlight search" },
		{ "<leader>/", "<cmd>lua require('Comment.api').toggle.linewise.current()<cr>", desc = "Toggle Comment" },
		{ "<leader>p", "<cmd>PasteImage<cr>", desc = "Paste Image" },
		{ "<leader>b", "<cmd>AlphaTab<cr>", desc = "Open Alpha in new tab" },

		{ "<leader>lg", "<cmd>lua Snacks.lazygit.open()<CR>", desc = "Open lazygit" },

		-- Window resizing
		-- FIX: interfers with tmux binds
		-- { "<C>", group = "window-resize" },
		-- { "<C-h>", "<cmd>vertical resize -1<CR>", desc = "Decrease window width" },
		-- { "<C-l>", "<cmd>vertical resize +1<CR>", desc = "Increase window width" },
		-- { "<C-k>", "<cmd>resize +1<CR>", desc = "Increase window height" },
		-- { "<C-j>", "<cmd>resize -1<CR>", desc = "Decrease window height" },

		-- Debug Adapter Protocol
		{ "<leader>d", group = "debug" },
		-- Core debugging
		{ "<leader>dc", "<cmd>DapContinue<CR>", desc = "Continue/Start Debugging" },
		{ "<leader>db", "<cmd>DapToggleBreakpoint<CR>", desc = "Toggle Breakpoint" },
		{ "<leader>dx", "<cmd>DapTerminate<CR>", desc = "Terminate Session" },

		-- Stepping
		{ "<leader>ds", group = "step" },
		{ "<leader>dsi", "<cmd>DapStepInto<CR>", desc = "Step Into" },
		{ "<leader>dso", "<cmd>DapStepOver<CR>", desc = "Step Over" },
		{ "<leader>dsO", "<cmd>DapStepOut<CR>", desc = "Step Out" },

		-- UI Elements
		{ "<leader>dr", "<cmd>DapToggleRepl<CR>", desc = "Toggle REPL" },

		-- Evaluation
		{ "<leader>de", "<cmd>DapEval<CR>", desc = "Evaluate Expression" },

		-- Session Management
		{ "<leader>dn", "<cmd>DapNew<CR>", desc = "New Session" },
		{ "<leader>dd", "<cmd>DapDisconnect<CR>", desc = "Disconnect" },
		{ "<leader>dl", "<cmd>DapLoadLaunchJSON<CR>", desc = "Load launch.json" },

		-- Advanced/Debug
		{ "<leader>da", group = "advanced" },
		{ "<leader>dar", "<cmd>DapRestartFrame<CR>", desc = "Restart Frame" },
		{ "<leader>dal", "<cmd>DapShowLog<CR>", desc = "Show DAP Log" },
		{ "<leader>das", "<cmd>DapSetLogLevel<CR>", desc = "Set Log Level" },

		-- Diagnostics
		{ "<leader>x", group = "diagnostics" },
		{ "<leader>xl", "<cmd>lua vim.diagnostic.setloclist()<CR>", desc = "Diagnostics to loclist" },
		{ "<leader>xc", copy_diagnostics, desc = "Copy diagnostics to clipboard" },
		{ "<leader>xh", "<cmd>lua Snacks.notifier.show_history()<CR>", desc = "Show notification history" },

		-- Markdown
		{ "<leader>m", group = "markdown", icon = " " },
		{ "<leader>mv", "<cmd>Markview toggleAll<cr>", desc = "Toggle Markview" },
		{ "<leader>mc", "<cmd>GenerateTOC<cr>", desc = "Generate Markodwn TOC" },
		-- Quickfix
		{ "<leader>q", group = "quickfix" },
		{ "<leader>qt", "<cmd>TodoQuickFix<CR>", desc = "QuickFix Todo Comments" },

		-- Obsidian
		{ "<leader>o", group = "Obsidian" },
		{ "<leader>of", group = "Obsidian Find" },
		{ "<leader>off", "<cmd>ObsidianQuickSwitch<CR>", desc = "Find file in vault" },
		{ "<leader>ofg", "<cmd>ObsidianSearch<CR>", desc = "rg vault" },
		{ "<leader>ofl", "<cmd>ObsidianLinks<CR>", desc = "Find Links in Current Buffer" },
		{ "<leader>ofb", "<cmd>ObsidianBacklinks<CR>", desc = "Find Backlinks in Current Buffer" },
		{ "<leader>oft", "<cmd>ObsidianTags<CR>", desc = "Find Tags in Vault" },

		{ "<leader>on", group = "Obsidian New" },
		{ "<leader>onn", "<cmd>ObsidianNew<CR>", desc = "Open a new note" },
		{ "<leader>ont", "<cmd>ObsidianNewFromTemplate<CR>", desc = "Create a New Note from a Template" },

		-- { "<leader>ont", "<cmd>ObsidianNew<CR>", desc = "Open a new note" },

		-- "<cmd>ObsidianFollowLink<CR>",
		-- "<cmd>ObsidianBacklinks<CR>",
		-- "<cmd>ObsidianTags<CR>",
		-- "<cmd>ObsidianToday<CR>",
		-- "<cmd>ObsidianTemplate<CR>",
		-- "<cmd>ObsidianSearch<CR>",
		-- "<cmd>ObsidianLink<CR>",
		-- "<cmd>ObsidianLinkNew<CR>",
		-- "<cmd>ObsidianLinks<CR>",
		-- "<cmd>ObsidianExtractNote<CR>",
		-- "<cmd>ObsidianWorkspace<CR>",
		-- "<cmd>ObsidianPasteImg<CR>",
		-- "<cmd>ObsidianRename<CR>",
		-- "<cmd>ObsidianToggleCheckbox<CR>",
		-- "<cmd>ObsidianNewFromTemplate<CR>",
		-- "<cmd>ObsidianTOC<CR>",

		-- Quickfix
		-- { "<leader>c", group = "cellular automaton" },
		-- { "<leader>cr", "<cmd>CellularAutomaton make_it_rain<CR>", desc = "make it rain" },
		-- { "<leader>cg", "<cmd>CellularAutomaton game_of_life<CR>", desc = "game of life" },
		-- { "<leader>cs", "<cmd>CellularAutomaton scramble<CR>", desc = "scramble" },
		-- { "<leader>cl", "<cmd>CellularAutomaton slide<CR>", desc = "scramble" },
		-- Loclist
	},
	{
		mode = { "x" },
		{ "<leader>onl", "<cmd>ObsidianLinkNew<CR>", desc = "Create a new link from visually selected text" },
		{ "<", "<gv", desc = "Dedent and keep selection" },
		{ ">", ">gv", desc = "Indent and keep selection" },
		{
			"<leader>/",
			"<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
			desc = "Toggle Comment",
		},
	},
})
