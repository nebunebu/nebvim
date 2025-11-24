--[[
  JavaScript/TypeScript snippets

  Usage:
    These snippets are available in JavaScript (.js, .jsx) and TypeScript (.ts, .tsx) files

  Examples:
    - "func" → function definition
    - "arrow" → arrow function
    - "class" → class definition
    - "import" → import statement
--]]

local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep

return {
	-- Function declaration
	s(
		"func",
		fmt(
			[[
		function {}({}) {{
		  {}
		}}
	]],
			{
				i(1, "name"),
				i(2, "args"),
				i(3, "// body"),
			}
		)
	),

	-- Arrow function
	s(
		"arrow",
		fmt(
			[[
		const {} = ({}) => {{
		  {}
		}}
	]],
			{
				i(1, "name"),
				i(2, "args"),
				i(3, "// body"),
			}
		)
	),

	-- Arrow function (single expression)
	s(
		"arrowexp",
		fmt(
			[[
		const {} = ({}) => {}
	]],
			{
				i(1, "name"),
				i(2, "args"),
				i(3, "expression"),
			}
		)
	),

	-- Async function
	s(
		"async",
		fmt(
			[[
		async function {}({}) {{
		  {}
		}}
	]],
			{
				i(1, "name"),
				i(2, "args"),
				i(3, "// body"),
			}
		)
	),

	-- Async arrow function
	s(
		"asyncarrow",
		fmt(
			[[
		const {} = async ({}) => {{
		  {}
		}}
	]],
			{
				i(1, "name"),
				i(2, "args"),
				i(3, "// body"),
			}
		)
	),

	-- Import statement
	s(
		"import",
		fmt(
			[[
		import {} from "{}"
	]],
			{
				i(1, "module"),
				i(2, "path"),
			}
		)
	),

	-- Import destructured
	s(
		"importd",
		fmt(
			[[
		import {{ {} }} from "{}"
	]],
			{
				i(1, "exports"),
				i(2, "path"),
			}
		)
	),

	-- Export default
	s(
		"expd",
		fmt(
			[[
		export default {}
	]],
			{
				i(1, "value"),
			}
		)
	),

	-- Export named
	s(
		"exp",
		fmt(
			[[
		export const {} = {}
	]],
			{
				i(1, "name"),
				i(2, "value"),
			}
		)
	),

	-- Class definition
	s(
		"class",
		fmt(
			[[
		class {} {{
		  constructor({}) {{
		    {}
		  }}

		  {}
		}}
	]],
			{
				i(1, "ClassName"),
				i(2, "args"),
				i(3, "// constructor body"),
				i(4, "// methods"),
			}
		)
	),

	-- Method definition
	s(
		"method",
		fmt(
			[[
		{}({}) {{
		  {}
		}}
	]],
			{
				i(1, "methodName"),
				i(2, "args"),
				i(3, "// body"),
			}
		)
	),

	-- Console log
	s(
		"log",
		fmt(
			[[
		console.log({})
	]],
			{
				i(1, "value"),
			}
		)
	),

	-- Console log with label
	s(
		"logl",
		fmt(
			[[
		console.log("{}: ", {})
	]],
			{
				i(1, "label"),
				rep(1),
			}
		)
	),

	-- Try-catch block
	s(
		"try",
		fmt(
			[[
		try {{
		  {}
		}} catch ({}) {{
		  {}
		}}
	]],
			{
				i(1, "// try block"),
				c(2, {
					t("error"),
					t("err"),
					t("e"),
				}),
				i(3, "console.error(error)"),
			}
		)
	),

	-- Promise
	s(
		"promise",
		fmt(
			[[
		new Promise((resolve, reject) => {{
		  {}
		}})
	]],
			{
				i(1, "// promise body"),
			}
		)
	),

	-- Async/await with try-catch
	s(
		"asynctry",
		fmt(
			[[
		try {{
		  const {} = await {}
		  {}
		}} catch ({}) {{
		  {}
		}}
	]],
			{
				i(1, "result"),
				i(2, "promise"),
				i(3, "// success"),
				c(4, {
					t("error"),
					t("err"),
				}),
				i(5, "console.error(error)"),
			}
		)
	),

	-- If statement
	s(
		"if",
		fmt(
			[[
		if ({}) {{
		  {}
		}}
	]],
			{
				i(1, "condition"),
				i(2, "// body"),
			}
		)
	),

	-- If-else statement
	s(
		"ife",
		fmt(
			[[
		if ({}) {{
		  {}
		}} else {{
		  {}
		}}
	]],
			{
				i(1, "condition"),
				i(2, "// if body"),
				i(3, "// else body"),
			}
		)
	),

	-- Ternary operator
	s(
		"tern",
		fmt(
			[[
		{} ? {} : {}
	]],
			{
				i(1, "condition"),
				i(2, "true-value"),
				i(3, "false-value"),
			}
		)
	),

	-- For loop
	s(
		"for",
		fmt(
			[[
		for (let {} = {}; {} < {}; {}++) {{
		  {}
		}}
	]],
			{
				i(1, "i"),
				i(2, "0"),
				rep(1),
				i(3, "length"),
				rep(1),
				i(4, "// body"),
			}
		)
	),

	-- For-of loop
	s(
		"forof",
		fmt(
			[[
		for (const {} of {}) {{
		  {}
		}}
	]],
			{
				i(1, "item"),
				i(2, "array"),
				i(3, "// body"),
			}
		)
	),

	-- For-in loop
	s(
		"forin",
		fmt(
			[[
		for (const {} in {}) {{
		  {}
		}}
	]],
			{
				i(1, "key"),
				i(2, "object"),
				i(3, "// body"),
			}
		)
	),

	-- forEach
	s(
		"foreach",
		fmt(
			[[
		{}.forEach(({}) => {{
		  {}
		}})
	]],
			{
				i(1, "array"),
				i(2, "item"),
				i(3, "// body"),
			}
		)
	),

	-- Map
	s(
		"map",
		fmt(
			[[
		{}.map(({}) => {})
	]],
			{
				i(1, "array"),
				i(2, "item"),
				i(3, "item"),
			}
		)
	),

	-- Filter
	s(
		"filter",
		fmt(
			[[
		{}.filter(({}) => {})
	]],
			{
				i(1, "array"),
				i(2, "item"),
				i(3, "condition"),
			}
		)
	),

	-- Reduce
	s(
		"reduce",
		fmt(
			[[
		{}.reduce(({}، {}) => {{
		  {}
		}}, {})
	]],
			{
				i(1, "array"),
				i(2, "acc"),
				i(3, "item"),
				i(4, "return acc"),
				i(5, "initialValue"),
			}
		)
	),

	-- Object destructuring
	s(
		"destobj",
		fmt(
			[[
		const {{ {} }} = {}
	]],
			{
				i(1, "props"),
				i(2, "object"),
			}
		)
	),

	-- Array destructuring
	s(
		"destarr",
		fmt(
			[[
		const [{}] = {}
	]],
			{
				i(1, "items"),
				i(2, "array"),
			}
		)
	),

	-- Template literal
	s(
		"tl",
		fmt(
			[[
		`{}`
	]],
			{
				i(1, "text ${expression}"),
			}
		)
	),

	-- JSDoc comment
	s(
		"jsdoc",
		fmt(
			[[
		/**
		 * {}
		 * @param {{{}}} {} - {}
		 * @returns {{{}}} {}
		 */
	]],
			{
				i(1, "Function description"),
				i(2, "type"),
				i(3, "paramName"),
				i(4, "param description"),
				i(5, "returnType"),
				i(6, "return description"),
			}
		)
	),

	-- Describe block (testing)
	s(
		"describe",
		fmt(
			[[
		describe("{}", () => {{
		  {}
		}})
	]],
			{
				i(1, "test suite"),
				i(2, "// tests"),
			}
		)
	),

	-- Test case
	s(
		"test",
		fmt(
			[[
		test("{}", () => {{
		  {}
		}})
	]],
			{
				i(1, "test description"),
				i(2, "// test body"),
			}
		)
	),

	-- It block (testing)
	s(
		"it",
		fmt(
			[[
		it("{}", () => {{
		  {}
		}})
	]],
			{
				i(1, "should do something"),
				i(2, "// test body"),
			}
		)
	),
}
