return {
	"Comment",
	keys = {
		{
			"<leader>/",
			"<cmd>lua require('Comment.api').toggle.linewise.current()<cr>",
			mode = "n",
			desc = "toggle comment linewise",
		},
		{
			"<leader>/",
			"<cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>",
			mode = "v",
			desc = "toggle comment blockwise",
		},
	},
	after = function()
		require("Comment").setup({})
	end,
}
