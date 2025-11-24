return {
	"spellwarn",
	event = "BufReadPre",
	after = function()
		require("spellwarn").setup({
			enable = true,
			ft_config = {
				alpha = "none",
				help = "none",
				lazy = "none",
				lspinfo = "none",
				mason = "none",
			},
			ft_default = "user",
			max_file_size = nil,
			severity = {
				spellbad = "WARN",
				spellcap = "HINT",
				spelllocal = "HINT",
				spellrare = "INFO",
			},
			prefix = "possible misspelling(s): ",
		})
	end,
}
