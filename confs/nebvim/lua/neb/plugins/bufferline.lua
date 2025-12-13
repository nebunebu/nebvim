return {
	"bufferline",
	event = { "BufAdd", "BufEnter" },
	keys = {
		-- Navigation
		-- { "<Tab>", "<cmd>BufferLineCycleNext<CR>", desc = "Next Buffer" },
		-- { "<S-Tab>", "<cmd>BufferLineCyclePrev<CR>", desc = "Previous Buffer" },

		-- Buffer Management
		-- { "<leader>x", "<cmd>bdelete<CR>", desc = "Close Buffer" },
		-- { "<leader>bo", "<cmd>BufferLineCloseOthers<CR>", desc = "Close Other Buffers" },
		-- { "<leader>br", "<cmd>BufferLineCloseRight<CR>", desc = "Close Buffers to Right" },
		-- { "<leader>bl", "<cmd>BufferLineCloseLeft<CR>", desc = "Close Buffers to Left" },

		-- Pinning and Picking
		-- { "<leader>bp", "<cmd>BufferLineTogglePin<CR>", desc = "Toggle Pin Buffer" },
		-- { "<leader>bP", "<cmd>BufferLinePick<CR>", desc = "Pick Buffer" },
		-- { "gb", "<cmd>BufferLinePick<CR>", desc = "Pick Buffer" },
		-- { "gD", "<cmd>BufferLinePickClose<CR>", desc = "Pick Buffer to Close" },

		-- Sorting
		-- { "<leader>bse", "<cmd>BufferLineSortByExtension<CR>", desc = "Sort by Extension" },
		-- { "<leader>bsd", "<cmd>BufferLineSortByDirectory<CR>", desc = "Sort by Directory" },
		-- { "<leader>bst", "<cmd>BufferLineSortByTabs<CR>", desc = "Sort by Tabs" },
	},
	after = function()
		require("bufferline").setup({
			options = {
				numbers = "none",
				close_command = "bdelete! %d",
				right_mouse_command = "bdelete! %d",
				left_mouse_command = "buffer %d",
				middle_mouse_command = nil,

				indicator = {
					icon = "▎",
					style = "icon",
				},

				buffer_close_icon = "󰅖",
				modified_icon = "●",
				close_icon = "",
				left_trunc_marker = "",
				right_trunc_marker = "",

				max_name_length = 18,
				max_prefix_length = 15,
				truncate_names = true,
				tab_size = 18,

				-- LSP diagnostics
				diagnostics = "nvim_lsp",
				diagnostics_update_in_insert = false,
				diagnostics_indicator = function(count, level, diagnostics_dict, context)
					local icon = level:match("error") and " " or " "
					return " " .. icon .. count
				end,

				-- Offset for file explorers
				offsets = {
					{
						filetype = "NvimTree",
						text = "File Explorer",
						text_align = "center",
						separator = true,
					},
				},

				color_icons = true,
				show_buffer_icons = true,
				show_buffer_close_icons = true,
				show_close_icon = true,
				show_tab_indicators = true,
				show_duplicate_prefix = true,
				persist_buffer_sort = true,
				separator_style = "slant",
				enforce_regular_tabs = false,
				always_show_bufferline = true,

				-- Hover settings
				hover = {
					enabled = true,
					delay = 200,
					reveal = { "close" },
				},

				sort_by = "insert_after_current",
			},
		})
	end,
}
