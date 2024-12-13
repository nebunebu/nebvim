return {

	"oil",
	-- FIX: set so that opens on opening a directory
	-- keys = {},
	after = function()
		require("oil").setup({
			keymaps = {
				["<BS>"] = "actions.parent",
			},
		})
	end,
}
