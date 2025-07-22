local servers = {
	"astro",
	"luals",
	"marksman",
	"nixd",
	"qmlls",
	"typescript",
}

for _, server in ipairs(servers) do
	require("neb.plugins.lsp.servers." .. server)
	vim.lsp.enable(server)
end

require("neb.plugins.lsp.ui.outline")
require("neb.plugins.lsp.ui.fidget")
