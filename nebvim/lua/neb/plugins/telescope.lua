return {
	"telescope-nvim",
	keys = {
		{ "<leader>f", group = "telescope" },
		{ "<leader>fc", "<cmd>Telescope current_buffer_fuzzy_find<CR>", desc = "Find in current buffer" },
		{ "<leader>ff", "<cmd>Telescope find_files<CR>", desc = "Find files" },
		{ "<leader>fg", "<cmd>Telescope live_grep<CR>", desc = "Find with live_grep" },
		{ "<leader>fh", "<cmd>Telescope help_tags<CR>", desc = "Find help tags" },
		{ "<leader>fH", "<cmd>Telescope heading<CR>", desc = "Find markdown headers" },
		{ "<leader>fm", "<cmd>Telescope man_pages<CR>", desc = "Find man pages" },
		{ "<leader>fo", "<cmd>Telescope oldfiles<CR>", desc = "Find old files" },
		{ "<leader>fp", "<cmd>Telescope repo list<CR>", desc = "Find Project" },

		{ "<leader>fn", group = "Manix" },
		{
			"<leader>fnh",
			function()
				require("telescope-manix").search({
					manix_args = { "--source", "hm-options" },
				})
			end,
			desc = "Search Home Manager options",
		},
		{
			"<leader>fno",
			function()
				require("telescope-manix").search({
					manix_args = { "--source", "nixos-options" },
				})
			end,
			desc = "Search NixOS Options",
		},
		{
			"<leader>fnd",
			function()
				require("telescope-manix").search({
					manix_args = { "--source", "nixpkgs-doc" },
				})
			end,
			desc = "Search Nixpkgs Doc",
		},
		{
			"<leader>fnc",
			function()
				require("telescope-manix").search({
					manix_args = { "--source", "nixpgks-comments" },
				})
			end,
			desc = "Search NixOS Nixpkgs Comments",
		},
		{
			"<leader>fnt",
			function()
				require("telescope-manix").search({
					manix_args = { "--source", "nixpgks-tree" },
				})
			end,
			desc = "Search Nixpkgs Tree",
		},

		{ "<leader>ft", group = "Telescope todo-comments" },
		{ "<leader>ftp", "<cmd>TodoTelescope<CR>", desc = "Find project todo-comments" },

		{ "<leader>fs", group = "Telescope symbol" },
		{ "<leader>fsg", "<cmd>Telescope nerdy<CR>", desc = "Find nerdfont glyph" },
		{ "<leader>fse", "<cmd>Telescope emoji<CR>", desc = "Find emoji" },

		-- { "<leader>fvc", "<cmd>Telescope conflicts<CR>", desc = "Find git conflicts" },
	},
	after = function()
		local actions = require("telescope.actions")
		local action_state = require("telescope.actions.state")

		require("telescope").setup({
			defaults = {
				file_ignore_patterns = {
					"%.local/share/nebvim/global%-note/global%.md$",
				},
			},
			pickers = {
				help_tags = {
					mappings = {
						i = {
							["<CR>"] = function(prompt_bufnr)
								actions.close(prompt_bufnr)
								local selection = action_state.get_selected_entry()
								-- Custom action here
								vim.cmd("HauntHelp " .. selection.value)
							end,
						},
					},
				},
				man_pages = {
					sections = { "ALL" },
					mappings = {
						i = {
							["<CR>"] = function(prompt_bufnr)
								actions.close(prompt_bufnr)
								local selection = action_state.get_selected_entry()
								-- Custom action here
								vim.cmd("HauntMan " .. selection.value)
							end,
						},
					},
				},
			},
			extensions = {
				heading = { treesitter = true },
				fzf = {},
				emoji = {
					action = function(emoji)
						vim.api.nvim_put({ emoji.value }, "c", false, true)
					end,
				},
				default_opts = {
					manix_args = {},
					-- Set to true to search for the word under the cursor
					cword = false,
				},
				repo = {
					list = {
						fd_opts = {
							"-E",
							".local",
							"-E",
							".cache",
							"-E",
							"ags-collection",
							"-E",
							"node_modules",
							"-E",
							".cargo",
						},
					},
				},
			},
		})

		-- [[ NOTE: consider using https://github.com/nvim-telescope/telescope-symbols.nvim/ instead of  nerdy and emoji
		-- ]]
		--
		-- require("telescope").load_extension("conflicts")
		require("telescope").load_extension("dap")
		-- require("telescope").load_extension("emoji")
		require("telescope").load_extension("fzf")
		-- require("telescope").load_extension("heading")
		require("telescope").load_extension("manix")
		-- require("telescope").load_extension("nerdy")
		-- require("telescope").load_extension("repo")
		-- NOTE: extensions to add
		-- telescope-tele-tabby
		-- browser-bookmarks.nvim
		-- nvim-neoclip.lua
		-- telescope-tmuxinator.nvim
		-- cheatsheet.nvim
		-- telescope-windowizer.nvim
		-- telescope-manix
		-- easypick.nvim
		-- telescope-tabs
		-- telescope-dap.nvim
		-- telescope-git-diffs.nvim
		-- ad-telescope-extensions.nvim
		-- telescope-extension-maker
	end,
}
