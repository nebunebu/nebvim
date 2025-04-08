local highlight = {
	"RainbowRed",
	"RainbowYellow",
	"RainbowBlue",
	"RainbowOrange",
	"RainbowGreen",
	"RainbowViolet",
	"RainbowCyan",
}

local hooks = require("ibl.hooks")
-- create the highlight groups in the highlight setup hook, so they are reset
-- every time the colorscheme changes
hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
	vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#EB6F92" })
	vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#F6C177" })
	vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#9CCFD8" })
	vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#EBBCBA" })
	vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#31748F" })
	vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C4A7E7" })
	vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#908CAA" })
end)

vim.g.rainbow_delimiters = { highlight = highlight }
hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
require("ibl").setup({
	indent = {
		highlight = highlight,
		-- char = "▏",
		char = "·",
	},
	scope = {
		highlight = highlight,
		-- char = "▏"
		char = "·",
	},
})

-- NOTE: without indent-blank-line
-- -- Define your custom highlight groups
-- vim.api.nvim_set_hl(0, "RainbowDelimiterRed", { fg = "#EB6F92" })
-- vim.api.nvim_set_hl(0, "RainbowDelimiterYellow", { fg = "#F6C177" })
-- vim.api.nvim_set_hl(0, "RainbowDelimiterBlue", { fg = "#9CCFD8" })
-- vim.api.nvim_set_hl(0, "RainbowDelimiterOrange", { fg = "#EBBCBA" })
-- vim.api.nvim_set_hl(0, "RainbowDelimiterGreen", { fg = "#9CCFD8" })
-- vim.api.nvim_set_hl(0, "RainbowDelimiterViolet", { fg = "#C4A7E7" })
-- vim.api.nvim_set_hl(0, "RainbowDelimiterCyan", { fg = "#E0DEF4" })
--
-- -- Set up rainbow-delimiters plugin
-- require("rainbow-delimiters.setup").setup({
-- 	strategy = {
-- 		[""] = require("rainbow-delimiters.strategy.global"),
-- 		vim = require("rainbow-delimiters.strategy.local"),
-- 	},
-- 	query = {
-- 		[""] = "rainbow-delimiters",
-- 		lua = "rainbow-blocks",
-- 	},
-- 	priority = {
-- 		[""] = 110,
-- 		lua = 210,
-- 	},
-- 	highlight = {
-- 		"RainbowDelimiterRed",
-- 		"RainbowDelimiterYellow",
-- 		"RainbowDelimiterBlue",
-- 		"RainbowDelimiterOrange",
-- 		"RainbowDelimiterGreen",
-- 		"RainbowDelimiterViolet",
-- 		"RainbowDelimiterCyan",
-- 	},
-- })
