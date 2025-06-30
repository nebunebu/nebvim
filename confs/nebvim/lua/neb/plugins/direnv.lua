require("direnv").setup({
	bin = "direnv",
	autoload_direnv = true,
	statusline = {
		enabled = true,
		icon = "󱚟",
	},
	-- TODO: change binds
	keybindings = {
		allow = "<Leader>da",
		deny = "<Leader>dd",
		reload = "<Leader>dr",
		edit = "<Leader>de",
	},

	notifications = {
		level = vim.log.levels.INFO,
		silent_autoload = true,
	},
})
