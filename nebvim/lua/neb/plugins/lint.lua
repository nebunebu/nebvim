require("lint").linters_by_ft = {
	bash = { "shellcheck" },
	lua = { "luacheck" },
	markdown = { "markdownlint" },
	nix = { "deadnix", "statix" },
	tex = {},
	zsh = { "zsh" },
	javascript = { "eslint" },
}

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	callback = function()
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
-- require("lualine").setup({
-- 	sections = { lualine_x = { lint_progress } },
-- })
--
-- vim.api.nvim_create_user_command("DisplayRunningLinters", function()
-- 	local linters = require("lint").get_running()
-- 	if #linters == 0 then
-- 		print("No linters are currently running.")
-- 	else
-- 		print("Running linters: ", table.concat(linters, ","))
-- 	end
-- end, {})
