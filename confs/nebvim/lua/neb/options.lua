local function set_options(scope, options)
	for option, value in pairs(options) do
		vim[scope][option] = value
	end
end

set_options("g", {
	mapleader = " ",
	maplocalleader = ",",
})

set_options("opt", {
	clipboard = "unnamedplus",
	autochdir = true,
	-- numbers
	number = true,
	relativenumber = true,
	-- tabs
	expandtab = true,
	shiftwidth = 2,
	tabstop = 2,
	smarttab = true,
	-- search
	ignorecase = true,
	smartcase = true,
	incsearch = true,
	-- linebreaks
	wrap = true,
	linebreak = true,
	showbreak = "↪ ",
	breakindent = true,
	-- swap and undo files
	undofile = true,
	swapfile = false,
	-- folds
	foldmethod = "marker",
	foldmarker = "{{{,}}}",
	-- splits
	splitright = true,

	-- other
	fillchars = { eob = " " },

	-- spelling
	spell = true,
	spelllang = "en_us",
	spellfile = os.getenv("HOME") .. "/.config/nvim/spell/en.utf-8.add",
})
