require("lint").linters_by_ft = {
	lua = { "luacheck" },
	nix = { "deadnix", "statix" },
}

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	callback = function()
		-- try_lint without arguments runs the linters defined in `linters_by_ft`
		-- for the current filetype
		require("lint").try_lint()
	end,
})

-- local lint_progress = function()
-- 	local linters = require("lint").get_running()
-- 	if #linters == 0 then
-- 		return "󰦕"
-- 	end
-- 	return "󱉶 " .. table.concat(linters, ", ")
-- end
--
-- require("lint").get_running()
