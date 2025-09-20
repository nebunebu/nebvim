vim.lsp.config["nixd"] = {
	cmd = { "nixd" },
	filetypes = { "nix" },
	root_markers = { ".git", "flake.nix", "default.nix" },
	settings = {
		nixd = {
			nixpkgs = {
				-- expr = 'let flakePath = builtins.toString ./.; in if builtins.pathExists (flakePath + "/flake.nix") then import (builtins.getFlake ("git+file://" + flakePath)).inputs.nixpkgs { } else import (builtins.getFlake ("git+file://" + builtins.getEnv "HOME" + "/.nix-config")).inputs.nixpkgs { }',
			},
			formatting = {
				command = { "nixfmt" },
			},
			options = {
				nixos = {
					-- expr = '(builtins.getFlake ("git+file://" + builtins.getEnv "HOME" + "/.nix-config")).nixosConfigurations.${builtins.getEnv "HOSTNAME"}.options',
				},
				home_manager = {
					-- expr = '(builtins.getFlake ("git+file://" + builtins.getEnv "HOME" + "/.nix-config")).nixosConfigurations.${builtins.getEnv "HOSTNAME"}.options.home-manager.users.type.getSubOptions []',
				},
			},
			-- diagnostic = {},
		},
	},
}
