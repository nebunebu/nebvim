return {
	"gitsigns",
	event = "BufReadPre",
	after = function()
		require("gitsigns").setup({})
	end,
}
