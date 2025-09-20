vim.opt_local.expandtab = true
vim.opt_local.shiftwidth = 2
vim.opt_local.tabstop = 2
vim.opt_local.smarttab = true
vim.opt_local.colorcolumn = "59"

vim.opt_local.textwidth = 59
vim.opt_local.spell = true

-- Prevent these settings from being overridden
vim.b.did_ftplugin = 1

vim.opt.list = true
vim.opt.listchars = {
	tab = "▸ ", -- show tabs as an arrow + space
	trail = "·", -- trailing spaces as dots
	extends = "»", -- right overflow
	precedes = "«", -- left overflow
	nbsp = "␣", -- non-breaking space
}
