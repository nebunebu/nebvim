return {
	"endwise",
	event = "BufReadPre",
	after = function()
		require("nvim-treesitter.configs").setup({
			endwise = { enable = true },
		})
	end,
}
