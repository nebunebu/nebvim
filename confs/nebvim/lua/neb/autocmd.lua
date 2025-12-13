vim.api.nvim_create_autocmd("FileType", {
	pattern = "nix",
	callback = function()
		vim.keymap.set("i", "=", function()
			local node = vim.treesitter.get_node()
			if node then
				local is_nix_context = false
				while node do
					local type = node:type()
					if type == "attrpath" or type == "binding" or type == "attrset" then
						is_nix_context = true
						break
					elseif type == "string_expression" or type == "indented_string_expression" then
						break
					end
					node = node:parent()
				end
				if is_nix_context then
					return "= ;<Left>"
				end
			end
			return "="
		end, { buffer = true, expr = true })
	end,
})

-- Set up the highlight group
vim.api.nvim_set_hl(0, "LspInlayHint", {
	fg = "#c4a7e7",
	bg = "#191724",
	italic = true,
})

-- vim.api.nvim_create_autocmd("BufEnter", {
-- 	pattern = "*",
-- 	callback = function()
-- 		if vim.bo.buftype == "help" then
-- 			vim.cmd("only")
-- 		end
-- 	end,
-- })
--
vim.api.nvim_create_autocmd("BufWinEnter", {
	pattern = "*.txt",
	callback = function()
		if vim.bo.buftype == "help" then
			vim.cmd("wincmd T")
		end
	end,
})
