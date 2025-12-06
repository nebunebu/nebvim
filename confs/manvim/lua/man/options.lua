local function set_options(scope, options)
	for option, value in pairs(options) do
		vim[scope][option] = value
	end
end

set_options("g", {
	mapleader = " ",
})

set_options("opt", {
	clipboard = "unnamedplus",
	autochdir = true,
	-- numbers
	number = false,
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
	timeoutlen = 200,
})
