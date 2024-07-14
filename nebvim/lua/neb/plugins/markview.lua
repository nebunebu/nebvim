local markview = require("markview")
local def_hls = markview.configuration.highlight_groups

markview.setup({
	highlight_groups = vim.list_extend(def_hls, {
		{
			group_name = "H1",
			value = { bg = "#c4a7e7", fg = "#191724" },
		},
		{
			group_name = "H2",
			value = { bg = "#9ccfd8", fg = "#191724" },
		},
		{
			group_name = "H3",
			value = { bg = "#ebbcba", fg = "#191724" },
		},
		{
			group_name = "H4",
			value = { bg = "#f6c177", fg = "#191724" },
		},
		{
			group_name = "H5",
			value = { bg = "#31748f", fg = "#191724" },
		},
		{
			group_name = "H6",
			value = { bg = "#9ccfd8", fg = "#191724" },
		},
	}),
	headings = {
		shift_width = 0,
		heading_1 = {
			style = "label",
			icon = "󰼏  ",
			-- sign = "󰓹 ",
			-- 
			hl = "H1",
			padding_left = " ",
			corner_left = " ─── ✦",
			corner_left_hl = "H1",
			padding_right = " ",
			corner_right = "✦ ─── ",
			corner_right_hl = "H1",
		},
		heading_2 = {
			style = "label",
			icon = "󰎨 ",
			-- sign = "󰓼 ",
			hl = "H2",
			padding_left = " ",
			corner_left = " ─── ✦✦",
			corner_left_hl = "H2",
			padding_right = " ",
			corner_right = "✦✦ ─── ",
			corner_right_hl = "H2",
		},
		heading_3 = {
			style = "label",
			icon = "󰼑 ",
			-- sign = "󰓹",
			hl = "H3",
			padding_left = " ",
			corner_left = " ─── ✦✦✦",
			corner_left_hl = "H3",
			padding_right = " ",
			corner_right = "✦✦✦ ─── ",
			corner_right_hl = "H3",
		},
		heading_4 = {
			style = "label",
			icon = "󰎲 ",
			-- sign = "󰓼 ",
			hl = "H4",
			padding_left = " ",
			corner_left = " ─── ✦✦✦✦",
			corner_left_hl = "H4",
			padding_right = " ",
			corner_right = "✦✦✦✦ ─── ",
			corner_right_hl = "H4",
		},
		heading_5 = {
			style = "label",
			icon = "󰼓 ",
			hl = "H5",
			padding_left = " ",
			corner_left = " ─── ✦✦✦✦✦",
			corner_left_hl = "H5",
			padding_right = " ",
			corner_right = "✦✦✦✦✦ ─── ",
			corner_right_hl = "H5",
		},
		heading_6 = {
			style = "label",
			icon = "󰎴 ",
			-- sign = "󰓼 ",
			hl = "H6",
			padding_left = " ",
			corner_left = " ─── ✦✦✦✦✦✦",
			corner_left_hl = "H6",
			padding_right = " ",
			corner_right = "✦✦✦✦✦✦ ─── ",
			corner_right_hl = "H6",
		},
	},
})
