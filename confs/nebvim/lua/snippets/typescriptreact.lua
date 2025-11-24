--[[
  React/TypeScript snippets

  Usage:
    These snippets are available in .tsx files (React with TypeScript)
    Includes React-specific snippets in addition to TypeScript snippets

  Examples:
    - "rfc" → React functional component
    - "usestate" → useState hook
    - "useeffect" → useEffect hook
--]]

local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep

-- Load TypeScript snippets (which includes JavaScript)
local ts_snippets = require("snippets.typescript")

-- React-specific snippets
local react_snippets = {
	-- Functional component
	s(
		"rfc",
		fmt(
			[[
		interface {}Props {{
		  {}
		}}

		export const {}: React.FC<{}Props> = ({{ {} }}) => {{
		  return (
		    <div>
		      {}
		    </div>
		  )
		}}
	]],
			{
				i(1, "Component"),
				i(2, "// props"),
				rep(1),
				rep(1),
				i(3, "// destructured props"),
				i(4, "{/* content */}"),
			}
		)
	),

	-- Functional component (simple)
	s(
		"rfcs",
		fmt(
			[[
		export const {} = () => {{
		  return (
		    <div>
		      {}
		    </div>
		  )
		}}
	]],
			{
				i(1, "Component"),
				i(2, "{/* content */}"),
			}
		)
	),

	-- useState hook
	s(
		"usestate",
		fmt(
			[[
		const [{}, set{}] = useState<{}>({}]
	]],
			{
				i(1, "state"),
				f(function(args)
					local state = args[1][1]
					return state:sub(1, 1):upper() .. state:sub(2)
				end, { 1 }),
				i(2, "type"),
				i(3, "initialValue"),
			}
		)
	),

	-- useEffect hook
	s(
		"useeffect",
		fmt(
			[[
		useEffect(() => {{
		  {}

		  return () => {{
		    {}
		  }}
		}}, [{}])
	]],
			{
				i(1, "// effect"),
				i(2, "// cleanup"),
				i(3, "// dependencies"),
			}
		)
	),

	-- useRef hook
	s(
		"useref",
		fmt(
			[[
		const {} = useRef<{}>({}]
	]],
			{
				i(1, "ref"),
				i(2, "HTMLDivElement | null"),
				i(3, "null"),
			}
		)
	),

	-- useContext hook
	s(
		"usecontext",
		fmt(
			[[
		const {} = useContext({})
	]],
			{
				i(1, "context"),
				i(2, "Context"),
			}
		)
	),

	-- useCallback hook
	s(
		"usecallback",
		fmt(
			[[
		const {} = useCallback(({}) => {{
		  {}
		}}, [{}])
	]],
			{
				i(1, "callback"),
				i(2, "args"),
				i(3, "// body"),
				i(4, "// dependencies"),
			}
		)
	),

	-- useMemo hook
	s(
		"usememo",
		fmt(
			[[
		const {} = useMemo(() => {{
		  {}
		}}, [{}])
	]],
			{
				i(1, "memoized"),
				i(2, "return value"),
				i(3, "// dependencies"),
			}
		)
	),

	-- useReducer hook
	s(
		"usereducer",
		fmt(
			[[
		const [{}, dispatch] = useReducer({}, {}]
	]],
			{
				i(1, "state"),
				i(2, "reducer"),
				i(3, "initialState"),
			}
		)
	),

	-- Custom hook
	s(
		"hook",
		fmt(
			[[
		export const use{} = ({}) => {{
		  {}

		  return {{ {} }}
		}}
	]],
			{
				i(1, "Custom"),
				i(2, "// params"),
				i(3, "// hook logic"),
				i(4, "// return values"),
			}
		)
	),

	-- Context provider
	s(
		"provider",
		fmt(
			[[
		interface {}ContextType {{
		  {}
		}}

		const {}Context = createContext<{}ContextType | undefined>(undefined)

		export const {}Provider: React.FC<{{ children: React.ReactNode }}> = ({{ children }}) => {{
		  {}

		  const value = {{
		    {}
		  }}

		  return (
		    <{}Context.Provider value={{value}}>
		      {{children}}
		    </{}Context.Provider>
		  )
		}}

		export const use{} = () => {{
		  const context = useContext({}Context)
		  if (!context) {{
		    throw new Error("use{} must be used within {}Provider")
		  }}
		  return context
		}}
	]],
			{
				i(1, "Theme"),
				i(2, "// context type"),
				rep(1),
				rep(1),
				rep(1),
				i(3, "// state"),
				i(4, "// value"),
				rep(1),
				rep(1),
				rep(1),
				rep(1),
				rep(1),
				rep(1),
			}
		)
	),

	-- Props interface
	s(
		"props",
		fmt(
			[[
		interface {}Props {{
		  {}: {};
		}}
	]],
			{
				i(1, "Component"),
				i(2, "prop"),
				i(3, "type"),
			}
		)
	),

	-- Import React
	s("imr", {
		t("import React from 'react'"),
	}),

	-- Import useState
	s("imus", {
		t("import { useState } from 'react'"),
	}),

	-- Import useEffect
	s("imue", {
		t("import { useEffect } from 'react'"),
	}),

	-- className
	s(
		"cn",
		fmt(
			[[
		className="{}"
	]],
			{
				i(1, "classes"),
			}
		)
	),

	-- style prop
	s(
		"style",
		fmt(
			[[
		style={{{{ {}: "{}" }}}}
	]],
			{
				i(1, "property"),
				i(2, "value"),
			}
		)
	),

	-- Event handler
	s(
		"handler",
		fmt(
			[[
		const handle{} = ({}) => {{
		  {}
		}}
	]],
			{
				i(1, "Click"),
				c(2, {
					t("e: React.MouseEvent"),
					t("e: React.ChangeEvent<HTMLInputElement>"),
					t("e: React.FormEvent"),
					t("e: React.KeyboardEvent"),
				}),
				i(3, "// handler body"),
			}
		)
	),

	-- onChange handler
	s(
		"onchange",
		fmt(
			[[
		onChange={{(e) => set{}(e.target.value)}}
	]],
			{
				f(function()
					-- Try to get a sensible default from context
					return "Value"
				end),
			}
		)
	),

	-- onClick handler
	s(
		"onclick",
		fmt(
			[[
		onClick={{() => {{}}}}
	]],
			{
				i(1, "// action"),
			}
		)
	),

	-- Conditional rendering
	s(
		"cond",
		fmt(
			[[
		{{{}  && {}}}
	]],
			{
				i(1, "condition"),
				i(2, "<Component />"),
			}
		)
	),

	-- Ternary rendering
	s(
		"tern",
		fmt(
			[[
		{{{} ? {} : {}}}
	]],
			{
				i(1, "condition"),
				i(2, "<TrueComponent />"),
				i(3, "<FalseComponent />"),
			}
		)
	),

	-- Map over array
	s(
		"map",
		fmt(
			[[
		{{{}.map(({}) => (
		  <{} key={{{}}}>
		    {}
		  </{}>
		))}}
	]],
			{
				i(1, "items"),
				i(2, "item"),
				i(3, "div"),
				i(4, "item.id"),
				i(5, "{item.name}"),
				rep(3),
			}
		)
	),
}

-- Combine TypeScript and React snippets
local all_snippets = {}
for _, snippet in ipairs(ts_snippets) do
	table.insert(all_snippets, snippet)
end
for _, snippet in ipairs(react_snippets) do
	table.insert(all_snippets, snippet)
end

return all_snippets
