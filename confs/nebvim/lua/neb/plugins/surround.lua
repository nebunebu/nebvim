return {
	"surround",
	event = "BufReadPre",
	after = function()
		require("nvim-surround").setup({
			-- Configuration here, or leave empty to use defaults
		})
	end,
}
