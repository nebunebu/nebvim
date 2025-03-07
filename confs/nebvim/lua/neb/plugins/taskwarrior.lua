return {
	"taskwarrior.nvim",
	cmd = "Task",
	after = function()
		require("taskwarrior_nvim").setup({})
	end,
}
