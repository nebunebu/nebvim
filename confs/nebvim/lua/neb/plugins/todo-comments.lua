return {
	"todo-comments",
	event = "BufReadPre",
	after = function()
		require("todo-comments").setup({
			signs = true,
			sign_priority = 8,
			keywords = {
				FIX = {
					icon = " ",
					color = "red",
					alt = { "FIXME", "BUG", "FIXIT", "ISSUE" },
				},
				TODO = { icon = " ", color = "green" },
				HACK = { icon = " ", color = "teal" },
				WARN = { icon = " ", color = "yellow", alt = { "WARNING", "XXX" } },
				PERF = { icon = "󰅒 ", color = "white", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
				NOTE = { icon = "󱞁 ", color = "purple", alt = { "INFO" } },
				TEST = { icon = "󰙨 ", color = "pink", alt = { "TESTING", "PASSED", "FAILED" } },
			},
			gui_style = { fg = "BOLD", bg = "BOLD" },
			merge_keywords = true, -- when true, custom keywords will be merged with the defaults
			-- highlighting of the line containing the todo comment
			-- * before: highlights before the keyword (typically comment characters)
			-- * keyword: highlights of the keyword
			-- * after: highlights after the keyword (todo text)
			highlight = {
				multiline = true, -- enable multine todo comments
				multiline_pattern = "^.", -- lua pattern to match the next multiline from the start of the matched keyword
				multiline_context = 10, -- extra lines that will be re-evaluated when changing a line
			},
			colors = {
				white = { "#e0def4" },
				red = { "#eb6f92" },
				yellow = { "#f6c177" },
				pink = { "#ebbcba" },
				green = { "#31748f" },
				teal = { "#9ccfd8" },
				purple = { "#c4a7e7" },
			},
		})
	end,
}
