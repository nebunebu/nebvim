-- Main markview.nvim configuration
-- Integrates markdown, HTML, LaTeX, Typst, and YAML rendering

local M = {}

-- Import format-specific configurations
local markdown_config = require("neb.plugins.markview.markdown")
-- local html_config = require("neb.plugins.markview.html")
-- local latex_config = require("neb.plugins.markview.latex")
local typst_config = require("neb.plugins.markview.typst")
local yaml_config = require("neb.plugins.markview.yaml")

-- Plugin specification for lz.n
M[1] = "markview"

-- Load triggers
M.ft = { "markdown", "quarto", "rmd" }

-- After function for setup
M.after = function()
	local markview = require("markview")

	markview.setup({
		-- Core settings
		max_length = 99999, -- Maximum file size to render

		preview = {

			-- Modes where previews are shown
			modes = { "n", "i", "no", "c" },
			debounce = 50, -- Debounce delay in ms
			-- Hybrid mode configuration
			hybrid_modes = { "i" }, -- Show both preview and source in insert mode
			-- ignore_buftypes = {}, -- No buffers ignored
			-- Callbacks
			callbacks = {
				on_enable = function(_, win)
					vim.wo[win].conceallevel = 2
					vim.wo[win].concealcursor = "nc"
				end,
				on_disable = function(_, win)
					vim.wo[win].conceallevel = 0
					vim.wo[win].concealcursor = ""
				end,
			},
		},

		-- Highlight groups
		highlight_groups = {
			-- Headings (gradient colors)
			{
				group_name = "MarkviewHeading1",
				value = { fg = "#eb6f92", bg = "#2a273f", bold = true },
			},
			{
				group_name = "MarkviewHeading2",
				value = { fg = "#f6c177", bg = "#2a273f", bold = true },
			},
			{
				group_name = "MarkviewHeading3",
				value = { fg = "#9ccfd8", bg = "#2a273f", bold = true },
			},
			{
				group_name = "MarkviewHeading4",
				value = { fg = "#c4a7e7", bg = "#2a273f", bold = true },
			},
			{
				group_name = "MarkviewHeading5",
				value = { fg = "#ebbcba", bg = "#2a273f", bold = true },
			},
			{
				group_name = "MarkviewHeading6",
				value = { fg = "#31748f", bg = "#2a273f", bold = true },
			},

			-- Code blocks
			{
				group_name = "MarkviewCodeBlock",
				value = { bg = "#232136" },
			},
			{
				group_name = "MarkviewInlineCode",
				value = { fg = "#eb6f92", bg = "#232136" },
			},

			-- Block quotes
			{
				group_name = "MarkviewBlockQuoteDefault",
				value = { fg = "#6e6a86" },
			},
			{
				group_name = "MarkviewBlockQuoteNote",
				value = { fg = "#9ccfd8" },
			},
			{
				group_name = "MarkviewBlockQuoteTip",
				value = { fg = "#f6c177" },
			},
			{
				group_name = "MarkviewBlockQuoteImportant",
				value = { fg = "#c4a7e7" },
			},
			{
				group_name = "MarkviewBlockQuoteWarn",
				value = { fg = "#f6c177" },
			},
			{
				group_name = "MarkviewBlockQuoteError",
				value = { fg = "#eb6f92" },
			},
			{
				group_name = "MarkviewBlockQuoteOk",
				value = { fg = "#9ccfd8" },
			},
			{
				group_name = "MarkviewBlockQuoteSpecial",
				value = { fg = "#c4a7e7" },
			},

			-- Lists and checkboxes
			{
				group_name = "MarkviewListItemMinus",
				value = { fg = "#eb6f92" },
			},
			{
				group_name = "MarkviewListItemPlus",
				value = { fg = "#9ccfd8" },
			},
			{
				group_name = "MarkviewListItemStar",
				value = { fg = "#f6c177" },
			},
			{
				group_name = "MarkviewCheckboxChecked",
				value = { fg = "#9ccfd8" },
			},
			{
				group_name = "MarkviewCheckboxUnchecked",
				value = { fg = "#6e6a86" },
			},
			{
				group_name = "MarkviewCheckboxPending",
				value = { fg = "#f6c177" },
			},

			-- Tables
			{
				group_name = "MarkviewTableHeader",
				value = { fg = "#eb6f92", bold = true },
			},
			{
				group_name = "MarkviewTableBorder",
				value = { fg = "#6e6a86" },
			},

			-- Links
			{
				group_name = "MarkviewHyperlink",
				value = { fg = "#9ccfd8", underline = true },
			},
			{
				group_name = "MarkviewHyperlinkIcon",
				value = { fg = "#9ccfd8" },
			},
			{
				group_name = "MarkviewImage",
				value = { fg = "#c4a7e7" },
			},
			{
				group_name = "MarkviewImageIcon",
				value = { fg = "#c4a7e7" },
			},

			-- Horizontal rules (gradient)
			{
				group_name = "MarkviewGradient1",
				value = { fg = "#eb6f92" },
			},
			{
				group_name = "MarkviewGradient2",
				value = { fg = "#eb7f9c" },
			},
			{
				group_name = "MarkviewGradient3",
				value = { fg = "#eb8fa6" },
			},
			{
				group_name = "MarkviewGradient4",
				value = { fg = "#eb9fb0" },
			},
			{
				group_name = "MarkviewGradient5",
				value = { fg = "#ebafba" },
			},
			{
				group_name = "MarkviewGradient6",
				value = { fg = "#ebbfc4" },
			},
			{
				group_name = "MarkviewGradient7",
				value = { fg = "#ebbcba" },
			},
			{
				group_name = "MarkviewGradient8",
				value = { fg = "#c4a7e7" },
			},
			{
				group_name = "MarkviewGradient9",
				value = { fg = "#9ccfd8" },
			},
			{
				group_name = "MarkviewGradient10",
				value = { fg = "#9ccfd8" },
			},

			-- HTML elements
			{
				group_name = "MarkviewHtmlStrong",
				value = { bold = true },
			},
			{
				group_name = "MarkviewHtmlEm",
				value = { italic = true },
			},
			{
				group_name = "MarkviewHtmlCode",
				value = { fg = "#eb6f92", bg = "#232136" },
			},
			{
				group_name = "MarkviewHtmlKbd",
				value = { fg = "#f6c177", bg = "#232136" },
			},
			{
				group_name = "MarkviewHtmlLink",
				value = { fg = "#9ccfd8", underline = true },
			},

			-- LaTeX
			{
				group_name = "MarkviewLatexBlock",
				value = { bg = "#232136" },
			},
			{
				group_name = "MarkviewLatexInline",
				value = { fg = "#c4a7e7", bg = "#232136" },
			},
			{
				group_name = "MarkviewLatexOperator",
				value = { fg = "#f6c177" },
			},
			{
				group_name = "MarkviewLatexFunction",
				value = { fg = "#9ccfd8" },
			},
			{
				group_name = "MarkviewLatexSymbol",
				value = { fg = "#eb6f92" },
			},
			{
				group_name = "MarkviewLatexGreek",
				value = { fg = "#c4a7e7" },
			},

			-- Typst
			{
				group_name = "MarkviewTypstCodeBlock",
				value = { bg = "#232136" },
			},
			{
				group_name = "MarkviewTypstMathBlock",
				value = { bg = "#232136" },
			},
			{
				group_name = "MarkviewTypstSymbol",
				value = { fg = "#eb6f92" },
			},

			-- YAML
			{
				group_name = "MarkviewYamlText",
				value = { fg = "#9ccfd8" },
			},
			{
				group_name = "MarkviewYamlNumber",
				value = { fg = "#f6c177" },
			},
			{
				group_name = "MarkviewYamlBoolean",
				value = { fg = "#eb6f92" },
			},
			{
				group_name = "MarkviewYamlTags",
				value = { fg = "#c4a7e7" },
			},
		},

		-- Format-specific configurations
		markdown = markdown_config,
		html = html_config,
		latex = latex_config,
		typst = typst_config,
		yaml = yaml_config,
	})

	-- Keybindings (using which-key in main init)
	vim.keymap.set("n", "<leader>mt", "<cmd>Markview toggle<cr>", { desc = "Toggle Markview" })
	vim.keymap.set("n", "<leader>me", "<cmd>Markview enable<cr>", { desc = "Enable Markview" })
	vim.keymap.set("n", "<leader>md", "<cmd>Markview disable<cr>", { desc = "Disable Markview" })
	vim.keymap.set("n", "<leader>mh", "<cmd>Markview hybridToggle<cr>", { desc = "Toggle hybrid mode" })
	vim.keymap.set("n", "<leader>ms", "<cmd>Markview splitToggle<cr>", { desc = "Toggle split view" })
end

return M
