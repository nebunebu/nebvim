return {
	"dapui",
	keys = {
		{
			"<leader>dt",
			function()
				require("dapui").toggle()
			end,
			desc = "Toggle UI",
		},
	},
	after = function()
		require("dapui").setup({})
	end,
}
