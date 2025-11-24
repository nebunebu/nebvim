return {
	"spellwarn",
	event = "BufReadPre",
	after = function()
		require("spellwarn").setup({
			enable = true,
			event = {
				"BufWritePost",
			},
			ft_config = {
				alpha = "none",
				help = "none",
				lazy = "none",
				lspinfo = "none",
				mason = "none",
			},
			ft_default = true,
			max_file_size = nil,
			severity = {
				spellbad = "WARN",
				spellcap = "HINT",
				spelllocal = "HINT",
				spellrare = "INFO",
			},
			prefix = "possible misspelling(s): ",
			num_suggest = 3,
			suggest = true,
			diagnostic_opts = { severity_sort = true }, -- options for diagnostic display
		})
	end,
}
