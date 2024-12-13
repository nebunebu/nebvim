return {
	"triptych",
	keys = {
		{ "<leader>t", "<cmd>Triptych<cr>", desc = "Open Triptych" },
	},
	after = function()
		require("triptych").setup({
			mappings = {
				quit = { "q", "<ESC>" },
			},
		})
	end,
}
