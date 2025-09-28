local baleia = require("baleia")

baleia.setup({})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "man",
	callback = function()
		baleia.once(0)
	end,
})
