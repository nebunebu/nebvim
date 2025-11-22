--[[
  Markdown-specific snippets

  Usage:
    These snippets are only available in Markdown files (.md)

  Examples:
    - "link" → markdown link
    - "img" → markdown image
    - "code" → code block
    - "table" → markdown table
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
	-- Markdown link
	s("link", fmt([[
		[{}]({})
	]], {
		i(1, "text"),
		i(2, "url"),
	})),

	-- Markdown image
	s("img", fmt([[
		![{}]({})
	]], {
		i(1, "alt text"),
		i(2, "image-url"),
	})),

	-- Code block with language
	s("code", fmt([[
		```{}
		{}
		```
	]], {
		i(1, "language"),
		i(2, "code"),
	})),

	-- Inline code
	s("`", fmt([[
		`{}`
	]], {
		i(1, "code"),
	})),

	-- Bold text
	s("bold", fmt([[
		**{}**
	]], {
		i(1, "text"),
	})),

	-- Italic text
	s("italic", fmt([[
		*{}*
	]], {
		i(1, "text"),
	})),

	-- Heading (adaptive)
	s("h", {
		c(1, {
			t("# "),
			t("## "),
			t("### "),
			t("#### "),
			t("##### "),
			t("###### "),
		}),
		i(2, "heading"),
	}),

	-- Markdown table
	s("table", fmt([[
		| {} | {} |
		| --- | --- |
		| {} | {} |
	]], {
		i(1, "Header 1"),
		i(2, "Header 2"),
		i(3, "Cell 1"),
		i(4, "Cell 2"),
	})),

	-- Task list item
	s("task", fmt([[
		- [{}] {}
	]], {
		c(1, {
			t(" "),
			t("x"),
		}),
		i(2, "task"),
	})),

	-- Horizontal rule
	s("hr", {
		t("---"),
	}),

	-- Blockquote
	s("quote", fmt([[
		> {}
	]], {
		i(1, "quote"),
	})),

	-- Footnote
	s("fn", fmt([[
		[^{}]: {}
	]], {
		i(1, "1"),
		i(2, "footnote text"),
	})),

	-- Front matter (YAML)
	s("frontmatter", fmt([[
		---
		title: "{}"
		date: {}
		tags: [{}]
		---

		{}
	]], {
		i(1, "Title"),
		f(function()
			return os.date("%Y-%m-%d")
		end),
		i(2, "tag1, tag2"),
		i(3, "content"),
	})),

	-- Details/Summary (collapsible section)
	s("details", fmt([[
		<details>
		<summary>{}</summary>

		{}

		</details>
	]], {
		i(1, "Summary"),
		i(2, "Content"),
	})),

	-- Mermaid diagram
	s("mermaid", fmt([[
		```mermaid
		{}
		{}
		```
	]], {
		c(1, {
			t("graph TD"),
			t("sequenceDiagram"),
			t("classDiagram"),
			t("stateDiagram-v2"),
			t("erDiagram"),
			t("pie"),
		}),
		i(2, "    A --> B"),
	})),

	-- Math block (LaTeX)
	s("math", fmt([[
		$$
		{}
		$$
	]], {
		i(1, "equation"),
	})),

	-- Inline math
	s("$", fmt([[
		${}$
	]], {
		i(1, "math"),
	})),

	-- Admonition (GitHub/GitLab style)
	s("note", {
		c(1, {
			t("> [!NOTE]"),
			t("> [!TIP]"),
			t("> [!IMPORTANT]"),
			t("> [!WARNING]"),
			t("> [!CAUTION]"),
		}),
		t({ "", "> " }),
		i(2, "message"),
	}),

	-- Reference-style link
	s("reflink", fmt([[
		[{}][{}]

		[{}]: {}
	]], {
		i(1, "text"),
		i(2, "ref"),
		rep(2),
		i(3, "url"),
	})),
}
