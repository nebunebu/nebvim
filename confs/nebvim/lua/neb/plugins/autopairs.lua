return {
	"autopairs",
	event = "BufReadPre",
	after = function()
		require("nvim-autopairs").setup({})
	end,
}
