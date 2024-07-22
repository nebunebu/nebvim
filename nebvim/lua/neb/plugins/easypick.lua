local easypick = require("easypick")

easypick.setup({
	pickers = {
		{
			name = "ls",
			command = "ls",
			previewer = easypick.previewers.default(),
		},
		{
			name = "conflicts",
			command = "git diff --name-only --diff-filter=U --relative",
			previewer = easypick.previewers.file_diff(),
		},
		{
			name = "nixpkgs",
			command = "nix search --json nixpkgs | jq 'keys[]' | sed 's/legacyPackages.x86_64-linux.//g'",
			previewer = easypick.previewers.default(),
			-- action = "",
		},
	},
})
