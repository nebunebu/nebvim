require("lint").linters_by_ft = {
	bash = { "shellcheck" },
	css = { "stylelint" },
	javascript = { "eslint" },
	lua = { "luacheck" },
	markdown = { "markdownlint-cli2" },
	nix = { "deadnix", "statix" },
	python = { "pylint" },
	scss = { "stylelint" },
	tex = { "chktex" },
	typescript = { "eslint" },
	zsh = { "zsh" },
}

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	callback = function()
		require("lint").try_lint()
	end,
})
