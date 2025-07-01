return {
	"nvim-highlight-colors",
	event = "BufReadPre",
	after = function()
		vim.opt.termguicolors = true

		require("nvim-highlight-colors").setup({
			render = "virtual",
			virtual_symbol = "",
			virtual_symbol_prefix = " ",
			virtual_symbol_suffix = "",
			virtual_symbol_position = "eow",

			custom_colors = {
				{
					label = "config%.rosePine%.main%.base",
					color = "#191724",
				},
				{
					label = "config%.rosePine%.main%.surface",
					color = "#1f1d2e",
				},
				{
					label = "config%.rosePine%.main%.overlay",
					color = "#26233a",
				},
				{
					label = "config%.rosePine%.main%.muted",
					color = "#6e6a86",
				},
				{
					label = "config%.rosePine%.main%.subtle",
					color = "#908caa",
				},
				{
					label = "config%.rosePine%.main%.text",
					color = "#e0def4",
				},
				{
					label = "config%.rosePine%.main%.love",
					color = "#eb6f92",
				},
				{
					label = "config%.rosePine%.main%.gold",
					color = "#f6c177",
				},
				{
					label = "config%.rosePine%.main%.rose",
					color = "#ebbcba",
				},
				{
					label = "config%.rosePine%.main%.pine",
					color = "#31748f",
				},
				{
					label = "config%.rosePine%.main%.foam",
					color = "#9ccfd8",
				},
				{
					label = "config%.rosePine%.main%.iris",
					color = "#c4a7e7",
				},
				{
					label = "config%.rosePine%.main%.highlightLow",
					color = "#21202e",
				},
				{
					label = "config%.rosePine%.main%.highlightMed",
					color = "#403d52",
				},
				{
					label = "config%.rosePine%.main%.highlightHigh",
					color = "#524f67",
				},
			},
		})
	end,
}
