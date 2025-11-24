return {
	"tiny-code-action-nvim",
	event = "LspAttach",
	after = function()
		require("tiny-code-action").setup({
			backend = "delta",
			backend_opts = {
				delta = {
					args = {
						"--line-numbers",
						"--side-by-side",
						"--paging=never",
					},
				},
			},
			picker = "snacks",
			telescope_opts = {
				layout_strategy = "vertical",
				layout_config = {
					width = 0.7,
					height = 0.9,
					preview_cutoff = 1,
					preview_height = function(_, _, max_lines)
						local h = math.floor(max_lines * 0.5)
						return math.max(h, 10)
					end,
				},
			},
		})
	end,
}
