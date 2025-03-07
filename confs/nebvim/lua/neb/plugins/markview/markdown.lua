return {
	tables = {
		enable = true,

		parts = {
			top = { "╭", "─", "╮", "┬" },
			header = { "│", "│", "│" },
			separator = { "├", "─", "┤", "┼" },
			row = { "│", "│", "│" },
			bottom = { "╰", "─", "╯", "┴" },

			overlap = { "┝", "━", "┥", "┿" },

			align_left = "╼",
			align_right = "╾",
			align_center = { "╴", "╶" },
		},

		hl = {
			top = { "TableHeader", "TableHeader", "TableHeader", "TableHeader" },
			header = { "TableHeader", "TableHeader", "TableHeader" },
			separator = { "TableHeader", "TableHeader", "TableHeader", "TableHeader" },
			row = { "TableBorder", "TableBorder", "TableBorder" },
			bottom = { "TableBorder", "TableBorder", "TableBorder", "TableBorder" },

			overlap = { "TableBorder", "TableBorder", "TableBorder", "TableBorder" },

			align_left = "TableAlignLeft",
			align_right = "TableAlignRight",
			align_center = { "TableAlignCenter", "TableAlignCenter" },
		},

		col_min_width = 10,
		block_decorator = true,
		use_virt_lines = false,
	},
	block_quotes = {
		enable = true,
		wrap = true,

		default = {
			border = "▋",
			hl = "MarkviewBlockQuoteDefault",
		},

		["ABSTRACT"] = {
			preview = "󱉫 Abstract",
			hl = "MarkviewBlockQuoteNote",

			title = true,
			icon = "󱉫",

			border = "▋",
		},
		["SUMMARY"] = {
			hl = "MarkviewBlockQuoteNote",
			preview = "󱉫 Summary",

			title = true,
			icon = "󱉫",

			border = "▋",
		},
		["TLDR"] = {
			hl = "MarkviewBlockQuoteNote",
			preview = "󱉫 Tldr",

			title = true,
			icon = "󱉫",

			border = "▋",
		},
		["TODO"] = {
			hl = "MarkviewBlockQuoteNote",
			preview = " Todo",

			title = true,
			icon = "",

			border = "▋",
		},
		["INFO"] = {
			hl = "MarkviewBlockQuoteNote",
			preview = " Info",

			custom_title = true,
			icon = "",

			border = "▋",
		},
		["SUCCESS"] = {
			hl = "MarkviewBlockQuoteOk",
			preview = "󰗠 Success",

			title = true,
			icon = "󰗠",

			border = "▋",
		},
		["CHECK"] = {
			hl = "MarkviewBlockQuoteOk",
			preview = "󰗠 Check",

			title = true,
			icon = "󰗠",

			border = "▋",
		},
		["DONE"] = {
			hl = "MarkviewBlockQuoteOk",
			preview = "󰗠 Done",

			title = true,
			icon = "󰗠",

			border = "▋",
		},
		["QUESTION"] = {
			hl = "MarkviewBlockQuoteWarn",
			preview = "󰋗 Question",

			title = true,
			icon = "󰋗",

			border = "▋",
		},
		["HELP"] = {
			hl = "MarkviewBlockQuoteWarn",
			preview = "󰋗 Help",

			title = true,
			icon = "󰋗",

			border = "▋",
		},
		["FAQ"] = {
			hl = "MarkviewBlockQuoteWarn",
			preview = "󰋗 Faq",

			title = true,
			icon = "󰋗",

			border = "▋",
		},
		["FAILURE"] = {
			hl = "MarkviewBlockQuoteError",
			preview = "󰅙 Failure",

			title = true,
			icon = "󰅙",

			border = "▋",
		},
		["FAIL"] = {
			hl = "MarkviewBlockQuoteError",
			preview = "󰅙 Fail",

			title = true,
			icon = "󰅙",

			border = "▋",
		},
		["MISSING"] = {
			hl = "MarkviewBlockQuoteError",
			preview = "󰅙 Missing",

			title = true,
			icon = "󰅙",

			border = "▋",
		},
		["DANGER"] = {
			hl = "MarkviewBlockQuoteError",
			preview = " Danger",

			title = true,
			icon = "",

			border = "▋",
		},
		["ERROR"] = {
			hl = "MarkviewBlockQuoteError",
			preview = " Error",

			title = true,
			icon = "",

			border = "▋",
		},
		["BUG"] = {
			hl = "MarkviewBlockQuoteError",
			preview = " Bug",

			title = true,
			icon = "",

			border = "▋",
		},
		["EXAMPLE"] = {
			hl = "MarkviewBlockQuoteSpecial",
			preview = "󱖫 Example",

			title = true,
			icon = "󱖫",

			border = "▋",
		},
		["QUOTE"] = {
			hl = "MarkviewBlockQuoteDefault",
			preview = " Quote",

			title = true,
			icon = "",

			border = "▋",
		},
		["CITE"] = {
			hl = "MarkviewBlockQuoteDefault",
			preview = " Cite",

			title = true,
			icon = "",

			border = "▋",
		},
		["HINT"] = {
			hl = "MarkviewBlockQuoteOk",
			preview = " Hint",

			title = true,
			icon = "",

			border = "▋",
		},
		["ATTENTION"] = {
			hl = "MarkviewBlockQuoteWarn",
			preview = " Attention",

			title = true,
			icon = "",

			border = "▋",
		},

		["NOTE"] = {
			match_string = "NOTE",
			hl = "MarkviewBlockQuoteNote",
			preview = "󰋽 Note",

			border = "▋",
		},
		["TIP"] = {
			match_string = "TIP",
			hl = "MarkviewBlockQuoteOk",
			preview = " Tip",

			border = "▋",
		},
		["IMPORTANT"] = {
			match_string = "IMPORTANT",
			hl = "MarkviewBlockQuoteSpecial",
			preview = " Important",

			border = "▋",
		},
		["WARNING"] = {
			match_string = "WARNING",
			hl = "MarkviewBlockQuoteWarn",
			preview = " Warning",

			border = "▋",
		},
		["CAUTION"] = {
			match_string = "CAUTION",
			hl = "MarkviewBlockQuoteError",
			preview = "󰳦 Caution",

			border = "▋",
		},
	},
	-- [ Markdown | Block quotes • Static ] ---------------------------------------------------

	--- Static configuration for block quotes.
	---@class markdown.block_quotes_static
	---
	---@field enable boolean
	---
	---@field wrap? boolean Enables basic wrap support.
	---
	---@field default block_quotes.opts Default block quote configuration.
	---@field [string] block_quotes.opts Configuration for >[!{string}] callout.
	-- tables = {
	-- 	enable = true,
	-- 	text = {
	-- 		"╭",
	-- 		"─",
	-- 		"╮",
	-- 		"┬",
	-- 		"├",
	-- 		"│",
	-- 		"┤",
	-- 		"┼",
	-- 		"╰",
	-- 		"─",
	-- 		"╯",
	-- 		"┴",
	-- 		"╼",
	-- 		"╾",
	-- 		"╴",
	-- 		"╶",
	-- 	},
	-- 	hl = {
	-- 		"fg_purple",
	-- 		"fg_purple",
	-- 		"fg_purple",
	-- 		"fg_purple",
	-- 		"fg_purple",
	-- 		"fg_purple",
	-- 		"fg_purple",
	-- 		"fg_purple",
	-- 		"fg_purple",
	-- 		"fg_purple",
	-- 		"fg_purple",
	-- 		"fg_purple",
	-- 		"fg_purple",
	-- 		"fg_purple",
	-- 		"fg_purple",
	-- 		"fg_purple",
	-- 	},
	-- },

	-- list_items = {
	-- 	marker_minus = {
	-- 		add_padding = false,
	--
	-- 		text = "",
	-- 		hl = "fg_gray",
	-- 	},
	-- 	marker_plus = {
	-- 		add_padding = false,
	--
	-- 		text = "",
	-- 		hl = "fg_gray",
	-- 	},
	-- 	marker_star = {
	-- 		add_padding = false,
	--
	-- 		text = "",
	-- 		text_hl = "fg_gray",
	-- 	},
	-- 	marker_dot = {
	-- 		add_padding = false,
	-- 	},
	-- },
	headings = {
		-- FIX: signs not on a single line
		shift_width = 0,
		heading_1 = {
			style = "label",
			icon = "󰼏  ",
			-- sign = "󰓹 ",
			hl = "rev_purple",
			padding_left = " ",
			corner_left = " ─── ✦",
			corner_left_hl = "rev_purple",
			padding_right = " ",
			corner_right = "✦ ─── ",
			corner_right_hl = "rev_purple",
		},
		heading_2 = {
			style = "label",
			icon = "󰎨 ",
			-- sign = "󰓼 ",
			hl = "rev_cyan",
			padding_left = " ",
			corner_left = " ─── ✦✦",
			corner_left_hl = "rev_cyan",
			padding_right = " ",
			corner_right = "✦✦ ─── ",
			corner_right_hl = "rev_cyan",
		},
		heading_3 = {
			style = "label",
			icon = "󰼑 ",
			-- sign = "󰓹",
			hl = "rev_pink",
			padding_left = " ",
			corner_left = " ─── ✦✦✦",
			corner_left_hl = "rev_pink",
			padding_right = " ",
			corner_right = "✦✦✦ ─── ",
			corner_right_hl = "rev_pink",
		},
		heading_4 = {
			style = "label",
			icon = "󰎲 ",
			-- sign = "󰓼 ",
			hl = "rev_yellow",
			padding_left = " ",
			corner_left = " ─── ✦✦✦✦",
			corner_left_hl = "rev_yellow",
			padding_right = " ",
			corner_right = "✦✦✦✦ ─── ",
			corner_right_hl = "rev_yellow",
		},
		heading_5 = {
			style = "label",
			icon = "󰼓 ",
			hl = "rev_green",
			padding_left = " ",
			corner_left = " ─── ✦✦✦✦✦",
			corner_left_hl = "rev_green",
			padding_right = " ",
			corner_right = "✦✦✦✦✦ ─── ",
			corner_right_hl = "rev_green",
		},
		heading_6 = {
			style = "label",
			icon = "󰎴 ",
			-- sign = "󰓼 ",
			hl = "rev_cyan",
			padding_left = " ",
			corner_left = " ─── ✦✦✦✦✦✦",
			corner_left_hl = "rev_cyan",
			padding_right = " ",
			corner_right = "✦✦✦✦✦✦ ─── ",
			corner_right_hl = "rev_cyan",
		},
	},
}
