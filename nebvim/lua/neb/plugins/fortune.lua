require("fortune").setup({
	-- max width the fortune section should take place
	max_width = 60,

	-- Controls the amount of text displayed
	-- short - One liners (default)
	-- long - Multiple lines
	-- mixed - Combination of above
	display_format = "mixed",

	-- The type of fortune to display
	-- quotes - Random techy quotes
	-- tips - Neovim productivity tips
	-- mixed - Combination of above
	content_type = "mixed",

	-- An optional object of custom quotes to replace the default ones like this:
	-- {
	--     short = {
	--         { "This is a short quote", "- Author" },
	--         { "This is another short quote", "- Author" },
	--     },
	--     long = {
	--         { "This is a long quote", "- Author" },
	--         { "This is another long quote", "- Author" },
	--     }
	-- }
	custom_quotes = {},

	-- An optional object of custom tips to replace the default ones like this:
	-- {
	--     short = {
	--         { "In normal mode, x will delete a single character" },
	--         { "In visual mode, x will delete a range of characters" },
	--     },
	--     long = {
	--         { "To delete from the current line to the end of the line, use d$" },
	--         { "To delete from the current line to the beginning of the line, use d^" },
	--     }
	-- }
	custom_tips = {},
})
