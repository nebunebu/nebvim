{ pkgs, ... }:
[
  # ============================================================================
  # WEB DEVELOPMENT
  # ============================================================================

  # CSS & Styling
  pkgs.prettierd # Fast Prettier daemon for CSS/SCSS (ACTIVE)
  # pkgs.nodePackages.prettier # Standard Prettier for CSS/SCSS/LESS

  # HTML
  pkgs.htmlbeautifier # Ruby-based HTML formatter (ACTIVE)

  # HTTP/REST
  # kulala-fmt is built into kulala.nvim plugin, no separate package needed

  # JavaScript & TypeScript
  # pkgs.prettierd already included above for CSS (ACTIVE)
  # pkgs.nodePackages.prettier # Standard Prettier for JS/TS
  # pkgs.biome # Fast all-in-one toolchain for web projects
  # pkgs.deno # Deno formatter for JS/TS/JSON/markdown

  # JSON
  pkgs.fixjson # Fixes and formats relaxed JSON5 (ACTIVE)
  # pkgs.jq # Command-line JSON processor (used by kulala-fmt)
  # pkgs.nodePackages.prettier # Prettier for JSON

  # Shell Scripts
  pkgs.shfmt # Shell script formatter with bash support (ACTIVE)
  # pkgs.beautysh # Bash beautifier
  # pkgs.shellharden # Corrective bash syntax highlighter

  # ============================================================================
  # PROGRAMMING LANGUAGES
  # ============================================================================

  # Lua
  pkgs.stylua # Opinionated Lua formatter (ACTIVE)
  # pkgs.lua-format # Alternative: configurable Lua formatter

  # Python
  pkgs.black # Uncompromising Python formatter (ACTIVE)
  # pkgs.isort # Python import sorting (use with black)
  # pkgs.ruff # Extremely fast Python linter/formatter (Rust)
  # pkgs.blue # Slightly less uncompromising Python formatter
  # pkgs.yapf # Google's Python formatter
  # pkgs.autopep8 # PEP 8 conformant formatter
  # pkgs.autoflake # Remove unused imports/variables
  # pkgs.pyupgrade # Upgrade syntax for newer Python versions

  # Rust
  pkgs.rustfmt # Official Rust formatter (ACTIVE)

  # Go
  # pkgs.go # Provides gofmt and goimports
  # pkgs.gofumpt # Stricter gofmt
  # pkgs.goimports-reviser # Advanced import sorting
  # pkgs.golines # Fix long lines in Go
  # pkgs.gci # Deterministic import order

  # C/C++
  # pkgs.clang-tools # Provides clang-format
  # pkgs.uncrustify # Highly configurable C/C++/C#/Java formatter
  # pkgs.astyle # Artistic Style formatter

  # Java
  # pkgs.google-java-format # Google's Java formatter

  # Kotlin
  # pkgs.ktfmt # Kotlin formatter from Facebook
  # pkgs.ktlint # Kotlin linter with built-in formatter

  # Swift
  # pkgs.swift-format # Official Swift formatter (requires Swift 6.0+)
  # pkgs.swiftformat # Alternative Swift formatter (Nicklockwood)

  # Ruby
  # pkgs.rubocop # Ruby linter and formatter
  # pkgs.rufo # Opinionated Ruby formatter
  # pkgs.standardrb # Bikeshed-proof Ruby formatter

  # Elixir
  # pkgs.elixir.mix # Elixir's mix format command

  # Erlang
  # pkgs.erlfmt # WhatsApp's Erlang formatter

  # Haskell
  # pkgs.haskellPackages.fourmolu # Haskell formatter (4-space indent)
  # pkgs.haskellPackages.ormolu # Alternative Haskell formatter
  # pkgs.haskellPackages.hindent # Haskell pretty printer
  # pkgs.haskellPackages.stylish-haskell # Haskell code prettifier

  # OCaml
  # pkgs.ocamlPackages.ocamlformat # OCaml auto-formatter

  # Zig
  # pkgs.zig # Provides zigfmt

  # Nim
  # pkgs.nim # Provides nimpretty
  # pkgs.nph # Opinionated Nim formatter

  # Crystal
  # pkgs.crystal # Provides crystal format

  # Gleam
  # pkgs.gleam # Gleam language formatter

  # Roc
  # pkgs.roc # Roc language formatter

  # D
  # pkgs.dfmt # D language formatter

  # Dart
  # pkgs.dart # Provides dart format

  # V
  # pkgs.v # V language formatter

  # Odin
  # pkgs.ols # Odin Language Server (provides odinfmt)

  # Julia
  # pkgs.julia # Use Runic.jl package for formatting

  # ============================================================================
  # SHELL & SYSTEM
  # ============================================================================

  # Fish
  # pkgs.fishPlugins.fish # Provides fish_indent

  # ============================================================================
  # MARKUP & DOCUMENTATION
  # ============================================================================

  # Markdown
  pkgs.markdownlint-cli2 # Fast, flexible Markdown linter/formatter (ACTIVE)
  # pkgs.mdformat # Opinionated Markdown formatter
  # pkgs.dprint # Pluggable formatter (supports markdown)
  # pkgs.nodePackages.markdownlint-cli # Original markdownlint
  # pkgs.nodePackages.prettier # Prettier for Markdown
  # pkgs.nodePackages.markdown-toc # Generate table of contents

  # reStructuredText
  # pkgs.python3Packages.rstfmt # reStructuredText formatter
  # pkgs.python3Packages.docstrfmt # reStructuredText docstring formatter

  # LaTeX
  pkgs.tex-fmt # Fast LaTeX formatter (Rust) (ACTIVE)
  # pkgs.texlive.combined.scheme-full # Provides latexindent

  # XML
  pkgs.xmlformat # XML formatter (ACTIVE)
  # pkgs.libxml2 # Provides xmllint
  # pkgs.xmlstarlet # XML command-line toolkit

  # ============================================================================
  # CONFIG & DATA FILES
  # ============================================================================

  # Nix
  pkgs.nixfmt-rfc-style # Official Nix formatter (RFC style) (ACTIVE)
  # pkgs.alejandra # Uncompromising Nix formatter
  # pkgs.nixpkgs-fmt # nixpkgs code formatter

  # YAML
  pkgs.yamlfmt # Google's YAML formatter (ACTIVE)
  # pkgs.python3Packages.yamlfix # Configurable YAML formatter
  # pkgs.nodePackages.prettier # Prettier for YAML

  # TOML
  # pkgs.taplo # TOML toolkit and formatter

  # JSON
  # pkgs.jq # Command-line JSON processor
  # pkgs.gojq # Pure Go implementation of jq

  # ============================================================================
  # JAVASCRIPT ECOSYSTEM
  # ============================================================================

  # Vue.js
  # pkgs.nodePackages.prettier # Vue.js formatter
  # pkgs.nodePackages.prettierd # Fast Prettier daemon

  # Svelte
  # pkgs.nodePackages.prettier # Svelte formatter
  # pkgs.nodePackages.prettierd # Fast Prettier daemon

  # Astro
  # pkgs.nodePackages.prettier # Astro formatter

  # ============================================================================
  # DEVOPS & INFRASTRUCTURE
  # ============================================================================

  # Terraform
  # pkgs.terraform # Provides terraform fmt
  # pkgs.terragrunt # Provides terragrunt hclfmt

  # OpenTofu
  # pkgs.opentofu # Provides tofu fmt

  # Docker
  # pkgs.dockerfile # Dockerfile formatter

  # Ansible
  # pkgs.ansible-lint # Ansible playbook formatter (with --fix)

  # Nomad
  # pkgs.nomad # Provides nomad fmt

  # Packer
  # pkgs.packer # Provides packer fmt

  # ============================================================================
  # CLOUD & IAC
  # ============================================================================

  # Azure Bicep
  # pkgs.bicep # Azure Bicep formatter

  # PKL (Apple)
  # pkgs.pkl # Apple's PKL configuration language

  # CUE
  # pkgs.cue # CUE data validation language formatter

  # KDL
  # pkgs.kdlfmt # KDL document formatter

  # KCL
  # pkgs.kcl # KCL formatter

  # ============================================================================
  # DATABASES & QUERY LANGUAGES
  # ============================================================================

  # SQL
  # pkgs.sqlfluff # SQL linter and formatter
  # pkgs.sqlfmt # dbt-focused SQL formatter
  # pkgs.pgformatter # PostgreSQL formatter
  # pkgs.sql-formatter # Multi-dialect SQL formatter
  # pkgs.sleek # CLI SQL formatter
  # pkgs.sqruff # Rust-based SQL linter/formatter

  # GraphQL
  # pkgs.nodePackages.prettier # GraphQL formatter

  # ============================================================================
  # FUNCTIONAL LANGUAGES
  # ============================================================================

  # Clojure
  # pkgs.cljfmt # Clojure formatter
  # pkgs.zprint # Clojure/EDN formatter
  # pkgs.cljstyle # Clojure code formatter
  # pkgs.joker # Small Clojure linter/formatter

  # Fennel
  # pkgs.fnlfmt # Fennel (Lisp on Lua) formatter

  # Racket
  # pkgs.racket # Provides racket format

  # ============================================================================
  # WEB ASSEMBLY & LOW LEVEL
  # ============================================================================

  # WebAssembly
  # pkgs.nodePackages.prettier # WebAssembly text format

  # Assembly
  # pkgs.asmfmt # Go assembler formatter

  # ============================================================================
  # SPECIALIZED LANGUAGES
  # ============================================================================

  # Protocol Buffers
  # pkgs.buf # Protocol Buffers formatter

  # Solidity
  # pkgs.foundry-bin # Provides forge fmt for Solidity

  # ============================================================================
  # TEMPLATE LANGUAGES
  # ============================================================================

  # Jinja/Django
  # pkgs.djlint # Jinja/Django template formatter

  # ERB (Ruby)
  # pkgs.erb-formatter # ERB template formatter

  # Blade (Laravel)
  # pkgs.nodePackages.blade-formatter # Laravel Blade formatter

  # Twig
  # pkgs.twig-cs-fixer # Twig template formatter

  # Templ (Go)
  # pkgs.templ # Go templ template formatter

  # ============================================================================
  # DOCUMENTATION & WRITING
  # ============================================================================

  # Typst
  # pkgs.typstyle # Typst document formatter
  # pkgs.typstfmt # Alternative Typst formatter

  # BibTeX
  # pkgs.bibtex-tidy # BibTeX formatter

  # Beancount
  # pkgs.beancount # Provides bean-format

  # ============================================================================
  # MOBILE DEVELOPMENT
  # ============================================================================

  # QML (Qt)
  # pkgs.qt6.qtdeclarative # Provides qmlformat

  # ============================================================================
  # GAME DEVELOPMENT
  # ============================================================================

  # GDScript (Godot)
  # pkgs.gdtoolkit # Provides gdformat for Godot

  # Gherkin (Cucumber)
  # pkgs.ghokin # Gherkin formatter
  # pkgs.reformat-gherkin # Alternative Gherkin formatter

  # ============================================================================
  # BUILD SYSTEMS & META
  # ============================================================================

  # Makefile
  # pkgs.bake # Makefile formatter

  # CMake
  # pkgs.cmake-format # CMake formatter
  # pkgs.gersemi # Alternative CMake formatter

  # Bazel
  # pkgs.buildifier # Bazel BUILD file formatter

  # Meson
  # pkgs.meson # Provides meson format

  # Just
  # pkgs.just # Justfile formatter

  # Dune (OCaml)
  # pkgs.ocamlPackages.dune # Provides format-dune-file

  # ============================================================================
  # NICHE/EMERGING LANGUAGES
  # ============================================================================

  # Grain
  # pkgs.grain # Grain language formatter

  # ReScript
  # pkgs.rescript # ReScript formatter

  # Imba
  # pkgs.imba # Imba language formatter

  # Mojo
  # pkgs.mojo # Modular Mojo formatter

  # Inko
  # pkgs.inko # Inko language formatter

  # Nickel
  # pkgs.nickel # Nickel configuration language formatter

  # ============================================================================
  # LISPS & SCHEME DIALECTS
  # ============================================================================

  # Janet
  # pkgs.janet # Janet language (provides janet-format via spork)

  # ============================================================================
  # PROPRIETARY/ENTERPRISE
  # ============================================================================

  # VHDL
  # pkgs.vsg # VHDL Style Guide enforcement
  # pkgs.ghdl # VHDL analyzer/formatter

  # Verilog/SystemVerilog
  # pkgs.verible # SystemVerilog formatter

  # ============================================================================
  # PHP & RELATED
  # ============================================================================

  # PHP
  # pkgs.php-cs-fixer # PHP Coding Standards Fixer
  # pkgs.php-codesniffer # Provides phpcbf
  # pkgs.phpPackages.pint # Laravel Pint (opinionated PHP formatter)

  # ============================================================================
  # R & STATISTICS
  # ============================================================================

  # R
  # pkgs.rPackages.styler # R formatter and linter

  # ============================================================================
  # .NET & F#
  # ============================================================================

  # F#
  # pkgs.fantomas # F# source code formatter

  # C#
  # pkgs.csharpier # C# code formatter

  # ============================================================================
  # SCALA & JVM
  # ============================================================================

  # Scala
  # pkgs.scalafmt # Scala code formatter

  # Groovy
  # pkgs.nodePackages.npm-groovy-lint # Groovy/Jenkinsfile/Gradle formatter

  # ============================================================================
  # POLICY LANGUAGES
  # ============================================================================

  # Rego (Open Policy Agent)
  # pkgs.opa # Provides opa fmt

  # Cedar (AWS)
  # pkgs.cedar # AWS Cedar policy formatter

  # ============================================================================
  # CODEQL
  # ============================================================================

  # pkgs.codeql # GitHub CodeQL query formatter

  # ============================================================================
  # OBSCURE/ACADEMIC
  # ============================================================================

  # Prolog
  # pkgs.swiProlog # SWI-Prolog formatter

  # Standard ML
  # pkgs.smlfmt # Standard ML formatter

  # Fortran
  # pkgs.fprettify # Modern Fortran formatter
  # pkgs.findent # Fortran indenter

  # AWK
  # pkgs.gawk # AWK program formatter

  # Tcl
  # pkgs.tclint # Tcl script formatter (provides tclfmt)

  # LilyPond
  # pkgs.python3Packages.python-ly # LilyPond music notation formatter

  # ============================================================================
  # PUPPET
  # ============================================================================

  # pkgs.puppet-lint # Puppet manifest formatter

  # ============================================================================
  # COMMIT MESSAGES
  # ============================================================================

  # pkgs.commitmsgfmt # Commit message formatter

  # ============================================================================
  # DIAGRAMS
  # ============================================================================

  # D2
  # pkgs.d2 # D2 diagram language formatter

  # Mermaid
  # pkgs.nodePackages.prettier # Mermaid diagram formatter

  # ============================================================================
  # RUST SPECIALIZED
  # ============================================================================

  # Dioxus
  # pkgs.dioxus-cli # Formats rsx! macros in Rust

  # Leptos
  # pkgs.leptosfmt # Formats Leptos view! macro

  # Yew
  # pkgs.yew-fmt # Formats Yew html! macro

  # ============================================================================
  # SPECIALIZED FORMATS
  # ============================================================================

  # Liquidsoap
  # pkgs.liquidsoap # Provides liquidsoap-prettier

  # Snakemake
  # pkgs.snakefmt # Snakemake file formatter

  # TypeSpec
  # pkgs.typespec # TypeSpec compiler/formatter

  # Ziggy
  # pkgs.ziggy # Ziggy data serialization formatter

  # Jsonnet
  # pkgs.go-jsonnet # Provides jsonnetfmt

  # Hurl
  # pkgs.hurl # Hurl HTTP file formatter

  # PureScript
  # pkgs.purs-tidy # PureScript syntax formatter

  # Tree-sitter queries
  # pkgs.tree-sitter # Provides format-queries

  # ============================================================================
  # UTILITIES & META-FORMATTERS
  # ============================================================================

  # Spell checkers
  # pkgs.codespell # Spell checker for source code
  # pkgs.typos # Fast source code spell checker

  # CJK formatting
  # pkgs.python3Packages.autocorrect # CJK copywriting formatter
  # pkgs.python3Packages.pangu # Insert whitespace between CJK and half-width chars

  # Keep-sorted
  # pkgs.keep-sorted # Keep sorted blocks in files

  # Code blocks in markdown
  # pkgs.cbfmt # Format codeblocks in markdown/org
  # pkgs.mdsf # Format markdown code blocks

  # Whitespace utilities (built into conform.nvim) (ACTIVE)
  # trim_whitespace - Remove trailing whitespace
  # trim_newlines - Remove extra blank lines at end
  # squeeze_blanks - Squeeze repeated blank lines via cat -s
  # NOTE: These formatters are built into conform.nvim and don't require packages
]
