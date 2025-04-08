return {
	preset = {
		header = [[
███████████████████████████████████████
█▄─▀█▄─▄█▄─▄▄─█▄─▄─▀█▄─█─▄█▄─▄█▄─▀█▀─▄█
██─█▄▀─███─▄█▀██─▄─▀██▄▀▄███─███─█▄█─██
▀▄▄▄▀▀▄▄▀▄▄▄▄▄▀▄▄▄▄▀▀▀▀▄▀▀▀▄▄▄▀▄▄▄▀▄▄▄▀
    ]],
		keys = {
			{ icon = "󱄅", key = "c", desc = "nix-config", action = ":e $HOME/.nix-config/flake.nix" },
			{ icon = "", key = "n", desc = "nebvim", action = ":e $HOME/.nebvim/flake.nix" },
			{ icon = "󱉼", key = "v", desc = "obsidian vault", action = ":e $HOME/.vault/index.md" },
			{ icon = "󰖬", key = "w", desc = "wiki", action = ":e $HOME/.wiki/index.md" },
			{ icon = "", key = "p", desc = "Projects", action = ":e $HOME/Projects/" },
			{ icon = "", key = "t", desc = "Typst Documents", action = ":e $HOME/Documents/typst" },
			{ icon = "", key = "m", desc = "Media", action = ":e $HOME/Media" },
		},
	},
	sections = {
		{
			section = "header",
			align = "center",
			pane = 1,
			-- padding = 2,
		},
		-- {
		-- 	section = "image",
		-- 	height = 19,
		-- 	source = "https://i.imgur.com/Fd1dPrU.png",
		-- 	hl = "SnacksDashboardNormal",
		-- 	pane = 1,
		-- 	align = "center",
		-- 	padding = 1,
		-- },

		function()
			local version_output = vim.fn.execute("version")
			local lines = vim.split(version_output, "\n", { plain = true, trimempty = true })
			local first_line = lines and lines[1] or "NVIM v?.?.?"
			local version_string = vim.trim(first_line:gsub("^NVIM%s*", ""))
			return {
				text = {
					{ version_string, hl = "MoreMsg" },
				},
				align = "center",
				padding = { 1, 2 },
				-- pane = 1,
			}
		end,
		{
			section = "keys",
			title = { "Quick Links", hl = "Function" },
			indent = 2,
			padding = 3,
			-- pane = 2,
		},
		{
			section = "recent_files",
			title = { "Recent", hl = "Function" },
			indent = 2,
			limit = 5,
			padding = 3,
			-- pane = 2,
		},
	},
}
