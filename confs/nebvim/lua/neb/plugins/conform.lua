return {
	"conform",
	event = "BufWritePre",
	after = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				-- Web Development
				css = {
					"prettierd", -- Fast Prettier daemon for CSS
				},
				html = {
					"htmlbeautifier", -- Ruby-based HTML formatter
					-- "prettier", -- Alternative: Prettier for HTML
				},
				http = {
					"kulala-fmt", -- Formatter for .http/.rest API files
				},
				javascript = {
					"prettierd", -- Fast Prettier daemon for JavaScript
					-- "prettier", -- Alternative: Standard Prettier
					-- "biome", -- Alternative: Fast all-in-one toolchain
				},
				json = {
					"fixjson", -- Fixes and formats relaxed JSON5
					-- "jq", -- Alternative: Command-line JSON processor
					-- "prettier", -- Alternative: Prettier for JSON
				},
				scss = {
					"prettierd", -- Fast Prettier daemon for SCSS
					-- "prettier", -- Alternative: Standard Prettier
				},
				typescript = {
					"prettierd", -- Fast Prettier daemon for TypeScript
					-- "prettier", -- Alternative: Standard Prettier
					-- "biome", -- Alternative: Fast all-in-one toolchain
				},

				-- Programming Languages
				lua = {
					"stylua", -- Opinionated Lua formatter
					-- "lua-format", -- Alternative: Configurable Lua formatter
				},
				python = {
					"black", -- Uncompromising Python formatter
					-- "isort", "black", -- Alternative: import sorting + formatting
					-- "ruff_format", -- Alternative: faster Rust-based formatter
					-- "blue", -- Alternative: slightly less uncompromising formatter
					-- "yapf", -- Alternative: Google's Python formatter
					-- "autopep8", -- Alternative: PEP 8 conformant formatter
				},
				rust = {
					"rustfmt", -- Official Rust formatter
				},
				go = {
					-- "goimports", "gofmt", -- Go import management + formatting
					-- "gofumpt", -- Alternative: stricter gofmt
					-- "goimports-reviser", -- Alternative: advanced import sorting
				},
				c = {
					-- "clang-format", -- C/C++ formatter
					-- "uncrustify", -- Alternative: highly configurable formatter
					-- "astyle", -- Alternative: artistic style formatter
				},
				cpp = {
					-- "clang-format", -- C/C++ formatter
					-- "uncrustify", -- Alternative: highly configurable formatter
					-- "astyle", -- Alternative: artistic style formatter
				},
				java = {
					-- "google-java-format", -- Google's Java formatter
					-- "astyle", -- Alternative: artistic style formatter
				},
				kotlin = {
					-- "ktfmt", -- Kotlin formatter from Facebook
					-- "ktlint", -- Alternative: anti-bikeshedding Kotlin linter/formatter
				},
				swift = {
					-- "swift-format", -- Official Swift formatter (requires Swift 6.0+)
					-- "swift_format", -- Alternative: for Swift < 6.0
					-- "swiftformat", -- Alternative: Nicklockwood's formatter
					-- "swiftlint", -- Alternative: style checker and linter
				},
				ruby = {
					-- "rubocop", -- Ruby linter and formatter based on style guide
					-- "standardrb", -- Alternative: bikeshed-proof linter/formatter
					-- "rufo", -- Alternative: opinionated Ruby formatter
					-- "syntax_tree", -- Alternative: based on CRuby parser
				},
				elixir = {
					-- "mix", -- Elixir's mix format command
				},
				erlang = {
					-- "erlfmt", -- WhatsApp's Erlang formatter
					-- "efmt", -- Alternative: Erlang code formatter
				},
				haskell = {
					-- "fourmolu", -- Haskell formatter (4-space indent)
					-- "ormolu", -- Alternative: Haskell formatter
					-- "hindent", -- Alternative: Haskell pretty printer
					-- "stylish-haskell", -- Alternative: code prettifier
				},
				ocaml = {
					-- "ocamlformat", -- OCaml auto-formatter
					-- "ocp-indent", -- Alternative: automatic indentation
				},
				zig = {
					-- "zigfmt", -- Official Zig formatter
				},
				nim = {
					-- "nimpretty", -- Nim source beautifier
					-- "nph", -- Alternative: opinionated Nim formatter
				},
				crystal = {
					-- "crystal", -- Crystal language formatter
				},
				gleam = {
					-- "gleam", -- Gleam language formatter
				},
				roc = {
					-- "roc", -- Roc language formatter
				},

				-- Shell & System
				sh = {
					"shfmt", -- Shell script formatter with bash support
					-- "beautysh", -- Alternative: bash beautifier
					-- "shellharden", -- Alternative: corrective bash syntax highlighter
				},
				bash = {
					-- "shfmt", -- Shell script formatter
					-- "beautysh", -- Alternative: bash beautifier
				},
				zsh = {
					-- "shfmt", -- Works with zsh too
				},
				fish = {
					-- "fish_indent", -- Fish shell formatter
				},

				-- Markup & Documentation
				markdown = {
					"markdownlint", -- Markdown linter/formatter
					-- "mdformat", -- Alternative: opinionated MD formatter
					-- "prettier", -- Alternative: Prettier for markdown
					-- "markdownlint-cli2", -- Alternative: fast, flexible linter
					-- "dprint", -- Alternative: pluggable formatter
				},
				rst = {
					-- "rstfmt", -- reStructuredText formatter
					-- "docstrfmt", -- Alternative: reStructuredText docstring formatter
				},
				tex = {
					"tex-fmt", -- Fast LaTeX formatter (Rust)
					-- "latexindent", -- Alternative: perl-based LaTeX formatter
					-- "llf", -- Alternative: LaTeX reformatter
				},
				latex = {
					-- "latexindent", -- LaTeX formatter (in major TeX distributions)
					-- "tex-fmt", -- Alternative: fast Rust-based formatter
				},
				xml = {
					"xmlformat", -- XML formatter
					-- "xmllint", -- Alternative: xmllint formatter
					-- "xmlstarlet", -- Alternative: command-line XML toolkit
				},

				-- Config & Data Files
				nix = {
					"nixfmt", -- Official Nix formatter
					-- "alejandra", -- Alternative: uncompromising Nix formatter
					-- "nixpkgs_fmt", -- Alternative: nixpkgs code formatter
				},
				yaml = {
					"yamlfmt", -- Google's YAML formatter
					-- "yamlfix", -- Alternative: configurable YAML formatter
					-- "prettier", -- Alternative: Prettier for YAML
				},
				toml = {
					-- "taplo", -- TOML toolkit and formatter
					-- "tombi", -- Alternative: TOML formatter/linter
					-- "pyproject-fmt", -- Alternative: for pyproject.toml files
				},
				ini = {
					-- "prettier", -- INI files via Prettier
				},

				-- JavaScript Ecosystem
				vue = {
					-- "prettier", -- Vue.js formatter
					-- "prettierd", -- Alternative: fast Prettier daemon
				},
				svelte = {
					-- "prettier", -- Svelte formatter
					-- "prettierd", -- Alternative: fast Prettier daemon
				},
				astro = {
					-- "prettier", -- Astro formatter
					-- "prettierd", -- Alternative: fast Prettier daemon
				},
				jsx = {
					-- "prettier", -- JSX formatter
					-- "prettierd", -- Alternative: fast Prettier daemon
				},
				tsx = {
					-- "prettier", -- TSX formatter
					-- "prettierd", -- Alternative: fast Prettier daemon
				},

				-- DevOps & Infrastructure
				terraform = {
					-- "terraform_fmt", -- Terraform HCL formatter
				},
				hcl = {
					-- "terraform_fmt", -- HCL formatter via Terraform
					-- "hcl", -- Alternative: standalone HCL formatter
				},
				dockerfile = {
					-- "dockerfmt", -- Dockerfile formatter
				},
				ansible = {
					-- "ansible-lint", -- Ansible playbook formatter with --fix
				},
				nomad = {
					-- "nomad_fmt", -- Nomad job spec formatter
				},
				packer = {
					-- "packer_fmt", -- Packer HCL formatter
				},

				-- Cloud & IaC
				bicep = {
					-- "bicep", -- Azure Bicep formatter
				},
				pkl = {
					-- "pkl", -- Apple's PKL configuration language
				},
				cue = {
					-- "cue_fmt", -- CUE data validation language
				},
				kdl = {
					-- "kdlfmt", -- KDL document formatter
				},
				kcl = {
					-- "kcl", -- KCL formatter
				},

				-- Databases & Query Languages
				sql = {
					-- "sqlfluff", -- SQL linter and formatter
					-- "sqlfmt", -- Alternative: dbt-focused SQL formatter
					-- "pg_format", -- Alternative: PostgreSQL formatter
					-- "sql_formatter", -- Alternative: multi-dialect formatter
					-- "sleek", -- Alternative: CLI SQL formatter
					-- "sqruff", -- Alternative: Rust-based SQL linter/formatter
				},
				graphql = {
					-- "prettier", -- GraphQL via Prettier
					-- "prettierd", -- Alternative: fast Prettier daemon
				},

				-- Functional Languages
				clojure = {
					-- "cljfmt", -- Clojure formatter
					-- "zprint", -- Alternative: Clojure/EDN formatter
					-- "cljstyle", -- Alternative: Clojure code formatter
					-- "joker", -- Alternative: Small Clojure linter/formatter
				},
				scheme = {
					-- "prettier", -- Scheme via Prettier
				},
				racket = {
					-- "racketfmt", -- Racket formatter
				},
				fennel = {
					-- "fnlfmt", -- Fennel (Lisp on Lua) formatter
				},
				lisp = {
					-- "prettier", -- Common Lisp via Prettier
				},

				-- Web Assembly & Low Level
				wasm = {
					-- "prettier", -- WebAssembly text format
				},
				asm = {
					-- "asmfmt", -- Go assembler formatter
				},

				-- Specialized Languages
				proto = {
					-- "buf", -- Protocol Buffers formatter
				},
				protobuf = {
					-- "buf", -- Protocol Buffers formatter
				},
				d = {
					-- "dfmt", -- D language formatter
				},
				dart = {
					-- "dart_format", -- Dart formatter
					-- "dcm_format", -- Alternative: DCM formatter
				},
				solidity = {
					-- "forge_fmt", -- Solidity smart contracts (Foundry)
				},
				move = {
					-- "prettier", -- Move language (blockchain)
				},

				-- Template Languages
				jinja = {
					-- "djlint", -- Jinja template formatter
				},
				django = {
					-- "djlint", -- Django template formatter
				},
				erb = {
					-- "erb_format", -- ERB (Ruby) template formatter
					-- "htmlbeautifier", -- Alternative: HTML/ERB beautifier
				},
				blade = {
					-- "blade-formatter", -- Laravel Blade templates
				},
				handlebars = {
					-- "djlint", -- Handlebars templates
					-- "prettier", -- Alternative: Prettier for Handlebars
				},
				twig = {
					-- "twig-cs-fixer", -- Twig template formatter
				},
				templ = {
					-- "templ", -- Go templ template formatter
				},

				-- Documentation & Writing
				org = {
					-- "prettier", -- Org-mode files
				},
				asciidoc = {
					-- "prettier", -- AsciiDoc formatter
				},
				typst = {
					-- "typstyle", -- Typst document formatter
					-- "prettypst", -- Alternative: Typst formatter
				},
				bibtex = {
					-- "bibtex-tidy", -- BibTeX formatter
				},
				beancount = {
					-- "bean-format", -- Beancount file formatter
				},

				-- Mobile Development
				["objective-c"] = {
					-- "clang-format", -- Objective-C formatter
				},
				objc = {
					-- "clang-format", -- Objective-C formatter
				},
				qml = {
					-- "qmlformat", -- Qt QML formatter
				},

				-- Game Development
				gdscript = {
					-- "gdformat", -- Godot GDScript formatter
				},
				gherkin = {
					-- "ghokin", -- Gherkin (Cucumber) formatter
					-- "reformat-gherkin", -- Alternative: Gherkin formatter
				},

				-- Build Systems & Meta
				make = {
					-- "bake", -- Makefile formatter
				},
				cmake = {
					-- "cmake_format", -- CMake formatter
					-- "gersemi", -- Alternative: CMake formatter
				},
				bazel = {
					-- "buildifier", -- Bazel BUILD file formatter
				},
				meson = {
					-- "meson", -- Meson build formatter
				},
				just = {
					-- "just", -- Justfile formatter
				},
				dune = {
					-- "format-dune-file", -- OCaml Dune formatter
				},

				-- Niche/Emerging Languages
				grain = {
					-- "grain_format", -- Grain language formatter
				},
				rescript = {
					-- "rescript-format", -- ReScript formatter
				},
				imba = {
					-- "imba_fmt", -- Imba language formatter
				},
				v = {
					-- "v", -- V language formatter
				},
				odin = {
					-- "odinfmt", -- Odin language formatter
				},
				mojo = {
					-- "mojo_format", -- Modular Mojo formatter
				},
				inko = {
					-- "inko", -- Inko language formatter
				},
				caramel = {
					-- "caramel_fmt", -- Caramel (OCaml for Erlang VM) formatter
				},
				nickel = {
					-- "nickel", -- Nickel configuration language formatter
				},

				-- Lisps & Scheme dialects
				janet = {
					-- "janet-format", -- Janet language formatter
				},
				gluon = {
					-- "gluon_fmt", -- Gluon ML language formatter
				},

				-- Proprietary/Enterprise
				apex = {
					-- "prettier", -- Salesforce Apex
				},
				vhdl = {
					-- "vsg", -- VHDL style guide enforcement
					-- "ghdl", -- Alternative: VHDL analyzer/formatter
				},
				verilog = {
					-- "verible", -- SystemVerilog formatter
				},
				systemverilog = {
					-- "verible", -- SystemVerilog formatter
				},

				-- PHP & Related
				php = {
					-- "php_cs_fixer", -- PHP Coding Standards Fixer
					-- "pint", -- Alternative: Laravel Pint (opinionated)
					-- "phpcbf", -- Alternative: PHP Code Beautifier
					-- "pretty-php", -- Alternative: opinionated PHP formatter
					-- "mago_format", -- Alternative: Mago PHP toolchain
				},
				blade_php = {
					-- "blade-formatter", -- Laravel Blade templates
				},

				-- R & Statistics
				r = {
					-- "styler", -- R formatter and linter
					-- "air", -- Alternative: R formatter and language server
				},

				-- F# & .NET
				fsharp = {
					-- "fantomas", -- F# source code formatter
				},
				["f#"] = {
					-- "fantomas", -- F# source code formatter
				},
				csharp = {
					-- "csharpier", -- C# code formatter
				},
				["c#"] = {
					-- "csharpier", -- C# code formatter
				},

				-- Scala & JVM
				scala = {
					-- "scalafmt", -- Scala code formatter
				},
				groovy = {
					-- "npm-groovy-lint", -- Groovy/Jenkinsfile/Gradle formatter
				},

				-- Julia
				julia = {
					-- "runic", -- Julia code formatter
				},

				-- Rego (Open Policy Agent)
				rego = {
					-- "opa_fmt", -- OPA Rego formatter
				},

				-- Cedar (AWS)
				cedar = {
					-- "cedar", -- AWS Cedar policy formatter
				},

				-- CodeQL
				codeql = {
					-- "codeql", -- GitHub CodeQL query formatter
				},

				-- Config/Niche formats
				ron = {
					-- "prettier", -- Rusty Object Notation
				},

				-- Obscure/Academic
				prolog = {
					-- "prolog", -- SWI-Prolog formatter
				},
				sml = {
					-- "smlfmt", -- Standard ML formatter
				},
				fortran = {
					-- "fprettify", -- Modern Fortran formatter
					-- "findent", -- Alternative: Fortran indenter
				},
				awk = {
					-- "gawk", -- AWK program formatter
				},
				tcl = {
					-- "tclfmt", -- Tcl script formatter
				},
				lilypond = {
					-- "python-ly", -- LilyPond music notation
				},

				-- Puppet
				puppet = {
					-- "puppet-lint", -- Puppet manifest formatter
				},

				-- Ansible/YAML variants
				["yaml.ansible"] = {
					-- "ansible-lint", -- Ansible-specific YAML formatter
				},

				-- Android
				["android.bp"] = {
					-- "bpfmt", -- Android Blueprint file formatter
				},

				-- BrightScript
				brighterscript = {
					-- "bsfmt", -- BrighterScript formatter
				},
				brightscript = {
					-- "bsfmt", -- BrightScript formatter
				},

				-- Commit messages
				gitcommit = {
					-- "commitmsgfmt", -- Commit message formatter
				},

				-- D2 Diagrams
				d2 = {
					-- "d2", -- D2 diagram language formatter
				},

				-- Dioxus (Rust)
				rust_with_dioxus = {
					-- "dioxus", -- Formats rsx! macros in Rust
				},

				-- Leptos (Rust)
				rust_with_leptos = {
					-- "leptosfmt", -- Formats Leptos view! macro
				},

				-- Yew (Rust)
				rust_with_yew = {
					-- "yew-fmt", -- Formats Yew html! macro
				},

				-- Liquidsoap
				liquidsoap = {
					-- "liquidsoap-prettier", -- Liquidsoap script formatter
				},

				-- Snakemake
				snakemake = {
					-- "snakefmt", -- Snakemake file formatter
				},

				-- SuperHTML
				superhtml = {
					-- "superhtml", -- SuperHTML formatter
				},

				-- TypeSpec
				typespec = {
					-- "typespec", -- TypeSpec compiler/formatter
				},

				-- Uxntal
				uxntal = {
					-- "uxntal", -- Uxntal assembly formatter
				},

				-- Ziggy
				ziggy = {
					-- "ziggy", -- Ziggy data serialization formatter
					-- "ziggy_schema", -- Alternative: Ziggy schema formatter
				},

				-- Jsonnet
				jsonnet = {
					-- "jsonnetfmt", -- Jsonnet formatter
				},

				-- Dhall
				dhall = {
					-- "dhall", -- Dhall configuration language formatter
				},

				-- Hurl
				hurl = {
					-- "hurlfmt", -- Hurl HTTP file formatter
				},

				-- PureScript
				purescript = {
					-- "purs-tidy", -- PureScript syntax formatter
				},

				-- GNU formats
				indent = {
					-- "indent", -- GNU Indent
				},

				-- Tree-sitter queries
				query = {
					-- "format-queries", -- Tree-sitter query formatter
				},

				-- Mermaid
				mermaid = {
					-- "prettier", -- Mermaid diagram formatter
				},

				-- Utilities & Meta-formatters
				-- ["*"] = { "codespell" }, -- Spell checker for all files
				-- ["*"] = { "typos" }, -- Fast source code spell checker
				-- ["*"] = { "autocorrect" }, -- CJK copywriting formatter
				-- ["*"] = { "keep-sorted" }, -- Keep sorted blocks in files
				-- injected = { "injected" }, -- Format code blocks in markdown/etc

				-- Global fallback formatters (applied to all filetypes)
				["*"] = {
					"trim_whitespace", -- Remove trailing whitespace
					"trim_newlines", -- Remove extra blank lines at end of file
					-- "squeeze_blanks", -- Alternative: squeeze repeated blank lines
				},
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
