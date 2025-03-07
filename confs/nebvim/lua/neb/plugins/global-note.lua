return {
	"global-note",
	keys = {
		{
			"<leader><leader>",
			function()
				require("global-note").toggle_note()
			end,
			desc = "Toggle global note",
			mode = "n",
		},
	},

	after = function()
		local global_note = require("global-note")

		global_note.setup({
			filename = "global.md",
			directory = vim.fn.stdpath("data") .. "/global-note/",
			title = "Global Note",
			command_name = "GlobalNote",
			window_config = function()
				local window_height = vim.api.nvim_list_uis()[1].height
				local window_width = vim.api.nvim_list_uis()[1].width
				return {
					relative = "editor",
					border = "single",
					title = "Note",
					title_pos = "center",
					width = math.floor(0.7 * window_width),
					height = math.floor(0.85 * window_height),
					row = math.floor(0.05 * window_height),
					col = math.floor(0.15 * window_width),
				}
			end,
			post_open = function(_, _) end,
			autosave = true,
			additional_presets = {},
		})
	end,
}
