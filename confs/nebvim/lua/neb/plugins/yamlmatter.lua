require("yamlmatter").setup({
	icon_mappings = {
		title = "",
		idea = "",
		default = "󰦨",
	},
	highlight_groups = {
		icon = "MyIconHighlight",
		key = "MyKeyHighlight",
		value = "MyValueHighlight",
	},
	key_value_padding = 4, -- Less space
	conceallevel = 1, -- on what level start conceal the yaml text
})
