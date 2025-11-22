--[[
  Lua-specific snippets

  Usage:
    These snippets are only available in Lua files (.lua)
    Trigger them by typing the trigger text and selecting from completion menu

  Examples:
    - "func" → function definition
    - "req" → require statement
    - "local" → local variable
    - "for" → for loop
    - "if" → if statement
--]]

local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep

return {
	-- Function definition
	s("func", fmt([[
		function {}({})
			{}
		end
	]], {
		i(1, "name"),
		i(2, "args"),
		i(3, "-- body"),
	})),

	-- Local function
	s("lfunc", fmt([[
		local function {}({})
			{}
		end
	]], {
		i(1, "name"),
		i(2, "args"),
		i(3, "-- body"),
	})),

	-- Anonymous function
	s("fn", fmt([[
		function({})
			{}
		end
	]], {
		i(1, "args"),
		i(2, "-- body"),
	})),

	-- Require statement
	s("req", fmt([[
		local {} = require("{}")
	]], {
		i(1, "module"),
		rep(1),
	})),

	-- Require statement with different name
	s("reqas", fmt([[
		local {} = require("{}")
	]], {
		i(1, "alias"),
		i(2, "module"),
	})),

	-- Local variable
	s("local", fmt([[
		local {} = {}
	]], {
		i(1, "name"),
		i(2, "value"),
	})),

	-- If statement
	s("if", fmt([[
		if {} then
			{}
		end
	]], {
		i(1, "condition"),
		i(2, "-- body"),
	})),

	-- If-else statement
	s("ife", fmt([[
		if {} then
			{}
		else
			{}
		end
	]], {
		i(1, "condition"),
		i(2, "-- if body"),
		i(3, "-- else body"),
	})),

	-- If-elseif-else statement
	s("ifelif", fmt([[
		if {} then
			{}
		elseif {} then
			{}
		else
			{}
		end
	]], {
		i(1, "condition1"),
		i(2, "-- if body"),
		i(3, "condition2"),
		i(4, "-- elseif body"),
		i(5, "-- else body"),
	})),

	-- For loop (numeric)
	s("for", fmt([[
		for {} = {}, {} do
			{}
		end
	]], {
		i(1, "i"),
		i(2, "1"),
		i(3, "10"),
		i(4, "-- body"),
	})),

	-- For-in loop (ipairs)
	s("fori", fmt([[
		for {}, {} in ipairs({}) do
			{}
		end
	]], {
		i(1, "i"),
		i(2, "v"),
		i(3, "table"),
		i(4, "-- body"),
	})),

	-- For-in loop (pairs)
	s("forp", fmt([[
		for {}, {} in pairs({}) do
			{}
		end
	]], {
		i(1, "k"),
		i(2, "v"),
		i(3, "table"),
		i(4, "-- body"),
	})),

	-- While loop
	s("while", fmt([[
		while {} do
			{}
		end
	]], {
		i(1, "condition"),
		i(2, "-- body"),
	})),

	-- Repeat-until loop
	s("repeat", fmt([[
		repeat
			{}
		until {}
	]], {
		i(1, "-- body"),
		i(2, "condition"),
	})),

	-- Table definition
	s("table", fmt([[
		local {} = {{
			{} = {},
		}}
	]], {
		i(1, "name"),
		i(2, "key"),
		i(3, "value"),
	})),

	-- Neovim autocommand
	s("autocmd", fmt([[
		vim.api.nvim_create_autocmd("{}", {{
			pattern = "{}",
			callback = function()
				{}
			end,
		}})
	]], {
		i(1, "event"),
		i(2, "*"),
		i(3, "-- callback body"),
	})),

	-- Neovim keymap
	s("keymap", fmt([[
		vim.keymap.set("{}", "{}", function()
			{}
		end, {{ desc = "{}" }})
	]], {
		c(1, {
			t("n"),
			t("i"),
			t("v"),
			t("x"),
			t("t"),
			t("c"),
		}),
		i(2, "<leader>"),
		i(3, "-- action"),
		i(4, "description"),
	})),

	-- Neovim user command
	s("command", fmt([[
		vim.api.nvim_create_user_command("{}", function({})
			{}
		end, {{ {} }})
	]], {
		i(1, "CommandName"),
		c(2, {
			t(""),
			t("opts"),
		}),
		i(3, "-- command body"),
		i(4, ""),
	})),

	-- Module template
	s("module", fmt([[
		--[[
		  {}

		  {}
		--]]

		local M = {{}}

		{}

		return M
	]], {
		f(function()
			return vim.fn.expand("%:t")
		end),
		i(1, "Module description"),
		i(2, "-- Module code"),
	})),

	-- Protected call (pcall)
	s("pcall", fmt([[
		local ok, {} = pcall({}, {})
		if not ok then
			{}
		end
	]], {
		i(1, "result"),
		i(2, "func"),
		i(3, "args"),
		i(4, 'vim.notify("Error: " .. result, vim.log.levels.ERROR)'),
	})),

	-- Print with vim.inspect
	s("prinsp", fmt([[
		print(vim.inspect({}))
	]], {
		i(1, "value"),
	})),

	-- LuaSnip plugin snippet template
	s("snippet", fmt([[
		return {{
			"{}",
			{} = "{}",
			after = function()
				{}
			end,
		}}
	]], {
		i(1, "plugin-name"),
		c(2, {
			t("event"),
			t("cmd"),
			t("keys"),
			t("ft"),
		}),
		i(3, "BufReadPre"),
		i(4, '-- plugin setup'),
	})),
}
