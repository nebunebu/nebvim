-- Comprehensive markdown configuration for markview.nvim
-- Covers: headings, lists, code blocks, tables, checkboxes, block quotes,
-- horizontal rules, inline codes, links, and more

return {
	enable = true,

	-- Headings (ATX and Setext styles)
	headings = {
		enable = true,
		shift_width = 0,

		-- ATX headings (# through ######)
		heading_1 = {
			style = "icon",
			sign = "󰌕 ",
			icon = "󰼏  ",
			hl = "MarkviewHeading1",
		},
		heading_2 = {
			style = "icon",
			sign = "󰌕 ",
			icon = "󰎨  ",
			hl = "MarkviewHeading2",
		},
		heading_3 = {
			style = "icon",
			sign = "󰌕 ",
			icon = "󰼑  ",
			hl = "MarkviewHeading3",
		},
		heading_4 = {
			style = "icon",
			sign = "󰌕 ",
			icon = "󰎲  ",
			hl = "MarkviewHeading4",
		},
		heading_5 = {
			style = "icon",
			sign = "󰌕 ",
			icon = "󰼓  ",
			hl = "MarkviewHeading5",
		},
		heading_6 = {
			style = "icon",
			sign = "󰌕 ",
			icon = "󰎴  ",
			hl = "MarkviewHeading6",
		},

		-- Setext headings (underlined with = or -)
		setext_1 = {
			style = "simple",
			hl = "MarkviewHeading1",
		},
		setext_2 = {
			style = "simple",
			hl = "MarkviewHeading2",
		},
	},

	-- Code blocks
	code_blocks = {
		enable = true,
		style = "block",
		hl = "MarkviewCodeBlock",
		pad_amount = 1,
		pad_char = " ",
		min_width = 60,

		-- Language-specific highlighting
		language_names = {
			{ "lua", "Lua" },
			{ "python", "Python" },
			{ "javascript", "JavaScript" },
			{ "typescript", "TypeScript" },
			{ "bash", "Bash" },
			{ "sh", "Shell" },
			{ "rust", "Rust" },
			{ "nix", "Nix" },
			{ "go", "Go" },
			{ "html", "HTML" },
			{ "css", "CSS" },
			{ "json", "JSON" },
			{ "yaml", "YAML" },
			{ "toml", "TOML" },
			{ "markdown", "Markdown" },
			{ "vim", "Vim" },
			{ "c", "C" },
			{ "cpp", "C++" },
			{ "java", "Java" },
			{ "ruby", "Ruby" },
		},

		-- Sign column display
		sign = true,
		sign_hl = nil,
	},

	-- Inline code
	inline_codes = {
		enable = true,
		hl = "MarkviewInlineCode",
		corner_left = " ",
		corner_right = " ",
		padding_left = " ",
		padding_right = " ",
	},

	-- Block quotes
	block_quotes = {
		enable = true,
		default = {
			border = "▋",
			border_hl = "MarkviewBlockQuoteDefault",
		},

		-- Callouts (GitHub-style alerts)
		callouts = {
			{
				match_string = "NOTE",
				callout_preview = "󰋽 Note",
				callout_preview_hl = "MarkviewBlockQuoteNote",
				border = "▋",
				border_hl = "MarkviewBlockQuoteNote",
			},
			{
				match_string = "TIP",
				callout_preview = "󰌶 Tip",
				callout_preview_hl = "MarkviewBlockQuoteTip",
				border = "▋",
				border_hl = "MarkviewBlockQuoteTip",
			},
			{
				match_string = "IMPORTANT",
				callout_preview = "󰅾 Important",
				callout_preview_hl = "MarkviewBlockQuoteImportant",
				border = "▋",
				border_hl = "MarkviewBlockQuoteImportant",
			},
			{
				match_string = "WARNING",
				callout_preview = "󰀪 Warning",
				callout_preview_hl = "MarkviewBlockQuoteWarn",
				border = "▋",
				border_hl = "MarkviewBlockQuoteWarn",
			},
			{
				match_string = "CAUTION",
				callout_preview = "󰳦 Caution",
				callout_preview_hl = "MarkviewBlockQuoteError",
				border = "▋",
				border_hl = "MarkviewBlockQuoteError",
			},
			{
				match_string = "ABSTRACT",
				callout_preview = "󰨸 Abstract",
				callout_preview_hl = "MarkviewBlockQuoteDefault",
				border = "▋",
				border_hl = "MarkviewBlockQuoteDefault",
			},
			{
				match_string = "SUMMARY",
				callout_preview = "󰨸 Summary",
				callout_preview_hl = "MarkviewBlockQuoteDefault",
				border = "▋",
				border_hl = "MarkviewBlockQuoteDefault",
			},
			{
				match_string = "TLDR",
				callout_preview = "󰨸 TL;DR",
				callout_preview_hl = "MarkviewBlockQuoteDefault",
				border = "▋",
				border_hl = "MarkviewBlockQuoteDefault",
			},
			{
				match_string = "INFO",
				callout_preview = "󰋽 Info",
				callout_preview_hl = "MarkviewBlockQuoteNote",
				border = "▋",
				border_hl = "MarkviewBlockQuoteNote",
			},
			{
				match_string = "TODO",
				callout_preview = "󰄱 Todo",
				callout_preview_hl = "MarkviewBlockQuoteNote",
				border = "▋",
				border_hl = "MarkviewBlockQuoteNote",
			},
			{
				match_string = "HINT",
				callout_preview = "󰌶 Hint",
				callout_preview_hl = "MarkviewBlockQuoteTip",
				border = "▋",
				border_hl = "MarkviewBlockQuoteTip",
			},
			{
				match_string = "SUCCESS",
				callout_preview = "󰄬 Success",
				callout_preview_hl = "MarkviewBlockQuoteOk",
				border = "▋",
				border_hl = "MarkviewBlockQuoteOk",
			},
			{
				match_string = "CHECK",
				callout_preview = "󰄬 Check",
				callout_preview_hl = "MarkviewBlockQuoteOk",
				border = "▋",
				border_hl = "MarkviewBlockQuoteOk",
			},
			{
				match_string = "DONE",
				callout_preview = "󰄬 Done",
				callout_preview_hl = "MarkviewBlockQuoteOk",
				border = "▋",
				border_hl = "MarkviewBlockQuoteOk",
			},
			{
				match_string = "QUESTION",
				callout_preview = "󰘥 Question",
				callout_preview_hl = "MarkviewBlockQuoteWarn",
				border = "▋",
				border_hl = "MarkviewBlockQuoteWarn",
			},
			{
				match_string = "HELP",
				callout_preview = "󰘥 Help",
				callout_preview_hl = "MarkviewBlockQuoteWarn",
				border = "▋",
				border_hl = "MarkviewBlockQuoteWarn",
			},
			{
				match_string = "FAQ",
				callout_preview = "󰘥 FAQ",
				callout_preview_hl = "MarkviewBlockQuoteWarn",
				border = "▋",
				border_hl = "MarkviewBlockQuoteWarn",
			},
			{
				match_string = "ATTENTION",
				callout_preview = "󰀪 Attention",
				callout_preview_hl = "MarkviewBlockQuoteWarn",
				border = "▋",
				border_hl = "MarkviewBlockQuoteWarn",
			},
			{
				match_string = "FAILURE",
				callout_preview = "󰅖 Failure",
				callout_preview_hl = "MarkviewBlockQuoteError",
				border = "▋",
				border_hl = "MarkviewBlockQuoteError",
			},
			{
				match_string = "FAIL",
				callout_preview = "󰅖 Fail",
				callout_preview_hl = "MarkviewBlockQuoteError",
				border = "▋",
				border_hl = "MarkviewBlockQuoteError",
			},
			{
				match_string = "MISSING",
				callout_preview = "󰅖 Missing",
				callout_preview_hl = "MarkviewBlockQuoteError",
				border = "▋",
				border_hl = "MarkviewBlockQuoteError",
			},
			{
				match_string = "DANGER",
				callout_preview = "󰳦 Danger",
				callout_preview_hl = "MarkviewBlockQuoteError",
				border = "▋",
				border_hl = "MarkviewBlockQuoteError",
			},
			{
				match_string = "ERROR",
				callout_preview = "󰅖 Error",
				callout_preview_hl = "MarkviewBlockQuoteError",
				border = "▋",
				border_hl = "MarkviewBlockQuoteError",
			},
			{
				match_string = "BUG",
				callout_preview = "󰃤 Bug",
				callout_preview_hl = "MarkviewBlockQuoteError",
				border = "▋",
				border_hl = "MarkviewBlockQuoteError",
			},
			{
				match_string = "EXAMPLE",
				callout_preview = "󰈙 Example",
				callout_preview_hl = "MarkviewBlockQuoteSpecial",
				border = "▋",
				border_hl = "MarkviewBlockQuoteSpecial",
			},
			{
				match_string = "QUOTE",
				callout_preview = "󱆨 Quote",
				callout_preview_hl = "MarkviewBlockQuoteDefault",
				border = "▋",
				border_hl = "MarkviewBlockQuoteDefault",
			},
			{
				match_string = "CITE",
				callout_preview = "󱆨 Cite",
				callout_preview_hl = "MarkviewBlockQuoteDefault",
				border = "▋",
				border_hl = "MarkviewBlockQuoteDefault",
			},
		},
	},

	-- List items
	list_items = {
		enable = true,
		shift_width = 0,
		indent_size = 0,

		-- Unordered lists
		marker_minus = {
			add_padding = true,
			text = "•",
			hl = "MarkviewListItemMinus",
		},
		marker_plus = {
			add_padding = false,
			text = "•",
			hl = "MarkviewListItemPlus",
		},
		marker_star = {
			add_padding = false,
			text = "•",
			hl = "MarkviewListItemStar",
		},

		-- Ordered lists
		marker_dot = {
			add_padding = false,
			text = ".",
			hl = "MarkviewListItemDot",
		},
		marker_parenthesis = {
			add_padding = false,
			text = ")",
			hl = "MarkviewListItemParenthesis",
		},
	},

	-- Checkboxes
	checkboxes = {
		enable = true,

		checked = {
			text = "󰄲",
			hl = "MarkviewCheckboxChecked",
			scope_hl = nil,
		},
		unchecked = {
			text = "󰄱",
			hl = "MarkviewCheckboxUnchecked",
			scope_hl = nil,
		},
		pending = {
			text = "󰥔",
			hl = "MarkviewCheckboxPending",
			scope_hl = nil,
		},
		-- Additional custom checkbox states
		custom = {
			{
				match = "~",
				text = "󰰱",
				hl = "MarkviewCheckboxCancelled",
			},
			{
				match = ">",
				text = "󰒊",
				hl = "MarkviewCheckboxForwarded",
			},
			{
				match = "<",
				text = "󰖃",
				hl = "MarkviewCheckboxScheduled",
			},
			{
				match = "!",
				text = "󰀪",
				hl = "MarkviewCheckboxImportant",
			},
			{
				match = "?",
				text = "󰘥",
				hl = "MarkviewCheckboxQuestion",
			},
			{
				match = "*",
				text = "󰓎",
				hl = "MarkviewCheckboxStar",
			},
			{
				match = '"',
				text = "󱆨",
				hl = "MarkviewCheckboxQuote",
			},
			{
				match = "i",
				text = "󰋽",
				hl = "MarkviewCheckboxInfo",
			},
			{
				match = "b",
				text = "󰃤",
				hl = "MarkviewCheckboxBug",
			},
			{
				match = "l",
				text = "󰆋",
				hl = "MarkviewCheckboxLocation",
			},
		},
	},

	-- Tables
	tables = {
		enable = true,
		text = true,
		hl = "MarkviewTableHeader",
		col_min_width = 0,
		use_virt_lines = false,

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
	},

	-- Horizontal rules
	horizontal_rules = {
		enable = true,

		parts = {
			{
				type = "repeating",
				text = "─",
				direction = "left",
				hl = {
					"MarkviewGradient1",
					"MarkviewGradient2",
					"MarkviewGradient3",
					"MarkviewGradient4",
					"MarkviewGradient5",
					"MarkviewGradient6",
					"MarkviewGradient7",
					"MarkviewGradient8",
					"MarkviewGradient9",
					"MarkviewGradient10",
				},
				repeat_amount = function()
					local textoff = vim.fn.getwininfo(vim.api.nvim_get_current_win())[1].textoff
					return math.floor((vim.o.colorcolumn - textoff) / 2)
				end,
			},
			{
				type = "text",
				text = "  ",
			},
			{
				type = "repeating",
				text = "─",
				direction = "right",
				hl = {
					"MarkviewGradient1",
					"MarkviewGradient2",
					"MarkviewGradient3",
					"MarkviewGradient4",
					"MarkviewGradient5",
					"MarkviewGradient6",
					"MarkviewGradient7",
					"MarkviewGradient8",
					"MarkviewGradient9",
					"MarkviewGradient10",
				},
				repeat_amount = function()
					local textoff = vim.fn.getwininfo(vim.api.nvim_get_current_win())[1].textoff
					return math.floor((vim.o.colorcolumn - textoff) / 2)
				end,
			},
		},
	},

	-- Links
	hyperlinks = {
		enable = true,
		hl = "MarkviewHyperlink",
		icon = "󰌷 ",
		icon_hl = "MarkviewHyperlinkIcon",
	},

	images = {
		enable = true,
		hl = "MarkviewImage",
		icon = "󰥶 ",
		icon_hl = "MarkviewImageIcon",
	},

	emails = {
		enable = true,
		hl = "MarkviewEmail",
		icon = "󰇰 ",
		icon_hl = "MarkviewEmailIcon",
	},

	-- Footnotes
	footnotes = {
		enable = true,
		hl = "MarkviewFootnote",
		superscript = true,
	},
}
