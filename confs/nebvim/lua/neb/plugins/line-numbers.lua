require("line-numbers").setup({
	enabled = true, -- or false to disable by default
	mode = "both", -- "relative", "absolute", "both", "none"
	format = "abs_rel", -- or "rel_abs"
	separator = " ",
	number_fallback = true,
	relativenumber_fallback = true,
	statuscolumn_fallback = "",
	rel_highlight = { link = "LineNr" },
	abs_highlight = { link = "LineNr" },
	current_rel_highlight = { link = "CursorLineNr" },
	current_abs_highlight = { link = "CursorLineNr" },
})
