local M = {}

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
	local plugins = {
		"telescope-nvim",
		"obsidian",
		"quarto",
		"markview",
		"nvim-dap",
		"triptych",
		"global-note",
		"cellular-automaton",
		"urlview",
		"taskwarrior",
		"nix-develop",
		"helpview",
	}

	for _, plugin in ipairs(plugins) do
		status[plugin] = M.is_plugin_loaded(plugin)
	end

	print("Plugin Load Status:")
	for plugin, loaded in pairs(status) do
		print(string.format("%s: %s", plugin, loaded and "Loaded" or "Not Loaded"))
	end
end

vim.api.nvim_create_user_command("CheckLazy", function()
	M.print_lazy_status()
end, {})

return M
