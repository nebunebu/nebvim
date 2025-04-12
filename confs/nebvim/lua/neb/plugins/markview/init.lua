return {
	"markview.nvim",
	ft = { "markdown", "quarto" },
	enabled = true,
	after = function()
		local markview = require("markview")
		markview.setup({
			preview = {
				hybrid_modes = { "n" },
				-- filetypes = { "markdown", "quarto", "typst", "latex", "codecompanion" },
				callbacks = {
					on_enable = function(_, win)
						vim.wo[win].conceallevel = 2
						vim.wo[win].concealcursor = "c"
					end,
				},
			},
			markdown = require("neb.plugins.markview.markdown"),
			highlight_groups = require("neb.plugins.markview.highlight_groups"),

			checkboxes = {
				enable = true,
				checked = {
					-- text = "✔",
					text = "󰄬",
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
			-- code_blocks = {
			-- 	enable = true,
			--
			-- 	style = "language",
			-- 	hl = "layer2",
			--
			-- 	min_width = 55,
			-- 	pad_amount = 0,
			--
			-- 	language_names = {
			-- 		{ "py", "python" },
			-- 		{ "cpp", "C++" },
			-- 	},
			-- 	language_direction = "right",
			--
			-- 	sign = true,
			-- 	sign_hl = nil,
			-- },

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

				-- callouts = {
				-- 	--- From `Obsidian`
				-- 	{
				-- 		match_string = "ABSTRACT",
				-- 		callout_preview = "󱉫 Abstract",
				-- 		callout_preview_hl = "fg_cyan",
				--
				-- 		custom_title = true,
				-- 		custom_icon = "󱉫 ",
				--
				-- 		border = "▋",
				-- 		border_hl = "fg_cyan",
				-- 	},
				-- 	{
				-- 		match_string = "TODO",
				-- 		callout_preview = " Todo",
				-- 		callout_preview_hl = "fg_pink",
				--
				-- 		custom_title = true,
				-- 		custom_icon = " ",
				--
				-- 		border = "▋",
				-- 		border_hl = "fg_pink",
				-- 	},
				-- 	{
				-- 		match_string = "SUCCESS",
				-- 		callout_preview = "󰗠 Success",
				-- 		callout_preview_hl = "fg_green",
				--
				-- 		custom_title = true,
				-- 		custom_icon = "󰗠 ",
				--
				-- 		border = "▋",
				-- 		border_hl = "fg_green",
				-- 	},
				-- 	{
				-- 		match_string = "QUESTION",
				-- 		callout_preview = "󰋗 Question",
				-- 		callout_preview_hl = "fg_purple",
				--
				-- 		custom_title = true,
				-- 		custom_icon = "󰋗 ",
				--
				-- 		border = "▋",
				-- 		border_hl = "fg_purple",
				-- 	},
				-- 	{
				-- 		match_string = "FAILURE",
				-- 		callout_preview = "󰅙 Failure",
				-- 		callout_preview_hl = "fg_red",
				--
				-- 		custom_title = true,
				-- 		custom_icon = "󰅙 ",
				--
				-- 		border = "▋",
				-- 		border_hl = "fg_red",
				-- 	},
				-- 	{
				-- 		match_string = "DANGER",
				-- 		callout_preview = " Danger",
				-- 		callout_preview_hl = "fg_red",
				--
				-- 		custom_title = true,
				-- 		custom_icon = "  ",
				--
				-- 		border = "▋",
				-- 		border_hl = "fg_red",
				-- 	},
				-- 	{
				-- 		match_string = "BUG",
				-- 		callout_preview = " Bug",
				-- 		callout_preview_hl = "fg_yellow",
				--
				-- 		custom_title = true,
				-- 		custom_icon = "  ",
				--
				-- 		border = "▋",
				-- 		border_hl = "fg_yellow",
				-- 	},
				-- 	{
				-- 		match_string = "EXAMPLE",
				-- 		callout_preview = "󱖫 Example",
				-- 		callout_preview_hl = "fg_purple",
				--
				-- 		custom_title = true,
				-- 		custom_icon = " 󱖫 ",
				--
				-- 		border = "▋",
				-- 		border_hl = "fg_purple",
				-- 	},
				-- 	{
				-- 		match_string = "QUOTE",
				-- 		callout_preview = " Quote",
				-- 		callout_preview_hl = "fg_gray",
				--
				-- 		custom_title = true,
				-- 		custom_icon = "  ",
				--
				-- 		border = "▋",
				-- 		border_hl = "fg_gray",
				-- 	},
				-- 	{
				-- 		match_string = "NOTE",
				-- 		callout_preview = "󰋽 Note",
				-- 		callout_preview_hl = "fg_cyan",
				--
				-- 		border = "▋",
				-- 		border_hl = "fg_cyan",
				-- 	},
				-- 	{
				-- 		match_string = "TIP",
				-- 		callout_preview = " Tip",
				-- 		callout_preview_hl = "fg_green",
				--
				-- 		border = "▋",
				-- 		border_hl = "fg_green",
				-- 	},
				-- 	{
				-- 		match_string = "IMPORTANT",
				-- 		callout_preview = " Important",
				-- 		callout_preview_hl = "fg_pink",
				--
				-- 		border = "▋",
				-- 		border_hl = "fg_pink",
				-- 	},
				-- 	{
				-- 		match_string = "WARNING",
				-- 		callout_preview = " Warning",
				-- 		callout_preview_hl = "fg_red",
				--
				-- 		border = "▋",
				-- 		border_hl = "fg_red",
				-- 	},
				-- 	{
				-- 		match_string = "CAUTION",
				-- 		callout_preview = "󰳦 Caution",
				-- 		callout_preview_hl = "fg_yellow",
				--
				-- 		border = "▋",
				-- 		border_hl = "fg_yellow",
				-- 	},
				-- 	{
				-- 		match_string = "CUSTOM",
				-- 		callout_preview = "󰠳 Custom",
				-- 		callout_preview_hl = "fg_cyan",
				--
				-- 		custom_title = true,
				-- 		custom_icon = " 󰠳 ",
				--
				-- 		border = "▋",
				-- 		border_hl = "fg_cyan",
				-- 	},
				-- },
			},
		})
	end,
}
