-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md

require("lspconfig").bashls.setup({})
require("lspconfig").cssls.setup({}) -- css, scss, less
require("lspconfig").eslint.setup({}) -- js
require("lspconfig").jsonls.setup({})
require("lspconfig").lua_ls.setup({})
require("lspconfig").markdown_oxide.setup({})
require("lspconfig").nixd.setup({})
require("lspconfig").texlab.setup({})
require("lspconfig").tsserver.setup({})
require("lspconfig").lemminx.setup({})
