return {
	"outline",
	keys = {
		{ "<leader>o", "<cmd>Outline<cr>", desc = "Toggle Outline" },
	},
	after = function()
		require("outline").setup({})
	end,
}
