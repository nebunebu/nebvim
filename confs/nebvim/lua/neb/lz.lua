local M = {}

---@diagnostic disable-next-line: undefined-global
local pcall = pcall
---@diagnostic disable-next-line: undefined-global
local package = package
---@diagnostic disable-next-line: undefined-global
local math = math

M.plugins = {} -- Store plugins list

function M.setup(plugins)
	M.plugins = plugins
	M.load_plugins()
end

function M.load_plugins()
	for _, plugin in pairs(M.plugins) do
		local ok, spec = pcall(require, "neb.plugins." .. plugin)
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
	local sorted_plugins = {}

	-- First collect status and find longest name
	for _, plugin in ipairs(M.plugins) do
		status[plugin] = M.is_plugin_loaded(plugin)
		max_length = math.max(max_length, #plugin)
		table.insert(sorted_plugins, plugin)
	end

	-- Sort plugins alphabetically
	table.sort(sorted_plugins)

	-- Add some padding to max_length
	max_length = max_length + 2

	vim.api.nvim_echo({ { "Plugin Load Status:", "Title" } }, false, {})

	for _, plugin in ipairs(sorted_plugins) do
		local loaded = status[plugin]
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
