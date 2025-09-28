-- lua/man/plugins/baleia.lua
local baleia = require("baleia").setup({
	strip_ansi_codes = true,
	log = "DEBUG",
})

local grp = vim.api.nvim_create_augroup("ManBaleia", { clear = true })

-- If the pager fed us via stdin, ft may be empty; prefer $MAN_PN signal.
local function is_man_buf(buf)
	if vim.bo[buf].filetype == "man" then
		return true
	end
	if os.getenv("MAN_PN") then
		vim.bo[buf].filetype = "man"
		return true
	end
	return false
end

vim.api.nvim_create_autocmd({ "StdinReadPost", "BufReadPost" }, {
	group = grp,
	pattern = "*",
	callback = function(ev)
		local buf = ev.buf
		if vim.b[buf].baleia_applied then
			return
		end
		if not is_man_buf(buf) then
			return
		end

		local was_mod = vim.bo[buf].modifiable
		vim.bo[buf].modifiable = true
		baleia.once(buf)
		vim.bo[buf].modifiable = was_mod or false
		vim.bo[buf].modified = false
		vim.b[buf].baleia_applied = true

		-- sane quit keys for pager use
		vim.keymap.set("n", "q", "<cmd>q<cr>", { buffer = buf, silent = true })
		vim.keymap.set("n", "ZZ", "<cmd>q<cr>", { buffer = buf, silent = true })
		vim.keymap.set("n", "ZQ", "<cmd>q!<cr>", { buffer = buf, silent = true })
	end,
})
