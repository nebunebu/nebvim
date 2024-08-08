require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		markdown = { "markdownlint" },
		nix = { { "nixpkgs_fmt", "nixfmt" } },
		javascript = { "prettierd" },
	},

	format_on_save = { lsp_format = "fallback" },
})

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function(args)
		require("conform").format({ bufnr = args.buf })
	end,
})
