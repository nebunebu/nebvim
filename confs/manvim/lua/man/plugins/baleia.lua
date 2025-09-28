-- lua/man/plugins/baleia.lua (or wherever you configure it)
local baleia = require("baleia").setup({
	strip_ansi_codes = true,
	log = "DEBUG",
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "man",
	callback = function()
		-- don't set nomodifiable here
		vim.keymap.set("n", "q", ":q<CR>", { buffer = true })
		vim.keymap.set("n", "ZZ", ":q<CR>", { buffer = true })
		vim.keymap.set("n", "ZQ", ":q<CR>", { buffer = true })
	end,
})

vim.api.nvim_create_autocmd("BufWinEnter", {
	pattern = "*",
	callback = function()
		if vim.bo.filetype == "man" then
			-- temporarily allow edits so Baleia can strip SGR sequences
			local was_modifiable = vim.bo.modifiable
			vim.bo.modifiable = true
			baleia.once(0)
			vim.bo.modifiable = was_modifiable or false
			vim.bo.modified = false
		end
	end,
})
