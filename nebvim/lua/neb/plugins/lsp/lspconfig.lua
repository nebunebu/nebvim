-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
require("lspconfig").bashls.setup({})
require("lspconfig").lua_ls.setup({})
require("lspconfig").nixd.setup({})
require("lspconfig").html.setup({})
require("lspconfig").jqls.setup({})
require("lspconfig").jsonls.setup({})
require("lspconfig").markdown_oxide.setup({}) -- obsidian markdown
-- require("lspconfig").marksman.setup({}) -- markdown
-- require("lspconfig").prosemd_lsp.setup({}) # markdown
-- require("lspconfig").remark_ls.setup({}) # markdown
