local markview = require("markview")
local def_hls = markview.configuration.highlight_groups

markview.setup({
	hybrid_modes = { "n" },
	filetypes = { "markdown", "quarto" },
	callbacks = {
		on_enable = function(_, win)
			vim.wo[win].conceallevel = 2
			vim.wo[win].concealcursor = "c"
		end,
	},
	highlight_groups = {
		{
			group_name = "rev_purple",
			value = { bg = "#c4a7e7", fg = "#191724" },
		},
		{
			group_name = "rev_cyan",
			value = { bg = "#9ccfd8", fg = "#191724" },
		},
		{
			group_name = "rev_pink",
			value = { bg = "#ebbcba", fg = "#191724" },
		},
		{
			group_name = "rev_yellow",
			value = { bg = "#f6c177", fg = "#191724" },
		},
		{
			group_name = "rev_green",
			value = { bg = "#31748f", fg = "#191724" },
		},
		{
			group_name = "rev_cyan",
			value = { bg = "#9ccfd8", fg = "#191724" },
		},
		{
			group_name = "rev_gray",
			value = { bg = "#908caa", fg = "#26233a" },
		},
		{
			group_name = "layer2",
			value = { bg = "#26233a" },
		},
		{
			group_name = "fg_gray",
			value = { bg = "#191724", fg = "#908caa" },
		},
		{
			group_name = "fg_green",
			value = { fg = "#31748f" },
		},
		{
			group_name = "fg_red",
			value = { fg = "#eb6f92" },
		},
		{
			group_name = "fg_yellow",
			value = { fg = "#f6c177" },
		},
		{
			group_name = "fg_pink",
			value = { fg = "#ebbcba" },
		},
		{
			group_name = "fg_cyan",
			value = { fg = "#9ccfd8" },
		},
		{
			group_name = "fg_purple",
			value = { fg = "#c4a7e7" },
		},
		{
			group_name = "fg_gray",
			value = { fg = "#908caa" },
		},
	},
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
	tables = {
		enable = true,
		text = {
			"╭",
			"─",
			"╮",
			"┬",
			"├",
			"│",
			"┤",
			"┼",
			"╰",
			"─",
			"╯",
			"┴",
			"╼",
			"╾",
			"╴",
			"╶",
		},
		hl = {
			"fg_purple",
			"fg_purple",
			"fg_purple",
			"fg_purple",
			"fg_purple",
			"fg_purple",
			"fg_purple",
			"fg_purple",
			"fg_purple",
			"fg_purple",
			"fg_purple",
			"fg_purple",
			"fg_purple",
			"fg_purple",
			"fg_purple",
			"fg_purple",
		},
	},
	checkboxes = {
		enable = true,
		checked = {
			text = "✔",
			hl = "fg_green",
		},
		unchecked = {
			text = "✘",
			hl = "fg_red",
		},
		pending = {
			text = "",
			hl = "fg_yellow",
		},
	},
	code_blocks = {
		enable = true,

		style = "language",
		hl = "layer2",

		min_width = 60,
		pad_amount = 3,

		language_names = {
			{ "py", "python" },
			{ "cpp", "C++" },
		},
		language_direction = "right",

		sign = true,
		sign_hl = nil,
	},

	inline_codes = {
		enable = true,
		corner_left = " ",
		corner_right = " ",

		hl = "rev_gray",
	},

	-- links = {
	-- 	enable = true,
	--
	-- 	inline_links = {
	-- 		icon = "󰌷 ",
	-- 		icon_hl = "INLINE_LINK",
	-- 		hl = "INLINE_LINK",
	-- 	},
	-- 	images = {
	-- 		icon = "󰥶 ",
	-- 		icon_hl = "IMAGE_LINK",
	-- 		hl = "IMAGE_LINK",
	-- 	},
	-- 	emails = {
	-- 		icon = " ",
	-- 		icon_hl = "EMAIL_LINK",
	-- 		hl = "EMAIL_LINK",
	-- 	},
	-- },

	block_quotes = {
		enable = true,

		default = {
			border = "▋",
			border_hl = "fg_gray",
		},

		callouts = {
			--- From `Obsidian`
			{
				match_string = "ABSTRACT",
				callout_preview = "󱉫 Abstract",
				callout_preview_hl = "fg_cyan",

				custom_title = true,
				custom_icon = "󱉫 ",

				border = "▋",
				border_hl = "fg_cyan",
			},
			{
				match_string = "TODO",
				callout_preview = " Todo",
				callout_preview_hl = "fg_pink",

				custom_title = true,
				custom_icon = " ",

				border = "▋",
				border_hl = "fg_pink",
			},
			{
				match_string = "SUCCESS",
				callout_preview = "󰗠 Success",
				callout_preview_hl = "fg_green",

				custom_title = true,
				custom_icon = "󰗠 ",

				border = "▋",
				border_hl = "fg_green",
			},
			{
				match_string = "QUESTION",
				callout_preview = "󰋗 Question",
				callout_preview_hl = "fg_purple",

				custom_title = true,
				custom_icon = "󰋗 ",

				border = "▋",
				border_hl = "fg_purple",
			},
			{
				match_string = "FAILURE",
				callout_preview = "󰅙 Failure",
				callout_preview_hl = "fg_red",

				custom_title = true,
				custom_icon = "󰅙 ",

				border = "▋",
				border_hl = "fg_red",
			},
			{
				match_string = "DANGER",
				callout_preview = " Danger",
				callout_preview_hl = "fg_red",

				custom_title = true,
				custom_icon = "  ",

				border = "▋",
				border_hl = "fg_red",
			},
			{
				match_string = "BUG",
				callout_preview = " Bug",
				callout_preview_hl = "fg_yellow",

				custom_title = true,
				custom_icon = "  ",

				border = "▋",
				border_hl = "fg_yellow",
			},
			{
				match_string = "EXAMPLE",
				callout_preview = "󱖫 Example",
				callout_preview_hl = "fg_purple",

				custom_title = true,
				custom_icon = " 󱖫 ",

				border = "▋",
				border_hl = "fg_purple",
			},
			{
				match_string = "QUOTE",
				callout_preview = " Quote",
				callout_preview_hl = "fg_gray",

				custom_title = true,
				custom_icon = "  ",

				border = "▋",
				border_hl = "fg_gray",
			},
			{
				match_string = "NOTE",
				callout_preview = "󰋽 Note",
				callout_preview_hl = "fg_cyan",

				border = "▋",
				border_hl = "fg_cyan",
			},
			{
				match_string = "TIP",
				callout_preview = " Tip",
				callout_preview_hl = "fg_green",

				border = "▋",
				border_hl = "fg_green",
			},
			{
				match_string = "IMPORTANT",
				callout_preview = " Important",
				callout_preview_hl = "fg_pink",

				border = "▋",
				border_hl = "fg_pink",
			},
			{
				match_string = "WARNING",
				callout_preview = " Warning",
				callout_preview_hl = "fg_red",

				border = "▋",
				border_hl = "fg_red",
			},
			{
				match_string = "CAUTION",
				callout_preview = "󰳦 Caution",
				callout_preview_hl = "fg_yellow",

				border = "▋",
				border_hl = "fg_yellow",
			},
			{
				match_string = "CUSTOM",
				callout_preview = "󰠳 Custom",
				callout_preview_hl = "fg_cyan",

				custom_title = true,
				custom_icon = " 󰠳 ",

				border = "▋",
				border_hl = "fg_cyan",
			},
		},
	},
	list_items = {
		marker_minus = {
			add_padding = true,

			text = "",
			hl = "fg_gray",
		},
		marker_plus = {
			add_padding = true,

			text = "",
			hl = "fg_gray",
		},
		marker_star = {
			add_padding = true,

			text = "",
			text_hl = "fg_gray",
		},
		marker_dot = {
			add_padding = true,
		},
	},
})
