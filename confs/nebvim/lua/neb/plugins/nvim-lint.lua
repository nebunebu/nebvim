return {
	"nvim-lint",
	event = "BufWritePost",
	after = function()
		require("lint").linters_by_ft = {
			javascript = { "eslint" },
			-- markdown = { "markdownlint-cli2" },
			nix = { "deadnix", "statix" },
			python = { "pylint" },
			typescript = { "eslint" },

			-- actionlint - GitHub Actions workflow linter
			-- yaml = { "actionlint" },

			-- alex - Catch insensitive, inconsiderate writing
			-- markdown = { "alex" },

			-- ameba - Crystal linter
			-- crystal = { "ameba" },

			-- ansible-lint - Ansible playbook linter
			-- yaml = { "ansible_lint" },

			-- bandit - Python security linter
			-- python = { "bandit" },

			-- bean-check - Beancount syntax checker
			-- beancount = { "bean_check" },

			-- biomejs - Fast formatter and linter
			-- javascript = { "biomejs" },
			-- typescript = { "biomejs" },

			-- blocklint - Regex-based linter
			-- text = { "blocklint" },

			-- buf_lint - Protobuf linter
			-- proto = { "buf_lint" },

			-- buildifier - Bazel BUILD file formatter and linter
			-- bzl = { "buildifier" },

			-- cfn-lint - AWS CloudFormation linter
			-- yaml = { "cfn_lint" },

			-- cfn_nag - CloudFormation security scanner
			-- yaml = { "cfn_nag" },

			-- checkmake - Makefile linter
			-- make = { "checkmake" },

			-- checkpatch - Linux kernel patch checker
			-- diff = { "checkpatch" },

			-- checkstyle - Java code style checker
			-- java = { "checkstyle" },

			-- chktex - LaTeX semantic checker
			tex = { "chktex" },

			-- clang-tidy - C/C++ linter
			-- c = { "clangtidy" },
			-- cpp = { "clangtidy" },

			-- clazy - Qt C++ linter
			-- cpp = { "clazy" },

			-- clippy - Rust linter
			-- rust = { "clippy" },

			-- clj-kondo - Clojure linter
			-- clojure = { "clj-kondo" },

			-- cmakelint - CMake linter
			-- cmake = { "cmakelint" },

			-- cmake-lint - CMake linter (alternative)
			-- cmake = { "cmake_lint" },

			-- codespell - Spell checker for source code
			-- text = { "codespell" },

			-- commitlint - Commit message linter
			-- gitcommit = { "commitlint" },

			-- cppcheck - C/C++ static analyzer
			-- c = { "cppcheck" },
			-- cpp = { "cppcheck" },

			-- cpplint - C++ style checker
			-- cpp = { "cpplint" },

			-- credo - Elixir code analysis tool
			-- elixir = { "credo" },

			-- cspell - Spell checker
			-- text = { "cspell" },

			-- cue - CUE validation tool
			-- cue = { "cue" },

			-- curlylint - HTML template linter
			-- html = { "curlylint" },

			-- dash - POSIX shell checker
			-- sh = { "dash" },

			-- dclint - Docker Compose linter
			-- yaml = { "dclint" },

			-- deadnix - Nix dead code scanner (already enabled)
			-- nix = { "deadnix" },

			-- deno - JavaScript/TypeScript linter
			-- javascript = { "deno" },
			-- typescript = { "deno" },

			-- detect-secrets - Detect secrets in code
			-- text = { "detect-secrets" },

			-- dmypy - Mypy daemon for faster type checking
			-- python = { "dmypy" },

			-- dxc - DirectX Shader Compiler
			-- hlsl = { "dxc" },

			-- djlint - Django/Jinja template linter
			-- html = { "djlint" },

			-- dotenv-linter - .env file linter
			-- env = { "dotenv_linter" },

			-- editorconfig-checker - EditorConfig validator
			-- text = { "editorconfig-checker" },

			-- erb-lint - ERB template linter
			-- eruby = { "erb_lint" },

			-- eslint - JavaScript/TypeScript linter (already enabled)
			-- javascript = { "eslint" },
			-- typescript = { "eslint" },

			-- eslint_d - Faster eslint daemon
			-- javascript = { "eslint_d" },
			-- typescript = { "eslint_d" },

			-- eugene - PostgreSQL migration linter
			-- sql = { "eugene" },

			-- fennel - Fennel compiler linter
			-- fennel = { "fennel" },

			-- fieldalignment - Go struct field alignment checker
			-- go = { "fieldalignment" },

			-- fish - Fish shell syntax checker
			-- fish = { "fish" },

			-- flake8 - Python linter
			-- python = { "flake8" },

			-- flawfinder - C/C++ security scanner
			-- c = { "flawfinder" },
			-- cpp = { "flawfinder" },

			-- fortitude - Fortran linter
			-- fortran = { "fortitude" },

			-- fsharplint - F# linter
			-- fsharp = { "fsharplint" },

			-- gawk - AWK syntax checker
			-- awk = { "gawk" },

			-- gdlint - GDScript linter
			-- gdscript = { "gdlint" },

			-- ghdl - VHDL compiler/linter
			-- vhdl = { "ghdl" },

			-- gitlint - Git commit message linter
			-- gitcommit = { "gitlint" },

			-- glslc - GLSL shader compiler
			-- glsl = { "glslc" },

			-- golangcilint - Go meta-linter
			-- go = { "golangcilint" },

			-- hadolint - Dockerfile linter
			-- dockerfile = { "hadolint" },

			-- hledger - Plain text accounting checker
			-- ledger = { "hledger" },

			-- hlint - Haskell linter
			-- haskell = { "hlint" },

			-- htmlhint - HTML linter
			-- html = { "htmlhint" },

			-- tidy - HTML validator
			-- html = { "tidy" },

			-- inko - Inko compiler linter
			-- inko = { "inko" },

			-- janet - Janet linter
			-- janet = { "janet" },

			-- joker - Clojure linter
			-- clojure = { "joker" },

			-- jshint - JavaScript linter
			-- javascript = { "jshint" },

			-- json5 - JSON5 validator
			-- json5 = { "json5" },

			-- jsonlint - JSON linter
			-- json = { "jsonlint" },

			-- json_tool - Python JSON validator
			-- json = { "json_tool" },

			-- ksh - Korn shell checker
			-- ksh = { "ksh" },

			-- ktlint - Kotlin linter
			-- kotlin = { "ktlint" },

			-- lacheck - LaTeX checker
			-- tex = { "lacheck" },

			-- languagetool - Grammar checker
			-- text = { "languagetool" },

			-- lslint - LSL (Linden Scripting Language) linter
			-- lsl = { "lslint" },

			-- ls-lint - File/directory name linter
			-- text = { "ls_lint" },

			-- luac - Lua compiler checker
			-- lua = { "luac" },

			-- luacheck - Lua linter (already enabled)
			lua = { "luacheck" },

			-- mado - Markdown linter
			-- markdown = { "mado" },

			-- mago_lint - PHP linter
			-- php = { "mago_lint" },

			-- mago_analyze - PHP analyzer
			-- php = { "mago_analyze" },

			-- markdownlint - Markdown linter
			-- markdown = { "markdownlint" },

			-- markdownlint-cli2 - Markdown linter
			markdown = { "markdownlint-cli2" },

			-- markuplint - HTML/template linter
			-- html = { "markuplint" },

			-- mlint - MATLAB linter
			-- matlab = { "mlint" },

			-- mypy - Python type checker
			-- python = { "mypy" },

			-- nagelfar - Tcl linter
			-- tcl = { "nagelfar" },

			-- nix - Nix expression checker
			-- nix = { "nix" },

			-- npm-groovy-lint - Groovy linter
			-- groovy = { "npm-groovy-lint" },

			-- oelint-adv - OpenEmbedded/Yocto linter
			-- bitbake = { "oelint-adv" },

			-- opa_check - Open Policy Agent checker
			-- rego = { "opa_check" },

			-- tofu - OpenTofu linter
			-- tf = { "tofu" },

			-- oxlint - Fast JavaScript linter
			-- javascript = { "oxlint" },
			-- typescript = { "oxlint" },

			-- perlcritic - Perl linter
			-- perl = { "perlcritic" },

			-- perlimports - Perl import checker
			-- perl = { "perlimports" },

			-- phpcs - PHP CodeSniffer
			-- php = { "phpcs" },

			-- phpinsights - PHP quality checker
			-- php = { "phpinsights" },

			-- phpmd - PHP Mess Detector
			-- php = { "phpmd" },

			-- php - PHP syntax checker
			-- php = { "php" },

			-- phpstan - PHP static analyzer
			-- php = { "phpstan" },

			-- pmd - Multi-language static analyzer
			-- java = { "pmd" },

			-- pony - Pony compiler linter
			-- pony = { "pony" },

			-- prisma-lint - Prisma schema linter
			-- prisma = { "prisma-lint" },

			-- proselint - Prose linter
			-- text = { "proselint" },

			-- protolint - Protocol Buffers linter
			-- proto = { "protolint" },

			-- psalm - PHP static analyzer
			-- php = { "psalm" },

			-- puppet-lint - Puppet linter
			-- puppet = { "puppet-lint" },

			-- pycodestyle - Python style checker
			-- python = { "pycodestyle" },

			-- pydocstyle - Python docstring checker
			-- python = { "pydocstyle" },

			-- pylint - Python linter (already enabled)
			-- python = { "pylint" },

			-- pflake8 - Flake8 with pyproject.toml support
			-- python = { "pflake8" },

			-- quick-lint-js - Fast JavaScript linter
			-- javascript = { "quick-lint-js" },

			-- redocly - OpenAPI linter
			-- yaml = { "redocly" },

			-- regal - Rego linter
			-- rego = { "regal" },

			-- revive - Go linter
			-- go = { "revive" },

			-- rflint - Robot Framework linter
			-- robot = { "rflint" },

			-- robocop - Robot Framework linter
			-- robot = { "robocop" },

			-- rpmlint - RPM package linter
			-- spec = { "rpmlint" },

			-- rpmspec - RPM spec file checker
			-- spec = { "rpmspec" },

			-- rstcheck - reStructuredText checker
			-- rst = { "rstcheck" },

			-- rstlint - reStructuredText linter
			-- rst = { "rstlint" },

			-- rubocop - Ruby linter
			-- ruby = { "rubocop" },

			-- ruby - Ruby syntax checker
			-- ruby = { "ruby" },

			-- ruff - Fast Python linter
			-- python = { "ruff" },

			-- rumdl - R Markdown linter
			-- rmd = { "rumdl" },

			-- saltlint - Salt state linter
			-- sls = { "saltlint" },

			-- selene - Lua linter
			-- lua = { "selene" },

			-- shellcheck - Shell script linter (already enabled)
			bash = { "shellcheck" },
			sh = { "shellcheck" },

			-- slang - SystemVerilog linter
			-- systemverilog = { "slang" },

			-- snakemake - Snakemake linter
			-- snakemake = { "snakemake" },

			-- snyk_iac - Infrastructure as Code security scanner
			-- yaml = { "snyk_iac" },

			-- solhint - Solidity linter
			-- solidity = { "solhint" },

			-- spectral - OpenAPI/AsyncAPI linter
			-- yaml = { "spectral" },

			-- sphinx-lint - Sphinx documentation linter
			-- rst = { "sphinx-lint" },

			-- sqlfluff - SQL linter
			-- sql = { "sqlfluff" },

			-- sqruff - SQL linter (Rust version)
			-- sql = { "sqruff" },

			-- standardjs - JavaScript standard style
			-- javascript = { "standardjs" },

			-- standardrb - Ruby standard style
			-- ruby = { "standardrb" },

			-- statix - Nix linter (already enabled)
			-- nix = { "statix" },

			-- stylelint - CSS/SCSS linter (already enabled)
			css = { "stylelint" },
			scss = { "stylelint" },

			-- svlint - SystemVerilog linter
			-- systemverilog = { "svlint" },

			-- swiftlint - Swift linter
			-- swift = { "swiftlint" },

			-- systemd-analyze - systemd unit file validator
			-- systemd = { "systemd-analyze" },

			-- systemdlint - systemd unit file linter
			-- systemd = { "systemdlint" },

			-- tclint - Tcl linter
			-- tcl = { "tclint" },

			-- tflint - Terraform linter
			-- terraform = { "tflint" },

			-- tfsec - Terraform security scanner
			-- terraform = { "tfsec" },

			-- tlint - Laravel Blade linter
			-- blade = { "tlint" },

			-- tombi - TOML linter
			-- toml = { "tombi" },

			-- trivy - Security scanner
			-- dockerfile = { "trivy" },

			-- ts-standard - TypeScript standard style
			-- typescript = { "ts-standard" },

			-- twig-cs-fixer - Twig template linter
			-- twig = { "twig-cs-fixer" },

			-- typos - Source code spell checker
			-- text = { "typos" },

			-- vala_lint - Vala linter
			-- vala = { "vala_lint" },

			-- vale - Prose linter
			-- text = { "vale" },

			-- verilator - Verilog/SystemVerilog linter
			-- verilog = { "verilator" },
			-- systemverilog = { "verilator" },

			-- vint - Vim script linter
			-- vim = { "vint" },

			-- vsg - VHDL Style Guide checker
			-- vhdl = { "vsg" },

			-- vulture - Python dead code finder
			-- python = { "vulture" },

			-- woke - Inclusive language linter
			-- text = { "woke" },

			-- write_good - English prose linter
			-- text = { "write_good" },

			-- yamllint - YAML linter
			-- yaml = { "yamllint" },

			-- yq - YAML/JSON/XML processor
			-- yaml = { "yq" },

			-- zizmor - GitHub Actions security scanner
			-- yaml = { "zizmor" },

			-- zlint - Zig linter
			-- zig = { "zlint" },

			-- zsh - Zsh syntax checker
			zsh = { "zsh" },
		}

		vim.api.nvim_create_autocmd({ "BufWritePost" }, {
			callback = function()
				require("lint").try_lint()
			end,
		})
	end,
}
