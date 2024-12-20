require("conform").setup({
	formatters_by_ft = {
		css = { "prettierd" },
		html = { "htmlbeautifier" },
		-- http = { "kulala-fmt" },
		javascript = { "prettierd" },
		json = { "fixjson" },
		lua = { "stylua" },
		markdown = { "markdownlint" },
		nix = { "nixpkgs_fmt", "nixfmt", stop_after_first = true },
		rust = { "rustfmt" },
		scss = { "prettierd" },
		sh = { "shfmt" },
		tex = { "tex-fmt" },
		typescript = { "prettierd" },
		xml = { "xmlformat" },
		yaml = { "yamlfmt" },
		["*"] = { "trim_whitespace", "trim_newlines" },
	},

	format_on_save = { lsp_format = "fallback" },
})

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function(args)
		require("conform").format({ bufnr = args.buf })
	end,
})
