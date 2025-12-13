return {
	"helpview",
	ft = {
		"help",
	},
	after = function()
		require("helpview").setup({
			-- renderers = {},

			headings = {
				enable = false,
			},
		})
	end,
}
