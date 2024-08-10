require("conform").setup({
	formatters_by_ft = {
		css = { "prettierd" },
		javascript = { "prettierd" },
		lua = { "stylua" },
		markdown = { "markdownlint" },
		nix = { { "nixpkgs_fmt", "nixfmt" } },
		scss = { "prettierd" },
		tex = { "latexindent" },
		typescript = { "prettierd" },
	},

	format_on_save = { lsp_format = "fallback" },
})

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function(args)
		require("conform").format({ bufnr = args.buf })
	end,
})
