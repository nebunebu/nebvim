return {
	"urlview",
	keys = {
		{ "<leader>u", group = "UrlView" },
		{ "<leader>ub", "<cmd>UrlView buffer<CR>", desc = "UrlView Buffer to Clipboard" },
		{ "<leader>uf", "<cmd>UrlView flake action=gitdev<CR>", desc = "UrlView Flake Inputs to git-dev" },
	},
	after = function()
		require("urlview").setup({
			default_picker = "telescope",
			default_action = "clipboard",
		})

		local search = require("urlview.search")
		local search_helpers = require("urlview.search.helpers")

		-- Custom search for Nix flake inputs supporting multiple Git forges
		search["flake"] = function(mode)
			local lines
			if mode == "buf" or mode == "buffer" then
				lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
			else
				lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
			end

			local content = table.concat(lines, "\n")
			local urls = {}

			-- Pattern definitions for different Git forge platforms
			local patterns = {
				{ pattern = "github:([%w%-%.]+/[%w%-%.]+)([^%s,;%)]*)", base = "https://github.com/" },
				{ pattern = "gitlab:([%w%-%.]+/[%w%-%.]+)([^%s,;%)]*)", base = "https://gitlab.com/" },
				{ pattern = "sourcehut:([%w%-%.]+/[%w%-%.]+)([^%s,;%)]*)", base = "https://git.sr.ht/" },
				{ pattern = "codeberg:([%w%-%.]+/[%w%-%.]+)([^%s,;%)]*)", base = "https://codeberg.org/" },
			}

			-- Search for each pattern type
			for _, p in ipairs(patterns) do
				for path, ref in content:gmatch(p.pattern) do
					local url = p.base .. path .. ref
					table.insert(urls, { url = url, name = path })
				end
			end

			return urls
		end

		local actions = require("urlview.actions")

		actions["gitdev"] = function(raw_url)
			local git_dev = require("git-dev")
			git_dev.open(raw_url)
		end
	end,
}
