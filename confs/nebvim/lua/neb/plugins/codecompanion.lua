return {
	"codecompanion",
	keys = {
		{ "<leader>a", group = "codecompanion" },
		{ "<leader>aa", "<cmd>CodeCompanionActions<CR>", desc = "codecompanion actions" },
		{ "<leader>ac", "<cmd>CodeCompanionChat<CR>", desc = "codecompanion actions" },
	},
	cmd = {
		"CodeCompanion",
		"CodeCompanionChat",
		"CodeCompanionCmd",
		"CodeCompanionActions",
	},
	after = function()
		require("codecompanion").setup({
			strategies = {
				chat = {
					adapter = "gemini",
					keymaps = {
						send = {
							modes = { n = "<C-s>", i = "<C-s>" },
						},
						close = {
							modes = { n = "<C-c>", i = "<C-c>" },
						},
					},
				},
				inline = {
					adapter = "gemini",
				},
			},
			display = {
				action_palette = {
					width = 95,
					height = 10,
					prompt = "Prompt ", -- Prompt used for interactive LLM calls
					provider = "telescope", -- default|telescope|mini_pick
					opts = {

						show_default_actions = true, -- Show the default actions in the action palette?
						show_default_prompt_library = true, -- Show the default prompt library in the action palette?
					},
				},
			},
			-- opts = {
			-- 	log_level = "DEBUG",
			-- },
		})
	end,
}
