vim.g.baleia_instance = require("baleia").setup({})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "man",
	callback = function()
		if vim.g.baleia_instance then
			vim.g.baleia_instance.once(0) -- 0 is shorthand for the current buffer
		end
	end,
})
