-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
require("lspconfig").bashls.setup({}) -- pkgs.nodePackages.bash-language-server -- NOTE: system-wide
require("lspconfig").jqls.setup({}) -- pkgs.nodePackages.jq-lsp -- NOTE: system-wide
require("lspconfig").jsonls.setup({}) -- -- NOTE: system-wide
require("lspconfig").lua_ls.setup({}) --
require("lspconfig").markdown_oxide.setup({}) -- obsidian markdown -- NOTE: system-wide
require("lspconfig").nixd.setup({}) -- NOTE: system-wide
require("lspconfig").yamlls.setup({}) -- NOTE: system-wide
require("lspconfig").yamlls.setup({}) -- NOTE: system-wide
