local M = {}

function M.load_plugins()
	for _, plugin in pairs(M.plugins) do -- Changed to use _ for unused index
		local ok, spec = pcall(require, "neb.lz." .. plugin)
		if ok then
			require("lz.n").load(spec)
		else
			vim.notify("Failed to load plugin: " .. plugin, vim.log.levels.ERROR)
		end
	end
end

function M.get_loaded_plugins()
	local loaded = {}
	for k, _ in pairs(package.loaded) do
		table.insert(loaded, k)
	end
	return loaded
end

function M.is_plugin_loaded(plugin_name)
	return package.loaded[plugin_name] ~= nil
end

function M.print_lazy_status()
	local status = {}
	local max_length = 0

	-- First collect status and find longest name
	for _, plugin in ipairs(M.plugins) do
		status[plugin] = M.is_plugin_loaded(plugin)
		max_length = math.max(max_length, #plugin)
	end

	-- Add some padding to max_length
	max_length = max_length + 2

	vim.api.nvim_echo({ { "Plugin Load Status:", "Title" } }, false, {})

	for plugin, loaded in pairs(status) do
		local status_text = loaded and "Loaded" or "Not Loaded"
		local hl_group = loaded and "Statement" or "DiagnosticWarn"
		-- Create padding
		local padding = string.rep(" ", max_length - #plugin)
		vim.api.nvim_echo({
			{ plugin .. padding, "None" },
			{ status_text, hl_group },
		}, false, {})
	end
end

vim.api.nvim_create_user_command("LzCheck", function()
	M.print_lazy_status()
end, {})

return M
