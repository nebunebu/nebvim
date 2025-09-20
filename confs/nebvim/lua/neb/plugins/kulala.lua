require("kulala").setup({
	global_keymaps = true,
	global_keymaps_prefix = "<leader>R",
	kulala_keymaps_prefix = "",
	lsp = {
		enable = true,
	},
	parser = {
		name = "kulala_http",
	},
})