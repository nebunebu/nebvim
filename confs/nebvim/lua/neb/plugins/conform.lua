return {
	"conform",
	event = "BufWritePre",
	after = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				-- Web Development
				css = { "prettierd" }, -- Fast Prettier daemon for CSS
				html = { "htmlbeautifier" }, -- Ruby-based HTML formatter
				http = { "kulala-fmt" }, -- Formatter for .http/.rest API files
				javascript = { "prettierd" }, -- Fast Prettier daemon for JavaScript
				json = { "fixjson" }, -- Fixes and formats relaxed JSON5
				scss = { "prettierd" }, -- Fast Prettier daemon for SCSS
				typescript = { "prettierd" }, -- Fast Prettier daemon for TypeScript

				-- Programming Languages
				lua = { "stylua" }, -- Opinionated Lua formatter
				python = { "black" }, -- Uncompromising Python formatter
				-- python = { "isort", "black" }, -- Alternative: import sorting + formatting
				-- python = { "ruff_format" }, -- Alternative: faster Rust-based formatter
				rust = { "rustfmt" }, -- Official Rust formatter
				-- go = { "goimports", "gofmt" }, -- Go import management + formatting
				-- c = { "clang-format" }, -- C/C++ formatter
				-- cpp = { "clang-format" }, -- C/C++ formatter
				-- java = { "google-java-format" }, -- Google's Java formatter
				-- kotlin = { "ktfmt" }, -- Kotlin formatter from Facebook
				-- swift = { "swift-format" }, -- Official Swift formatter
				-- ruby = { "rubocop" }, -- Ruby linter and formatter
				-- elixir = { "mix" }, -- Elixir's mix format
				-- erlang = { "erlfmt" }, -- WhatsApp's Erlang formatter
				-- haskell = { "fourmolu" }, -- Haskell formatter (4-space indent)
				-- ocaml = { "ocamlformat" }, -- OCaml formatter
				-- zig = { "zigfmt" }, -- Official Zig formatter
				-- nim = { "nimpretty" }, -- Nim source beautifier
				-- crystal = { "crystal" }, -- Crystal language formatter
				-- gleam = { "gleam" }, -- Gleam language formatter
				-- roc = { "roc" }, -- Roc language formatter

				-- Shell & System
				sh = { "shfmt" }, -- Shell script formatter with bash support
				-- bash = { "beautysh" }, -- Alternative bash beautifier
				-- zsh = { "shfmt" }, -- Works with zsh too
				-- fish = { "fish_indent" }, -- Fish shell formatter

				-- Markup & Documentation
				markdown = { "markdownlint" }, -- Markdown linter/formatter
				-- markdown = { "mdformat" }, -- Alternative: opinionated MD formatter
				-- markdown = { "prettier" }, -- Alternative: Prettier for markdown
				-- rst = { "rstfmt" }, -- reStructuredText formatter
				tex = { "tex-fmt" }, -- Fast LaTeX formatter (Rust)
				-- latex = { "latexindent" }, -- Alternative LaTeX formatter
				xml = { "xmlformat" }, -- XML formatter
				-- xml = { "xmllint" }, -- Alternative: xmllint formatter

				-- Config & Data Files
				nix = { "nixfmt" }, -- Official Nix formatter
				-- nix = { "alejandra" }, -- Alternative: opinionated Nix formatter
				yaml = { "yamlfmt" }, -- Google's YAML formatter
				-- yaml = { "yamlfix" }, -- Alternative: configurable YAML formatter
				-- toml = { "taplo" }, -- TOML formatter
				-- ini = { "prettier" }, -- INI files via Prettier

				-- JavaScript Ecosystem
				-- vue = { "prettier" }, -- Vue.js formatter
				-- svelte = { "prettier" }, -- Svelte formatter
				-- astro = { "prettier" }, -- Astro formatter
				-- jsx = { "prettier" }, -- JSX formatter
				-- tsx = { "prettier" }, -- TSX formatter

				-- DevOps & Infrastructure
				-- terraform = { "terraform_fmt" }, -- Terraform HCL formatter
				-- tofu = { "tofu_fmt" }, -- OpenTofu formatter
				-- dockerfile = { "dockerfmt" }, -- Dockerfile formatter
				-- docker-compose = { "prettier" }, -- Docker Compose YAML
				-- ansible = { "ansible-lint" }, -- Ansible playbook formatter
				-- nomad = { "nomad_fmt" }, -- Nomad job spec formatter

				-- Cloud & IaC
				-- bicep = { "bicep" }, -- Azure Bicep formatter
				-- pkl = { "pkl" }, -- Apple's PKL configuration language
				-- cue = { "cue_fmt" }, -- CUE data validation language

				-- Databases & Query Languages
				-- sql = { "sqlfluff" }, -- SQL linter and formatter
				-- sql = { "sqlfmt" }, -- Alternative: dbt-focused SQL formatter
				-- sql = { "pg_format" }, -- Alternative: PostgreSQL formatter
				-- graphql = { "prettier" }, -- GraphQL via Prettier

				-- Functional Languages
				-- clojure = { "cljfmt" }, -- Clojure formatter
				-- clojure = { "zprint" }, -- Alternative: Clojure/EDN formatter
				-- scheme = { "prettier" }, -- Scheme via Prettier
				-- racket = { "racketfmt" }, -- Racket formatter
				-- fennel = { "fnlfmt" }, -- Fennel (Lisp on Lua) formatter

				-- Web Assembly & Low Level
				-- wasm = { "prettier" }, -- WebAssembly text format
				-- asm = { "asmfmt" }, -- Go assembler formatter

				-- Specialized Languages
				-- proto = { "buf" }, -- Protocol Buffers formatter
				-- d = { "dfmt" }, -- D language formatter
				-- dart = { "dart_format" }, -- Dart formatter
				-- solidity = { "forge_fmt" }, -- Solidity smart contracts (Foundry)
				-- cairo = { "cairo" }, -- StarkNet Cairo formatter
				-- move = { "prettier" }, -- Move language (blockchain)

				-- Template Languages
				-- jinja = { "djlint" }, -- Jinja template formatter
				-- django = { "djlint" }, -- Django template formatter
				-- erb = { "erb_format" }, -- ERB (Ruby) template formatter
				-- blade = { "blade-formatter" }, -- Laravel Blade templates
				-- handlebars = { "djlint" }, -- Handlebars templates
				-- twig = { "twig-cs-fixer" }, -- Twig template formatter
				-- templ = { "templ" }, -- Go templ template formatter

				-- Documentation & Writing
				-- org = { "prettier" }, -- Org-mode files
				-- asciidoc = { "prettier" }, -- AsciiDoc formatter
				-- typst = { "typstyle" }, -- Typst document formatter
				-- bibtex = { "bibtex-tidy" }, -- BibTeX formatter

				-- Mobile Development
				-- swift = { "swiftformat" }, -- Alternative Swift formatter (Nicklockwood)
				-- objective-c = { "clang-format" }, -- Objective-C formatter
				-- qml = { "qmlformat" }, -- Qt QML formatter

				-- Game Development
				-- gdscript = { "gdformat" }, -- Godot GDScript formatter
				-- gherkin = { "ghokin" }, -- Gherkin (Cucumber) formatter

				-- Build Systems & Meta
				-- make = { "bake" }, -- Makefile formatter
				-- cmake = { "cmake_format" }, -- CMake formatter
				-- bazel = { "buildifier" }, -- Bazel BUILD file formatter
				-- meson = { "meson" }, -- Meson build formatter
				-- just = { "just" }, -- Justfile formatter
				-- dune = { "format-dune-file" }, -- OCaml Dune formatter

				-- Niche/Emerging Languages
				-- grain = { "grain_format" }, -- Grain language formatter
				-- rescript = { "rescript-format" }, -- ReScript formatter
				-- imba = { "imba_fmt" }, -- Imba language formatter
				-- v = { "v" }, -- V language formatter
				-- odin = { "odinfmt" }, -- Odin language formatter
				-- zig = { "zigfmt" }, -- Zig formatter
				-- carbon = { "carbon" }, -- Google Carbon (experimental)
				-- mojo = { "mojo_format" }, -- Modular Mojo formatter
				-- inko = { "inko" }, -- Inko language formatter

				-- Lisps & Scheme dialects
				-- janet = { "janet-format" }, -- Janet language formatter
				-- gluon = { "gluon_fmt" }, -- Gluon ML language formatter

				-- Proprietary/Enterprise
				-- apex = { "prettier" }, -- Salesforce Apex
				-- vhdl = { "vsg" }, -- VHDL style guide enforcement
				-- verilog = { "verible" }, -- SystemVerilog formatter

				-- Config/Niche formats
				-- kdl = { "kdlfmt" }, -- KDL document formatter
				-- ron = { "prettier" }, -- Rusty Object Notation
				-- codeql = { "codeql" }, -- GitHub CodeQL queries
				-- cedar = { "cedar" }, -- AWS Cedar policies

				-- Obscure/Academic
				-- prolog = { "prolog" }, -- SWI-Prolog formatter
				-- sml = { "smlfmt" }, -- Standard ML formatter
				-- fortran = { "fprettify" }, -- Modern Fortran formatter
				-- awk = { "gawk" }, -- AWK program formatter
				-- tcl = { "tclfmt" }, -- Tcl script formatter
				-- lilypond = { "python-ly" }, -- LilyPond music notation

				-- Utilities & Meta-formatters
				-- ["*"] = { "codespell" }, -- Spell checker for all files
				-- ["*"] = { "typos" }, -- Fast source code spell checker
				-- ["*"] = { "autocorrect" }, -- CJK copywriting formatter
				-- injected = { "injected" }, -- Format code blocks in markdown/etc

				-- Global fallback formatters (applied to all filetypes)
				["*"] = { "trim_whitespace", "trim_newlines" }, -- Remove trailing whitespace and extra blank lines
				-- ["_"] = { "trim_whitespace" }, -- Alternative: only for filetypes without specific formatters
			},
		})

		vim.api.nvim_create_autocmd("BufWritePre", {
			pattern = "*",
			callback = function(args)
				local ft = vim.bo[args.buf].filetype
				if ft == "markdown" then
					-- Force ONLY markdownlint for Markdown; no global trimmers
					conform.format({
						bufnr = args.buf,
						formatters = { "markdownlint" },
						lsp_format = "fallback",
					})
				else
					conform.format({
						bufnr = args.buf,
						lsp_format = "fallback",
						-- Stop after first available formatter for these filetypes
						-- Useful when you have multiple formatters and want deterministic behavior
						stop_after_first = (ft == "nix"),
					})
				end
			end,
		})
	end,
}
-- return {
-- 	"conform",
-- 	event = "BufWritePre",
-- 	after = function()
-- 		local conform = require("conform")
--
-- 		conform.setup({
-- 			formatters_by_ft = {
-- 				css = { "prettierd" },
-- 				html = { "htmlbeautifier" },
-- 				http = { "kulala-fmt" },
-- 				javascript = { "prettierd" },
-- 				json = { "fixjson" },
-- 				lua = { "stylua" },
-- 				markdown = { "markdownlint" }, -- explicit list for md
-- 				nix = { "nixfmt" }, -- list of strings only
-- 				python = { "black" },
-- 				rust = { "rustfmt" },
-- 				scss = { "prettierd" },
-- 				sh = { "shfmt" },
-- 				tex = { "tex-fmt" },
-- 				typescript = { "prettierd" },
-- 				xml = { "xmlformat" },
-- 				yaml = { "yamlfmt" },
-- 				["*"] = { "trim_whitespace", "trim_newlines" }, -- global defaults
-- 			},
-- 		})
--
-- 		vim.api.nvim_create_autocmd("BufWritePre", {
-- 			pattern = "*",
-- 			callback = function(args)
-- 				local ft = vim.bo[args.buf].filetype
-- 				if ft == "markdown" then
-- 					-- Force ONLY markdownlint for Markdown; no global trimmers
-- 					conform.format({
-- 						bufnr = args.buf,
-- 						formatters = { "markdownlint" },
-- 						lsp_format = "fallback",
-- 					})
-- 				else
-- 					conform.format({
-- 						bufnr = args.buf,
-- 						lsp_format = "fallback",
-- 						-- If you want Nix to stop after nixfmt:
-- 						stop_after_first = (ft == "nix"),
-- 					})
-- 				end
-- 			end,
-- 		})
-- 	end,
-- }
