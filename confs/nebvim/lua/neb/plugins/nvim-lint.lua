return {
	"nvim-lint",
	event = "BufWritePost",
	after = function()
		require("lint").linters_by_ft = {
			-- JavaScript & TypeScript
			javascript = {
				"eslint", -- JavaScript/TypeScript linter
				-- "eslint_d", -- Alternative: faster eslint daemon
				-- "biomejs", -- Alternative: fast all-in-one linter
				-- "deno", -- Alternative: Deno's built-in linter
				-- "oxlint", -- Alternative: fast JavaScript linter (Rust)
				-- "quick-lint-js", -- Alternative: extremely fast JS linter
				-- "jshint", -- Alternative: JavaScript linter
				-- "standardjs", -- Alternative: JavaScript standard style
			},
			typescript = {
				"eslint", -- JavaScript/TypeScript linter
				-- "eslint_d", -- Alternative: faster eslint daemon
				-- "biomejs", -- Alternative: fast all-in-one linter
				-- "deno", -- Alternative: Deno's built-in linter
				-- "oxlint", -- Alternative: fast JavaScript linter (Rust)
				-- "ts-standard", -- Alternative: TypeScript standard style
			},

			-- Python
			python = {
				"pylint", -- Python linter
				-- "flake8", -- Alternative: Python linter
				-- "pflake8", -- Alternative: Flake8 with pyproject.toml support
				-- "ruff", -- Alternative: extremely fast Python linter (Rust)
				-- "mypy", -- Alternative: Python type checker
				-- "dmypy", -- Alternative: Mypy daemon for faster checking
				-- "bandit", -- Alternative: Python security linter
				-- "pycodestyle", -- Alternative: Python style checker (PEP 8)
				-- "pydocstyle", -- Alternative: Python docstring checker
				-- "vulture", -- Alternative: dead code finder
			},

			-- Nix
			nix = {
				"deadnix", -- Nix dead code scanner
				"statix", -- Nix linter
				-- "nix", -- Alternative: Nix expression checker
			},

			-- Shell Scripts
			bash = {
				"shellcheck", -- Shell script linter
				-- "dash", -- Alternative: POSIX shell checker
			},
			sh = {
				"shellcheck", -- Shell script linter
				-- "dash", -- Alternative: POSIX shell checker
			},
			zsh = {
				"zsh", -- Zsh syntax checker
				-- "shellcheck", -- Alternative: works with zsh too
			},
			fish = {
				-- "fish", -- Fish shell syntax checker
			},
			ksh = {
				-- "ksh", -- Korn shell checker
			},

			-- CSS & Styling
			css = {
				"stylelint", -- CSS/SCSS linter
			},
			scss = {
				"stylelint", -- CSS/SCSS linter
			},
			sass = {
				-- "stylelint", -- SASS linter
			},
			less = {
				-- "stylelint", -- LESS linter
			},

			-- Markup & Documentation
			markdown = {
				"markdownlint-cli2", -- Markdown linter (fast, flexible)
				-- "markdownlint", -- Alternative: original markdownlint
				-- "mado", -- Alternative: Markdown linter
				-- "alex", -- Alternative: catch insensitive writing
				-- "vale", -- Alternative: prose linter
				-- "write_good", -- Alternative: English prose linter
				-- "proselint", -- Alternative: prose linter
			},
			rst = {
				-- "rstcheck", -- reStructuredText checker
				-- "rstlint", -- Alternative: reStructuredText linter
				-- "sphinx-lint", -- Alternative: Sphinx documentation linter
			},
			tex = {
				"chktex", -- LaTeX semantic checker
				-- "lacheck", -- Alternative: LaTeX checker
			},
			latex = {
				-- "chktex", -- LaTeX semantic checker
				-- "lacheck", -- Alternative: LaTeX checker
			},
			html = {
				-- "htmlhint", -- HTML linter
				-- "tidy", -- Alternative: HTML validator
				-- "curlylint", -- Alternative: HTML template linter
				-- "djlint", -- Alternative: Django/Jinja template linter
				-- "markuplint", -- Alternative: HTML/template linter
			},

			-- Lua
			lua = {
				"luacheck", -- Lua linter
				-- "selene", -- Alternative: modern Lua linter
				-- "luac", -- Alternative: Lua compiler checker
			},

			-- Rust
			rust = {
				-- "clippy", -- Rust linter (via rustc)
			},

			-- Go
			go = {
				-- "golangcilint", -- Go meta-linter (runs multiple linters)
				-- "revive", -- Alternative: fast Go linter
				-- "fieldalignment", -- Alternative: struct field alignment checker
			},

			-- C/C++
			c = {
				-- "clangtidy", -- C/C++ linter based on clang
				-- "cppcheck", -- Alternative: C/C++ static analyzer
				-- "flawfinder", -- Alternative: C/C++ security scanner
			},
			cpp = {
				-- "clangtidy", -- C/C++ linter based on clang
				-- "cppcheck", -- Alternative: C/C++ static analyzer
				-- "cpplint", -- Alternative: C++ style checker
				-- "clazy", -- Alternative: Qt-specific C++ linter
				-- "flawfinder", -- Alternative: C/C++ security scanner
			},

			-- Java & JVM
			java = {
				-- "checkstyle", -- Java code style checker
				-- "pmd", -- Alternative: multi-language static analyzer
			},
			kotlin = {
				-- "ktlint", -- Kotlin linter and formatter
			},
			groovy = {
				-- "npm-groovy-lint", -- Groovy/Jenkinsfile/Gradle linter
			},
			scala = {
				-- "scalafmt", -- Scala formatter (has linting features)
			},

			-- Ruby
			ruby = {
				-- "rubocop", -- Ruby linter and formatter
				-- "ruby", -- Alternative: Ruby syntax checker
				-- "standardrb", -- Alternative: Ruby standard style
			},

			-- Elixir & Erlang
			elixir = {
				-- "credo", -- Elixir code analysis tool
			},

			-- Haskell & ML Languages
			haskell = {
				-- "hlint", -- Haskell linter
			},
			ocaml = {
				-- "ocamlformat", -- OCaml formatter (has linting)
			},

			-- F#
			fsharp = {
				-- "fsharplint", -- F# linter
			},
			["f#"] = {
				-- "fsharplint", -- F# linter
			},

			-- Swift & Objective-C
			swift = {
				-- "swiftlint", -- Swift linter
			},
			["objective-c"] = {
				-- "clangtidy", -- Objective-C via clang-tidy
			},
			objc = {
				-- "clangtidy", -- Objective-C via clang-tidy
			},

			-- Crystal
			crystal = {
				-- "ameba", -- Crystal linter
			},

			-- Zig
			zig = {
				-- "zlint", -- Zig linter
			},

			-- Nim
			nim = {
				-- "nim", -- Nim compiler linter
			},

			-- Gleam
			gleam = {
				-- "gleam", -- Gleam compiler linter
			},

			-- Inko
			inko = {
				-- "inko", -- Inko compiler linter
			},

			-- Pony
			pony = {
				-- "pony", -- Pony compiler linter
			},

			-- Vala
			vala = {
				-- "vala_lint", -- Vala linter
			},

			-- Config & Data Files
			json = {
				-- "jsonlint", -- JSON linter
				-- "json_tool", -- Alternative: Python JSON validator
			},
			json5 = {
				-- "json5", -- JSON5 validator
			},
			yaml = {
				-- "yamllint", -- YAML linter
				-- "actionlint", -- Alternative: GitHub Actions workflow linter
				-- "ansible_lint", -- Alternative: Ansible playbook linter
				-- "cfn_lint", -- Alternative: AWS CloudFormation linter
				-- "cfn_nag", -- Alternative: CloudFormation security scanner
				-- "dclint", -- Alternative: Docker Compose linter
				-- "spectral", -- Alternative: OpenAPI/AsyncAPI linter
				-- "redocly", -- Alternative: OpenAPI linter
				-- "snyk_iac", -- Alternative: Infrastructure as Code security scanner
				-- "yq", -- Alternative: YAML/JSON/XML processor
				-- "zizmor", -- Alternative: GitHub Actions security scanner
			},
			toml = {
				-- "tombi", -- TOML linter
			},
			xml = {
				-- "xmllint", -- XML validator
			},
			cue = {
				-- "cue", -- CUE validation tool
			},
			dhall = {
				-- "dhall", -- Dhall configuration language checker
			},

			-- Protocol Buffers
			proto = {
				-- "buf_lint", -- Protocol Buffers linter (buf)
				-- "protolint", -- Alternative: Protocol Buffers linter
			},
			protobuf = {
				-- "buf_lint", -- Protocol Buffers linter (buf)
				-- "protolint", -- Alternative: Protocol Buffers linter
			},

			-- SQL & Databases
			sql = {
				-- "sqlfluff", -- SQL linter and formatter
				-- "sqruff", -- Alternative: SQL linter (Rust version)
				-- "eugene", -- Alternative: PostgreSQL migration linter
			},
			prisma = {
				-- "prisma-lint", -- Prisma schema linter
			},

			-- GraphQL
			graphql = {
				-- "graphql", -- GraphQL schema linter
			},

			-- Docker & Containers
			dockerfile = {
				-- "hadolint", -- Dockerfile linter
				-- "trivy", -- Alternative: security scanner
			},

			-- Infrastructure as Code
			terraform = {
				-- "tflint", -- Terraform linter
				-- "tfsec", -- Alternative: Terraform security scanner
			},
			tf = {
				-- "tflint", -- Terraform linter
				-- "tofu", -- Alternative: OpenTofu linter
			},
			bicep = {
				-- "bicep", -- Azure Bicep linter
			},
			cloudformation = {
				-- "cfn_lint", -- AWS CloudFormation linter
			},

			-- Ansible
			["yaml.ansible"] = {
				-- "ansible_lint", -- Ansible playbook linter
			},

			-- Kubernetes
			["yaml.kubernetes"] = {
				-- "kubeval", -- Kubernetes manifest validator
			},

			-- Open Policy Agent
			rego = {
				-- "opa_check", -- OPA Rego checker
				-- "regal", -- Alternative: Rego linter
			},

			-- Build Systems
			make = {
				-- "checkmake", -- Makefile linter
			},
			cmake = {
				-- "cmakelint", -- CMake linter
				-- "cmake_lint", -- Alternative: CMake linter
			},
			bazel = {
				-- "buildifier", -- Bazel BUILD file linter
			},
			bzl = {
				-- "buildifier", -- Bazel BUILD/Starlark linter
			},

			-- Hardware Description Languages
			vhdl = {
				-- "ghdl", -- VHDL compiler/linter
				-- "vsg", -- Alternative: VHDL Style Guide checker
			},
			verilog = {
				-- "verilator", -- Verilog/SystemVerilog linter
			},
			systemverilog = {
				-- "verilator", -- SystemVerilog linter
				-- "slang", -- Alternative: SystemVerilog linter
				-- "svlint", -- Alternative: SystemVerilog linter
			},

			-- Shader Languages
			glsl = {
				-- "glslc", -- GLSL shader compiler
			},
			hlsl = {
				-- "dxc", -- DirectX Shader Compiler
			},

			-- PHP
			php = {
				-- "phpcs", -- PHP CodeSniffer
				-- "phpstan", -- Alternative: PHP static analyzer
				-- "psalm", -- Alternative: PHP static analyzer
				-- "phpmd", -- Alternative: PHP Mess Detector
				-- "php", -- Alternative: PHP syntax checker
				-- "phpinsights", -- Alternative: PHP quality checker
				-- "mago_lint", -- Alternative: Mago PHP linter
				-- "mago_analyze", -- Alternative: Mago PHP analyzer
			},

			-- Laravel Blade
			blade = {
				-- "tlint", -- Laravel Blade linter
			},

			-- Template Languages
			jinja = {
				-- "djlint", -- Jinja template linter
			},
			django = {
				-- "djlint", -- Django template linter
			},
			eruby = {
				-- "erb_lint", -- ERB template linter
			},
			erb = {
				-- "erb_lint", -- ERB template linter
			},
			twig = {
				-- "twig-cs-fixer", -- Twig template linter
			},

			-- Clojure
			clojure = {
				-- "clj-kondo", -- Clojure linter
				-- "joker", -- Alternative: Clojure linter
			},

			-- Fennel
			fennel = {
				-- "fennel", -- Fennel compiler linter
			},

			-- Janet
			janet = {
				-- "janet", -- Janet linter
			},

			-- Scheme & Racket
			scheme = {
				-- "scheme", -- Scheme checker
			},
			racket = {
				-- "racket", -- Racket checker
			},

			-- Perl
			perl = {
				-- "perlcritic", -- Perl linter
				-- "perlimports", -- Alternative: Perl import checker
			},

			-- Tcl
			tcl = {
				-- "nagelfar", -- Tcl linter
				-- "tclint", -- Alternative: Tcl linter
			},

			-- AWK
			awk = {
				-- "gawk", -- AWK syntax checker
			},

			-- Vim Script
			vim = {
				-- "vint", -- Vim script linter
			},

			-- Git
			gitcommit = {
				-- "commitlint", -- Commit message linter
				-- "gitlint", -- Alternative: Git commit message linter
			},

			-- Diff/Patch
			diff = {
				-- "checkpatch", -- Linux kernel patch checker
			},

			-- Environment Files
			env = {
				-- "dotenv_linter", -- .env file linter
			},
			dotenv = {
				-- "dotenv_linter", -- .env file linter
			},

			-- Accounting & Finance
			beancount = {
				-- "bean_check", -- Beancount syntax checker
			},
			ledger = {
				-- "hledger", -- Plain text accounting checker
			},

			-- Game Development
			gdscript = {
				-- "gdlint", -- GDScript linter (Godot)
			},

			-- Fortran
			fortran = {
				-- "fortitude", -- Fortran linter
			},

			-- MATLAB
			matlab = {
				-- "mlint", -- MATLAB linter
			},

			-- R
			r = {
				-- "lintr", -- R linter
			},
			rmd = {
				-- "rumdl", -- R Markdown linter
			},

			-- Robot Framework
			robot = {
				-- "rflint", -- Robot Framework linter
				-- "robocop", -- Alternative: Robot Framework linter
			},

			-- Snakemake
			snakemake = {
				-- "snakemake", -- Snakemake linter
			},

			-- Solidity
			solidity = {
				-- "solhint", -- Solidity linter
			},

			-- LSL (Linden Scripting Language)
			lsl = {
				-- "lslint", -- LSL linter
			},

			-- Puppet
			puppet = {
				-- "puppet-lint", -- Puppet linter
			},

			-- Salt
			sls = {
				-- "saltlint", -- Salt state linter
			},

			-- systemd
			systemd = {
				-- "systemd-analyze", -- systemd unit file validator
				-- "systemdlint", -- Alternative: systemd unit file linter
			},

			-- OpenEmbedded/Yocto
			bitbake = {
				-- "oelint-adv", -- OpenEmbedded/Yocto linter
			},

			-- RPM
			spec = {
				-- "rpmlint", -- RPM package linter
				-- "rpmspec", -- Alternative: RPM spec file checker
			},

			-- EditorConfig
			editorconfig = {
				-- "editorconfig-checker", -- EditorConfig validator
			},

			-- General/Multi-purpose
			text = {
				-- "codespell", -- Spell checker for source code
				-- "cspell", -- Alternative: comprehensive spell checker
				-- "typos", -- Alternative: fast source code spell checker
				-- "languagetool", -- Alternative: grammar checker
				-- "vale", -- Alternative: prose linter
				-- "write_good", -- Alternative: English prose linter
				-- "proselint", -- Alternative: prose linter
				-- "alex", -- Alternative: catch insensitive writing
				-- "woke", -- Alternative: inclusive language linter
				-- "blocklint", -- Alternative: regex-based linter
				-- "detect-secrets", -- Alternative: detect secrets in code
				-- "ls_lint", -- Alternative: file/directory name linter
			},
		}

		vim.api.nvim_create_autocmd({ "BufWritePost" }, {
			callback = function()
				require("lint").try_lint()
			end,
		})
	end,
}
