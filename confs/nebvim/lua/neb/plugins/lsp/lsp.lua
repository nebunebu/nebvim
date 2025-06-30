vim.lsp.enable("luals")
vim.lsp.enable("nixd")

-- "bashls",
-- "cssls", -- css, scss, less
-- "eslint", -- js
-- "jsonls",
-- "lua_ls",
-- "markdown_oxide",
-- "nixd",
-- "texlab",
-- "ts_ls",
-- "lemminx",
-- "pylsp",
-- "tinymist", --typst
-- TODO: Set keybinds with whichkey

-- NOTE: For Completions
-- vim.api.nvim_create_autocmd('LspAttach', {
--   callback = function(ev)
--     local client = vim.lsp.get_client_by_id(ev.data.client_id)
--     if client:supports_method('textDocument/completion') then
--       vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
--     end
--   end,
-- })
