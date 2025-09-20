return {
	"conform",
	event = "BufWritePre",
	after = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				css = { "prettierd" },
				html = { "htmlbeautifier" },
				http = { "kulala-fmt" },
				javascript = { "prettierd" },
				json = { "fixjson" },
				lua = { "stylua" },
				markdown = { "markdownlint" }, -- explicit list for md
				nix = { "nixfmt" }, -- list of strings only
				python = { "black" },
				rust = { "rustfmt" },
				scss = { "prettierd" },
				sh = { "shfmt" },
				tex = { "tex-fmt" },
				typescript = { "prettierd" },
				xml = { "xmlformat" },
				yaml = { "yamlfmt" },
				["*"] = { "trim_whitespace", "trim_newlines" }, -- global defaults
			},
		})

		vim.api.nvim_create_autocmd("BufWritePre", {
			pattern = "*",
			callback = function(args)
				local ft = vim.bo[args.buf].filetype
				if ft == "markdown" then
					-- Force ONLY markdownlint for Markdown; no global trimmers
					conform.format({
						bufnr = args.buf,
						formatters = { "markdownlint" },
						lsp_format = "fallback",
					})
				else
					conform.format({
						bufnr = args.buf,
						lsp_format = "fallback",
						-- If you want Nix to stop after nixfmt:
						stop_after_first = (ft == "nix"),
					})
				end
			end,
		})
	end,
}
