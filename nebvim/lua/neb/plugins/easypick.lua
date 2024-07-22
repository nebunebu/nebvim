local easypick = require("easypick")

easypick.setup({
	pickers = {
		{
			-- 	name = "stylix",
			-- 	command = [[jq 'values[]' /etc/stylix/palette.json | sed 's/\"//g' | sed '/tylix/d' | sed 's/^/#/']],
			--     action = function(stylix)
			--       vim.api.nvim_put({stylix.value}, "c", false, true)
			--     end,
			-- 	-- action = function(emoji)
			-- 	-- 	vim.api.nvim_put({ emoji.value }, "c", false, true)
			-- 	-- end,
			-- },
			-- {
			-- 	name = "ls",
			-- 	command = "ls",
			-- 	previewer = easypick.previewers.default(),
			-- },
			-- {
			-- 	name = "conflicts",
			-- 	command = "git diff --name-only --diff-filter=U --relative",
			-- 	previewer = easypick.previewers.file_diff(),
			-- },
			-- },
		},
		-- {
		-- 	name = "nixpkgs",
		-- 	command = "nix search --json nixpkgs | jq 'keys[]' | sed 's/legacyPackages.x86_64-linux.//g'",
		-- 	previewer = easypick.previewers.default(),
		-- 	-- action = "",
		-- },
	},
})
