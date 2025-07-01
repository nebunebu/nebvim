return {
	"rustaceanvim",
	ft = "rust",
	after = function()
		vim.g.rustaceanvim = {
			tools = {},
			server = {
				on_attach = function(client, bufnr)
					if client.server_capabilities.inlayHintProvider then
						vim.defer_fn(function()
							vim.lsp.inlay_hint.enable(true)
						end, 500)
					end
				end,
				default_settings = {
					["rust-analyzer"] = {
						inlayHints = {
							enabled = true,
						},
					},
				},
			},
			dap = {},
		}
	end,
}
