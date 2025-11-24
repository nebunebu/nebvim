return {
	"snipbrowzurr-nvim",
	keys = {
		{
			"<leader>sb",
			function()
				require("snipbrowzurr").browse()
			end,
			desc = "Browse Snippets",
		},
	},
	after = function()
		require("snipbrowzurr").setup({
			-- Enable all snippet loaders (matching LuaSnip configuration)
			load_vscode = true,
			load_lua = true,
			load_snipmate = true,
			-- Keymap for opening snippet browser
			keymap = "<leader>sb",
		})
	end,
}
