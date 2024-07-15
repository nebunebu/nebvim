-- First, set up direnv as you normally would
require("direnv").setup({
	autoload_direnv = true,
})

-- Then, override the _init function
vim.schedule(function()
	local direnv = require("direnv")

	direnv._init = function(path)
		vim.schedule(function()
			vim.notify("Reloading " .. path)
		end)

		local cwd = vim.fs.dirname(path)

		local on_exit = function(obj)
			vim.schedule(function()
				for _, line in ipairs(vim.fn.split(obj.stdout, "\n")) do
					-- Remove any leading/trailing whitespace
					line = vim.fn.trim(line)
					-- Skip empty lines
					if line ~= "" then
						-- Escape any single quotes in the line
						line = line:gsub("'", "''")
						-- Execute the line as a Vim command
						pcall(vim.cmd, "execute '" .. line .. "'")
					end
				end
			end)
		end

		vim.system({ "direnv", "export", "vim" }, { text = true, cwd = cwd }, on_exit)
	end
end)
