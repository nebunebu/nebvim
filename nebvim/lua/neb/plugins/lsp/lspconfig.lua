-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md

-- pkgs.nodePackages.bash-language-server system-wide
require("lspconfig").bashls.setup({})
-- pkgs.nodePackages.jq-lsp -- NOTE: system-wide
require("lspconfig").jqls.setup({})
-- NOTE: system-wide
require("lspconfig").jsonls.setup({})
require("lspconfig").lua_ls.setup({})
-- obsidian markdown -- NOTE: system-wide
require("lspconfig").markdown_oxide.setup({})
-- NOTE: system-wide
require("lspconfig").nixd.setup({})
-- NOTE: system-wide
require("lspconfig").yamlls.setup({})
require("lspconfig").texlab.setup({}) -- latex
-- require("lspconfig").awk_ls.setup({})
require("lspconfig").eslint.setup({}) -- js, ts
require("lspconfig").cssls.setup({}) -- css, scss, less
