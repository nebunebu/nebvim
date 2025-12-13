local function find_root(markers)
	markers = markers or { ".git", "flake.nix" }

	local path = vim.fn.getcwd()

	-- Safely attempt to get buffer path
	local ok, bufname = pcall(vim.api.nvim_buf_get_name, 0)
	if ok and bufname ~= "" then
		local bufpath = vim.fn.fnamemodify(bufname, ":h")
		if bufpath ~= "" then
			path = bufpath
		end
	end

	local root = vim.fs.find(markers, { path = path, upward = true })[1]
	return root and vim.fn.fnamemodify(root, ":h") or path
end

return {
	enabled = true,
	optional = true,
	sources = {
		files = {
			config = function(opts)
				if not opts.cwd then
					opts.cwd = find_root({ ".git", "flake.nix" })
				end
				return opts
			end,
		},
		grep = {
			config = function(opts)
				if not opts.cwd then
					opts.cwd = find_root({ ".git", "flake.nix" })
				end
				return opts
			end,
		},
	},
}
