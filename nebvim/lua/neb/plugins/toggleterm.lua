require("toggleterm").setup({
	highlights = {
		FloatBorder = {
			guifg = "#31748f",
		},
	},
	direction = "float",
	shell = vim.o.shell,
	float_opts = {
		border = "curved",
	},
})
