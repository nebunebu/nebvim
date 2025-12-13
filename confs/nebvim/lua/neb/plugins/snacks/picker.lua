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
	actions = {
		confirm = function(picker)
			local item = picker:current()
			if not item then
				return
			end

			local current_buf = vim.api.nvim_get_current_buf()
			local buftype = vim.bo[current_buf].buftype
			local filetype = vim.bo[current_buf].filetype

			-- Check if we're in a special buffer
			local is_special = buftype ~= "" or filetype == "dashboard" or filetype == "netrw"
			picker:close()

			vim.schedule(function()
				if is_special then
					-- For special buffers, create a new buffer first
					vim.cmd("enew")
				end

				-- Disable autocommands temporarily
				local saved_ei = vim.o.eventignore
				vim.o.eventignore = "BufRead,BufReadPre,FileReadPre"

				-- Open the file
				if item.file then
					vim.cmd("edit " .. vim.fn.fnameescape(item.file))
				elseif item.buf then
					vim.cmd("buffer " .. item.buf)
				end

				-- Restore autocommands
				vim.o.eventignore = saved_ei

				-- Trigger post-read events
				vim.cmd("doautocmd BufReadPost")

				-- Jump to position if available
				if item.pos then
					pcall(vim.api.nvim_win_set_cursor, 0, { item.pos[1], item.pos[2] })
				end
			end)
		end,
	},

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
