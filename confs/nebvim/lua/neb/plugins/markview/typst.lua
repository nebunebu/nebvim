-- Typst configuration for markview.nvim
-- Covers: code blocks, headings, lists, math blocks, symbols, links

return {
	enable = true,

	-- Code blocks
	code_blocks = {
		enable = true,
		style = "block",
		hl = "MarkviewTypstCodeBlock",
		pad_amount = 1,
		pad_char = " ",
		text = "Typst",
		text_hl = "MarkviewTypstCodeLabel",
		sign = true,
		sign_hl = "MarkviewTypstCodeSign",
	},

	-- Inline code spans
	code_spans = {
		enable = true,
		hl = "MarkviewTypstCodeSpan",
		corner_left = "`",
		corner_left_hl = "MarkviewTypstCodeCorner",
		corner_right = "`",
		corner_right_hl = "MarkviewTypstCodeCorner",
		padding_left = "",
		padding_right = "",
	},

	-- Raw blocks (language-specific code)
	raw_blocks = {
		enable = true,
		style = "block",
		hl = "MarkviewTypstRawBlock",
		pad_amount = 1,
		pad_char = " ",
		border_hl = "MarkviewTypstRawBorder",
	},

	-- Raw spans (inline raw text)
	raw_spans = {
		enable = true,
		hl = "MarkviewTypstRawSpan",
		padding_left = " ",
		padding_right = " ",
	},

	-- Headings
	headings = {
		enable = true,
		shift_width = 0,

		heading_1 = {
			style = "icon",
			sign = "󰌕 ",
			icon = "󰼏  ",
			hl = "MarkviewTypstHeading1",
		},
		heading_2 = {
			style = "icon",
			sign = "󰌕 ",
			icon = "󰎨  ",
			hl = "MarkviewTypstHeading2",
		},
		heading_3 = {
			style = "icon",
			sign = "󰌕 ",
			icon = "󰼑  ",
			hl = "MarkviewTypstHeading3",
		},
		heading_4 = {
			style = "icon",
			sign = "󰌕 ",
			icon = "󰎲  ",
			hl = "MarkviewTypstHeading4",
		},
		heading_5 = {
			style = "icon",
			sign = "󰌕 ",
			icon = "󰼓  ",
			hl = "MarkviewTypstHeading5",
		},
		heading_6 = {
			style = "icon",
			sign = "󰌕 ",
			icon = "󰎴  ",
			hl = "MarkviewTypstHeading6",
		},
	},

	-- List items
	list_items = {
		enable = true,
		shift_width = 2,
		indent_size = 2,

		-- Minus marker
		marker_minus = {
			add_padding = true,
			text = "•",
			hl = "MarkviewTypstListMinus",
		},

		-- Plus marker
		marker_plus = {
			add_padding = true,
			text = "◆",
			hl = "MarkviewTypstListPlus",
		},

		-- Dot marker (numbered)
		marker_dot = {
			add_padding = true,
			text = ".",
			hl = "MarkviewTypstListDot",
		},
	},

	-- Math blocks
	math_blocks = {
		enable = true,
		hl = "MarkviewTypstMathBlock",
		pad_amount = 1,
		pad_char = " ",
		text = "Math",
		text_hl = "MarkviewTypstMathLabel",
		text_direction = "right",
	},

	-- Inline math
	math_spans = {
		enable = true,
		hl = "MarkviewTypstMathSpan",
		corner_left = " ",
		corner_left_hl = "MarkviewTypstMathCorner",
		corner_right = " ",
		corner_right_hl = "MarkviewTypstMathCorner",
		padding_left = "",
		padding_right = "",
	},

	-- Mathematical symbols
	symbols = {
		enable = true,
		hl = "MarkviewTypstSymbol",

		-- Override specific symbols for better visual representation
		overrides = {
			-- Greek letters
			{ symbol = "alpha", hl = "MarkviewTypstGreek" },
			{ symbol = "beta", hl = "MarkviewTypstGreek" },
			{ symbol = "gamma", hl = "MarkviewTypstGreek" },
			{ symbol = "delta", hl = "MarkviewTypstGreek" },
			{ symbol = "epsilon", hl = "MarkviewTypstGreek" },
			{ symbol = "theta", hl = "MarkviewTypstGreek" },
			{ symbol = "lambda", hl = "MarkviewTypstGreek" },
			{ symbol = "mu", hl = "MarkviewTypstGreek" },
			{ symbol = "pi", hl = "MarkviewTypstGreek" },
			{ symbol = "sigma", hl = "MarkviewTypstGreek" },
			{ symbol = "phi", hl = "MarkviewTypstGreek" },
			{ symbol = "omega", hl = "MarkviewTypstGreek" },

			-- Math operators
			{ symbol = "times", hl = "MarkviewTypstOperator" },
			{ symbol = "div", hl = "MarkviewTypstOperator" },
			{ symbol = "pm", hl = "MarkviewTypstOperator" },
			{ symbol = "sum", hl = "MarkviewTypstOperator" },
			{ symbol = "prod", hl = "MarkviewTypstOperator" },
			{ symbol = "integral", hl = "MarkviewTypstOperator" },

			-- Arrows
			{ symbol = "arrow.r", hl = "MarkviewTypstArrow" },
			{ symbol = "arrow.l", hl = "MarkviewTypstArrow" },
			{ symbol = "arrow.t", hl = "MarkviewTypstArrow" },
			{ symbol = "arrow.b", hl = "MarkviewTypstArrow" },
			{ symbol = "arrow.lr", hl = "MarkviewTypstArrow" },
			{ symbol = "arrow.tb", hl = "MarkviewTypstArrow" },

			-- Relations
			{ symbol = "eq", hl = "MarkviewTypstRelation" },
			{ symbol = "equiv", hl = "MarkviewTypstRelation" },
			{ symbol = "approx", hl = "MarkviewTypstRelation" },
			{ symbol = "lt", hl = "MarkviewTypstRelation" },
			{ symbol = "gt", hl = "MarkviewTypstRelation" },
			{ symbol = "le", hl = "MarkviewTypstRelation" },
			{ symbol = "ge", hl = "MarkviewTypstRelation" },

			-- Set theory
			{ symbol = "in", hl = "MarkviewTypstSet" },
			{ symbol = "subset", hl = "MarkviewTypstSet" },
			{ symbol = "supset", hl = "MarkviewTypstSet" },
			{ symbol = "union", hl = "MarkviewTypstSet" },
			{ symbol = "inter", hl = "MarkviewTypstSet" },
			{ symbol = "emptyset", hl = "MarkviewTypstSet" },

			-- Logic
			{ symbol = "and", hl = "MarkviewTypstLogic" },
			{ symbol = "or", hl = "MarkviewTypstLogic" },
			{ symbol = "not", hl = "MarkviewTypstLogic" },
			{ symbol = "forall", hl = "MarkviewTypstLogic" },
			{ symbol = "exists", hl = "MarkviewTypstLogic" },

			-- Special symbols
			{ symbol = "infinity", hl = "MarkviewTypstSpecial" },
			{ symbol = "partial", hl = "MarkviewTypstSpecial" },
			{ symbol = "nabla", hl = "MarkviewTypstSpecial" },
		},
	},

	-- Reference links
	reference_links = {
		enable = true,
		hl = "MarkviewTypstReference",
		icon = "󰌷 ",
		icon_hl = "MarkviewTypstReferenceIcon",
	},

	-- URL links
	url_links = {
		enable = true,
		hl = "MarkviewTypstUrl",
		icon = "󰌷 ",
		icon_hl = "MarkviewTypstUrlIcon",

		-- Domain-specific styling
		patterns = {
			{
				pattern = "github%.com",
				icon = " ",
				icon_hl = "MarkviewTypstGithub",
			},
			{
				pattern = "stackoverflow%.com",
				icon = " ",
				icon_hl = "MarkviewTypstStackOverflow",
			},
			{
				pattern = "reddit%.com",
				icon = " ",
				icon_hl = "MarkviewTypstReddit",
			},
			{
				pattern = "youtube%.com",
				icon = " ",
				icon_hl = "MarkviewTypstYoutube",
			},
			{
				pattern = "twitter%.com",
				icon = " ",
				icon_hl = "MarkviewTypstTwitter",
			},
			{
				pattern = "wikipedia%.org",
				icon = " ",
				icon_hl = "MarkviewTypstWikipedia",
			},
		},
	},

	-- Labels
	labels = {
		enable = true,
		hl = "MarkviewTypstLabel",
		icon = "󰓹 ",
		icon_hl = "MarkviewTypstLabelIcon",
		padding_left = " ",
		padding_right = " ",
	},

	-- Subscripts
	subscripts = {
		enable = true,
		hl = "MarkviewTypstSubscript",
	},

	-- Superscripts
	superscripts = {
		enable = true,
		hl = "MarkviewTypstSuperscript",
	},

	-- Escaped characters
	escapes = {
		enable = true,
		hl = "MarkviewTypstEscape",
	},

	-- Term definitions
	terms = {
		enable = true,
		text = "/ ",
		text_hl = "MarkviewTypstTermMarker",
		hl = "MarkviewTypstTerm",
	},

	-- Strong emphasis
	strong = {
		enable = true,
		hl = "MarkviewTypstStrong",
	},

	-- Emphasis
	emph = {
		enable = true,
		hl = "MarkviewTypstEmph",
	},

	-- Quotes
	quotes = {
		enable = true,
		hl = "MarkviewTypstQuote",
	},
}
