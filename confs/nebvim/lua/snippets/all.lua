--[[
  Global snippets available in all filetypes

  LuaSnip Documentation: https://github.com/L3MON4D3/LuaSnip/blob/master/DOC.md

  Usage:
    1. Type the trigger text (e.g., "todo")
    2. Snippet appears in completion menu (via blink.cmp)
    3. Press <CR> to expand snippet
    4. Use <Tab>/<S-Tab> to jump between snippet nodes
    5. Use <C-l> to cycle through choice nodes

  Snippet Structure:
    s(trigger, nodes, opts) - Snippet
      - trigger: string or table with trigger word
      - nodes: table of snippet nodes
      - opts: options like description, priority, etc.

  Node Types:
    - t("text"): Static text
    - i(index, "default"): Insert node (jump point)
    - f(function, args): Function node (dynamic)
    - c(index, { choice1, choice2 }): Choice node (alternatives)
    - d(index, function): Dynamic node (complex)
    - r(index, "snip_name"): Restore node (from history)
    - sn(nil, nodes): Snippet node (nested snippet)

  Helper Functions:
    - fmt(format_string, nodes): Format string with {} placeholders
    - rep(index): Repeat insert node value
--]]

local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta -- Uses <> instead of {}
local rep = require("luasnip.extras").rep

-- Helper function: Get current date
local function get_date()
	return os.date("%Y-%m-%d")
end

-- Helper function: Get current time
local function get_time()
	return os.date("%H:%M:%S")
end

-- Helper function: Get current datetime
local function get_datetime()
	return os.date("%Y-%m-%d %H:%M:%S")
end

-- Helper function: Get filename without extension
local function get_filename()
	return vim.fn.expand("%:t:r")
end

return {
	-- Simple static snippet
	s("todo", {
		t("TODO: "),
		i(1, "task description"),
	}),

	-- Snippet with choice node
	s("note", {
		c(1, {
			t("NOTE: "),
			t("FIXME: "),
			t("HACK: "),
			t("WARN: "),
			t("PERF: "),
			t("TEST: "),
		}),
		i(2, "description"),
	}),

	-- Date snippet with function node
	s("date", {
		f(get_date),
	}),

	-- Time snippet
	s("time", {
		f(get_time),
	}),

	-- Datetime snippet
	s("datetime", {
		f(get_datetime),
	}),

	-- Multi-line snippet using fmt
	s("box", fmt([[
	┌{}┐
	│ {} │
	└{}┘
	]], {
		f(function(args)
			return string.rep("─", #args[1][1] + 2)
		end, { 1 }),
		i(1, "content"),
		f(function(args)
			return string.rep("─", #args[1][1] + 2)
		end, { 1 }),
	})),

	-- License header snippet
	s("license", fmt([[
	Copyright (c) {} {}

	Permission is hereby granted, free of charge, to any person obtaining a copy
	of this software and associated documentation files (the "Software"), to deal
	in the Software without restriction, including without limitation the rights
	to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
	copies of the Software.
	]], {
		f(function()
			return os.date("%Y")
		end),
		i(1, "Author Name"),
	})),
}
