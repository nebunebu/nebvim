return {
	"nix-develop",
	cmd = {
		"NixDevelop",
		"NixShell",
	},
	after = function()
		require("nix-develop").setup({})
	end,
}
