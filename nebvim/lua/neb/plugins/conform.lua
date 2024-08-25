require("conform").setup({
	formatters_by_ft = {
		json = { "fixjson" },
		html = { "htmlbeautifier" },
		css = { "prettierd" },
		javascript = { "prettierd" },
		lua = { "stylua" },
		markdown = { "markdownlint" },
		nix = { "nixpkgs_fmt", "nixfmt", stop_after_first = true },
		scss = { "prettierd" },
		sh = { "shfmt" },
		tex = { "latexindent" },
		typescript = { "prettierd" },
		xml = { "xmlformat" },
		yaml = { "yamlfmt" },
	},

	format_on_save = { lsp_format = "fallback" },
})

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function(args)
		require("conform").format({ bufnr = args.buf })
	end,
})
