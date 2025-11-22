--[[
  TypeScript-specific snippets

  Usage:
    These snippets extend JavaScript snippets with TypeScript-specific features
    All JavaScript snippets are also available in TypeScript files

  Examples:
    - "interface" → interface definition
    - "type" → type alias
    - "enum" → enum definition
--]]

local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local c = ls.choice_node
local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep

-- Load JavaScript snippets for TypeScript files
local js_snippets = require("snippets.javascript")

-- TypeScript-specific snippets
local ts_snippets = {
	-- Interface definition
	s("interface", fmt([[
		interface {} {{
		  {}: {};
		}}
	]], {
		i(1, "Name"),
		i(2, "property"),
		i(3, "type"),
	})),

	-- Type alias
	s("type", fmt([[
		type {} = {}
	]], {
		i(1, "Name"),
		i(2, "type"),
	})),

	-- Enum definition
	s("enum", fmt([[
		enum {} {{
		  {} = "{}",
		}}
	]], {
		i(1, "Name"),
		i(2, "VALUE"),
		i(3, "value"),
	})),

	-- Generic function
	s("genfunc", fmt([[
		function {}<{}>({}: {}): {} {{
		  {}
		}}
	]], {
		i(1, "name"),
		i(2, "T"),
		i(3, "arg"),
		i(4, "T"),
		i(5, "T"),
		i(6, "// body"),
	})),

	-- Generic arrow function
	s("genarrow", fmt([[
		const {} = <{}>({}: {}): {} => {{
		  {}
		}}
	]], {
		i(1, "name"),
		i(2, "T"),
		i(3, "arg"),
		i(4, "T"),
		i(5, "T"),
		i(6, "// body"),
	})),

	-- Class with constructor types
	s("tsclass", fmt([[
		class {} {{
		  private {}: {};

		  constructor({}: {}) {{
		    this.{} = {};
		  }}

		  {}
		}}
	]], {
		i(1, "ClassName"),
		i(2, "property"),
		i(3, "type"),
		rep(2),
		i(4, "type"),
		rep(2),
		rep(2),
		i(5, "// methods"),
	})),

	-- Method with types
	s("tsmethod", fmt([[
		{}({}: {}): {} {{
		  {}
		}}
	]], {
		i(1, "methodName"),
		i(2, "arg"),
		i(3, "argType"),
		i(4, "returnType"),
		i(5, "// body"),
	})),

	-- Const with type annotation
	s("tconst", fmt([[
		const {}: {} = {}
	]], {
		i(1, "name"),
		i(2, "type"),
		i(3, "value"),
	})),

	-- As type assertion
	s("as", fmt([[
		{} as {}
	]], {
		i(1, "value"),
		i(2, "type"),
	})),

	-- Namespace
	s("namespace", fmt([[
		namespace {} {{
		  {}
		}}
	]], {
		i(1, "Name"),
		i(2, "// content"),
	})),

	-- Mapped type
	s("mapped", fmt([[
		type {} = {{
		  [K in {}]: {};
		}}
	]], {
		i(1, "MappedType"),
		i(2, "keyof T"),
		i(3, "ValueType"),
	})),

	-- Utility type
	s("util", {
		t("type "),
		i(1, "Name"),
		t(" = "),
		c(2, {
			t("Partial<T>"),
			t("Required<T>"),
			t("Readonly<T>"),
			t("Pick<T, K>"),
			t("Omit<T, K>"),
			t("Record<K, V>"),
			t("Exclude<T, U>"),
			t("Extract<T, U>"),
			t("NonNullable<T>"),
			t("ReturnType<T>"),
			t("Parameters<T>"),
		}),
	}),

	-- TSDoc comment
	s("tsdoc", fmt([[
		/**
		 * {}
		 * @template {} - {}
		 * @param {{{}}} {} - {}
		 * @returns {{{}}} {}
		 */
	]], {
		i(1, "Function description"),
		i(2, "T"),
		i(3, "Template description"),
		i(4, "type"),
		i(5, "paramName"),
		i(6, "param description"),
		i(7, "returnType"),
		i(8, "return description"),
	})),

	-- Import type
	s("importtype", fmt([[
		import type {{ {} }} from "{}"
	]], {
		i(1, "Type"),
		i(2, "path"),
	})),

	-- Export type
	s("exptype", fmt([[
		export type {} = {}
	]], {
		i(1, "TypeName"),
		i(2, "type"),
	})),

	-- Readonly property
	s("readonly", fmt([[
		readonly {}: {};
	]], {
		i(1, "property"),
		i(2, "type"),
	})),

	-- Optional property
	s("optional", fmt([[
		{}?: {};
	]], {
		i(1, "property"),
		i(2, "type"),
	})),
}

-- Combine JavaScript and TypeScript snippets
local all_snippets = {}
for _, snippet in ipairs(js_snippets) do
	table.insert(all_snippets, snippet)
end
for _, snippet in ipairs(ts_snippets) do
	table.insert(all_snippets, snippet)
end

return all_snippets
