require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		markdown = { "markdownlint" },
		-- nix = { "nixfmt" },
    nix = function(bufnr)
      if require("conform").get_formatter_info("nixpkgs_fmt", bufnr).available then
        return { "nixpkgs_fmt" }
      else
        return { "nixfmt" }
      end
    end,
		javascript = { "prettierd" },
	},
})

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function(args)
		require("conform").format({ bufnr = args.buf })
	end,
})
