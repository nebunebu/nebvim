local servers = {
	"luals",
	"marksman",
	"nixd",
	"qmlls",
}

for _, server in ipairs(servers) do
	require("neb.plugins.lsp.servers" .. server)
	vim.lsp.enable(server)
end
