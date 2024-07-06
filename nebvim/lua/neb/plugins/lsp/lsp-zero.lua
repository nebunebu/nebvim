require("lsp-zero")

local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  lsp_zero.default_keymaps({buffer = bufnr})
end)

lsp_zero.set_sign_icons({
  error = '✘',
  warn = '▲',
  hint = '⚑',
  info = '»'
})

-- Custom colors for diagnostic signs
-- vim.cmd([[
--   highlight DiagnosticSignError guifg=#ff0000 guibg=NONE
--   highlight DiagnosticSignWarn guifg=#ffff00 guibg=NONE
--   highlight DiagnosticSignHint guifg=#00ffff guibg=NONE
--   highlight DiagnosticSignInfo guifg=#0000ff guibg=NONE
-- ]])

-- Optional: Change colors for the diagnostic text as well
-- vim.cmd([[
--   highlight DiagnosticError guifg=#ff0000
--   highlight DiagnosticWarn guifg=#ffff00
--   highlight DiagnosticHint guifg=#00ffff
--   highlight DiagnosticInfo guifg=#0000ff
-- ]])
