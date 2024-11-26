local M = {}

function M.setup()
	local config = {
		bigfile = require("neb.plugins.snacks.bigfile"),
		--  NOTE: keep using alpha
		-- dashboard = require("neb.plugins.snacks.dashboard"),

		-- require("neb.plugins.snacks.bufdelete")
		-- require("neb.plugins.snacks.debug")
		-- require("neb.plugins.snacks.git")
		-- require("neb.plugins.snacks.gitbrowse")
		-- require("neb.plugins.snacks.lazygit")
		-- require("neb.plugins.snacks.notify")
		-- require("neb.plugins.snacks.notifier")
		-- require("neb.plugins.snacks.quickfile")
		-- require("neb.plugins.snacks.rename")
		-- require("neb.plugins.snacks.statuscolumn")
		-- require("neb.plugins.snacks.toggle")
		-- require("neb.plugins.snacks.win")
		-- require("neb.plugins.snacks.words")
	}

	require("snacks").setup(config)
end

return M
