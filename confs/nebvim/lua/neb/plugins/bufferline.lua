return {
	"bufferline",
	event = { "BufAdd", "BufEnter" },
	after = function()
		require("bufferline").setup({})
	end,
}
