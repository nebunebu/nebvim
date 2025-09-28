vim.cmd.colorscheme("rose-pine")
require("lualine").setup({})
require("man.plugins.outline")

vim.api.nvim_create_autocmd("FileType", {
	pattern = "man",
	callback = function()
		vim.cmd("AnsiEsc")
		vim.bo.modifiable = false
		vim.keymap.set("n", "q", ":q<CR>", { buffer = true })
		vim.keymap.set("n", "ZZ", ":q<CR>", { buffer = true })
		vim.keymap.set("n", "ZQ", ":q<CR>", { buffer = true })
	end,
})

-- -- Helper function to get hex colors from the active colorscheme
-- local function get_hl_hex(group, ground)
--   -- Use a protected call in case the highlight group doesn't exist
--   local success, hl_id = pcall(vim.fn.hlID, group)
--   if not success or hl_id == 0 then
--     return nil -- Return nil if the group isn't found
--   end
--   local syn_id = vim.fn.synIDtrans(hl_id)
--   return vim.fn.synIDattr(syn_id, ground .. '#')
-- end
--
-- -- Map ANSI colors to highlight groups from your theme.
-- -- The right-hand side is your choice! Pick groups that look good.
-- -- The 'or' provides a fallback hex code if a highlight group isn't found.
-- vim.g.ansi_Black = get_hl_hex('Normal', 'bg') or '#1d2021'
-- vim.g.ansi_DarkRed = get_hl_hex('Error', 'fg') or '#cc241d'
-- vim.g.ansi_DarkGreen = get_hl_hex('String', 'fg') or '#98971a'
-- vim.g.ansi_DarkYellow = get_hl_hex('WarningMsg', 'fg') or '#d79921'
-- vim.g.ansi_DarkBlue = get_hl_hex('Function', 'fg') or '#458588'
-- vim.g.ansi_DarkMagenta = get_hl_hex('Statement', 'fg') or '#b16286'
-- vim.g.ansi_DarkCyan = get_hl_hex('Type', 'fg') or '#689d6a'
-- vim.g.ansi_LightGray = get_hl_hex('Normal', 'fg') or '#ebdbb2'
-- vim.g.ansi_DarkGray = get_hl_hex('Comment', 'fg') or '#a89984'
