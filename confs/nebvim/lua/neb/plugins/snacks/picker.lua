-- return {
-- 	enabled = true,
-- 	optional = true,
-- }

local function find_root(markers)
	markers = markers or { ".git", "flake.nix" }
	local path = vim.fn.expand("%:p:h")
	if path == "" then
		path = vim.fn.getcwd()
	end

	local root = vim.fs.find(markers, { path = path, upward = true })[1]
	return root and vim.fn.fnamemodify(root, ":h") or vim.fn.getcwd()
end

return {
	enabled = true,
	optional = true,
	sources = {
		files = {
			config = function(opts)
				opts.cwd = opts.cwd or find_root({ ".git", "flake.nix" })
				return opts
			end,
		},
		grep = {
			config = function(opts)
				opts.cwd = opts.cwd or find_root({ ".git", "flake.nix" })
				return opts
			end,
		},
	},
}
