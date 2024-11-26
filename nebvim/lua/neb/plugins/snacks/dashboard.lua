return {
	preset = {
		header = [[
        ███████████████████████████████████████
        █▄─▀█▄─▄█▄─▄▄─█▄─▄─▀█▄─█─▄█▄─▄█▄─▀█▀─▄█
        ██─█▄▀─███─▄█▀██─▄─▀██▄▀▄███─███─█▄█─██
        ▀▄▄▄▀▀▄▄▀▄▄▄▄▄▀▄▄▄▄▀▀▀▀▄▀▀▀▄▄▄▀▄▄▄▀▄▄▄▀
    ]],
		keys = {
			{ icon = "󱄅", key = "c", desc = ".nix-config", action = ":e $HOME/.nix-config/flake.nix" },
			{ icon = "", key = "n", desc = "nebvim", action = ":e $HOME/.nebvim/flake.nix" },
			{ icon = "", key = "a", desc = "astal", action = ":e $HOME/.config/ags/flake.nix" },
			{ icon = "󱉼", key = "v", desc = "obsidian vault", action = ":e $HOME/.vault/index.md" },
			{ icon = "󰖬", key = "w", desc = "wiki", action = ":e $HOME/.wiki/index.md" },
		},
	},
	sections = {
		-- TODO: get fortune.nvim working
		{
			text = {
				{ "This is where fortune would go", hl = "Function", align = "center" },
			},
			padding = 1,
		},
		-- TODO: get kitty graphics protocall working
		{
			section = "terminal",
			cmd = "timg -C ~/Downloads/goya.jpg",
			height = 18,
			indent = 0,
		},
		-- NOTE: Kept as an example
		{
			section = "terminal",
			cmd = "pokemon-colorscripts -r --no-title; sleep .1",
			random = 10,
			indent = 4,
			height = 30,
			enabled = false,
		},

		{ section = "header", pane = 2 },
		{
			section = "keys",
			title = { "Quick Links", hl = "Function" },
			indent = 2,
			pane = 2,
			gap = 0,
			padding = 1,
		},
		{ section = "recent_files", title = { "Recent" }, pane = 2, indent = 2, limit = 5, padding = 3 },
	},
}
