vim.lsp.config["ts_ls"] = {
	cmd = { "typescript-language-server", "--stdio" },
	filetypes = {
		"javascript",
		"javascriptreact",
		"javascript.jsx",
		"typescript",
		"typescriptreact",
		"typescrpti.tsx",
	},
	-- commands = {
	--   ["editor.action.showReferences"] = <function 1>
	-- },
	-- handlers = {
	--   ["_typescript.rename"] = <function 1>
	-- },
	init_options = {
		hostInfo = "neovim",
	},
	root_markers = {
		"tsconfig.json",
		"jsconfig.json",
		"package.json",
		".git",
	},
}
