return {
	"luasnip",
	event = "InsertEnter", -- Load when entering insert mode for better performance
	after = function()
		local luasnip = require("luasnip")

		-- LuaSnip configuration
		luasnip.setup({
			-- Enable history: Jump back into snippets after leaving them
			history = true,

			-- Update dynamic snippets as you type
			update_events = "TextChanged,TextChangedI",

			-- Delete snippets when jumping out
			delete_check_events = "TextChanged",

			-- Enable autotrigger snippets (snippets that expand without <Tab>)
			enable_autosnippets = false,

			-- Use <Tab> and <S-Tab> for jumping (configured in blink.cmp)
			-- Store snippet history across sessions
			store_selection_keys = "<Tab>",
		})

		-- Load snippets from different formats:

		-- 1. Load Lua snippets (recommended format, most flexible)
		-- Snippets should be in: lua/snippets/<filetype>.lua or lua/snippets/all.lua
		require("luasnip.loaders.from_lua").lazy_load({
			paths = { vim.fn.stdpath("config") .. "/lua/snippets" },
		})

		-- 2. Load VSCode-style snippets (JSON format)
		-- Snippets should be in: snippets/ directory with package.json
		-- require("luasnip.loaders.from_vscode").lazy_load()

		-- 3. Load SnipMate-style snippets
		-- require("luasnip.loaders.from_snipmate").lazy_load()

		-- Keymaps for snippet navigation (optional, as blink.cmp handles this)
		-- You can use these in visual mode for selection transformation
		vim.keymap.set({ "i", "s" }, "<C-k>", function()
			if luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			end
		end, { desc = "LuaSnip: Expand or jump forward", silent = true })

		vim.keymap.set({ "i", "s" }, "<C-j>", function()
			if luasnip.jumpable(-1) then
				luasnip.jump(-1)
			end
		end, { desc = "LuaSnip: Jump backward", silent = true })

		-- Change choice in choiceNode (e.g., multiple snippet variants)
		vim.keymap.set("i", "<C-l>", function()
			if luasnip.choice_active() then
				luasnip.change_choice(1)
			end
		end, { desc = "LuaSnip: Change choice", silent = true })
	end,
}
