-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md

local capabilities = require("blink.cmp").get_lsp_capabilities()

local lsp_configs = {
	"bashls",
	"cssls", -- css, scss, less
	"eslint", -- js
	"jsonls",
	"lua_ls",
	"markdown_oxide",
	"nixd",
	"texlab",
	"ts_ls",
	"lemminx",
	"pylsp",
	"tinymist", --typst
	-- "rust_analyzer",
}

for _, lsp in ipairs(lsp_configs) do
	require("lspconfig")[lsp].setup({ capabilities = capabilities })
end
