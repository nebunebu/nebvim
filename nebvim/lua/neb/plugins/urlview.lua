require("urlview").setup({
	default_picker = "telescope",
	default_action = "clipboard",
})

local search = require("urlview.search")
local search_helpers = require("urlview.search.helpers")

search["flake"] = search_helpers.generate_custom_search({
	-- TODO:
	-- capture all github patterns
	-- capture all gitlab patterns
	-- capture all sourcelab patterns
	capture = "github:([%w%-]+/[%w%-%.]+)([^%s]*)",
	format = "https://github.com/%s",
})

local actions = require("urlview.actions")

actions["gitdev"] = function(raw_url)
	local git_dev = require("git-dev")
	git_dev.open(raw_url)
end
