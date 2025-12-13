return {
	"tabline",
	event = "TabNew",
	after = function()
		require("tabline").setup({})
	end,
}
