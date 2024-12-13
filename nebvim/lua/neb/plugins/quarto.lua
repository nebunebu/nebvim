return {
	"quarto",
	ft = { "quarto" },
	dependencies = { "otter" },
	after = function()
		require("quarto").setup({})
	end,
}
