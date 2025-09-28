vim.cmd.colorscheme("rose-pine")
require("lualine").setup({})
require("man.plugins.outline")
-- require("man.plugins.baleia")

vim.api.nvim_create_autocmd("FileType", {
	pattern = "man",
	callback = function()
		vim.bo.modifiable = false
		vim.keymap.set("n", "q", ":q<CR>", { buffer = true })
		vim.keymap.set("n", "ZZ", ":q<CR>", { buffer = true })
		vim.keymap.set("n", "ZQ", ":q<CR>", { buffer = true })
	end,
})
