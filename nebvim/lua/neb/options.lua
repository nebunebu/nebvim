local config = {
	g = {
		mapleader = " ",
	},
	opt = {
		clipboard = "unnamedplus",

		autochdir = true,

		number = true,
		relativenumber = true,

		expandtab = true,
		shiftwidth = 2,
		tabstop = 2,
		smarttab = true,

		undofile = true,
		swapfile = false,

		ignorecase = true,
		smartcase = true,
		incsearch = true,
		fillchars = { eob = " " },

		wrap = true,
		linebreak = true,
		showbreak = "↪ ",
		breakindent = true,
	},
}

for scope, table in pairs(config) do
	for option, value in pairs(table) do
		vim[scope][option] = value
	end
end
