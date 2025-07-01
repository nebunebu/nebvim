return {
	"luasnip",
	event = "BufReadPre",
	after = function()
		require("luasnip.loaders.from_vscode").lazy_load()
	end,
}
