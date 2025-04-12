local M = {}

function M.setup()
	local config = {
		bigfile = require("neb.plugins.snacks.bigfile"),
		-- bufdelete = require("neb.plugins.snacks.bufdelete"),
		-- dashboard = require("neb.plugins.snacks.dashboard"),
		-- image = require("neb.plugins.snacks.image"),
		debug = require("neb.plugins.snacks.debug"),
		git = require("neb.plugins.snacks.git"),
		-- gitbrowse = require("neb.plugins.snacks.gitbrowse"),
		lazygit = require("neb.plugins.snacks.lazygit"),
		notifier = require("neb.plugins.snacks.notifier"),
		notify = require("neb.plugins.snacks.notify"),
		quickfile = require("neb.plugins.snacks.quickfile"),
		statuscolumn = require("neb.plugins.snacks.statuscolumn"),
		-- toggle = require("neb.plugins.snacks.toggle"),
		win = require("neb.plugins.snacks.win"),
		words = require("neb.plugins.snacks.words"),
		styles = {
			snacks_image = {
				relative = "cursor",
				border = "rounded",
				focusable = false,
				backdrop = false,
				row = 1,
				col = 1,
				-- width/height are automatically set by the image size unless specified below
			},
		},
	}

	-- require("neb.plugins.snacks.dashboard_image_patch").apply_patch()
	require("snacks").setup(config)
end

return M
