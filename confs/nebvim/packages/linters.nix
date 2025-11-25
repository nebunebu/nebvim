{ pkgs, ... }:
[
  # ============================================================================
  # JAVASCRIPT & TYPESCRIPT
  # ============================================================================

  pkgs.nodePackages.eslint # JavaScript/TypeScript linter
  # pkgs.nodePackages.eslint_d # Faster eslint daemon
  # pkgs.nodePackages.jshint # Alternative JavaScript linter
  # pkgs.nodePackages.typescript # TypeScript compiler (tsc for type checking)

  # pkgs.biome # Fast all-in-one linter/formatter
  # pkgs.deno # Deno's built-in linter
  # pkgs.quick-lint-js # Extremely fast JavaScript linter

  # ============================================================================
  # PYTHON
  # ============================================================================

  pkgs.python3Packages.pylint # Comprehensive Python linter
  # pkgs.python3Packages.flake8 # Python linter
  # pkgs.python3Packages.mypy # Python type checker
  # pkgs.python3Packages.bandit # Python security linter
  # pkgs.python3Packages.pycodestyle # PEP 8 style checker
  # pkgs.python3Packages.pydocstyle # Python docstring checker
  # pkgs.python3Packages.vulture # Dead code finder

  # pkgs.ruff # Extremely fast Python linter (Rust)

  # ============================================================================
  # NIX
  # ============================================================================

  pkgs.deadnix # Nix dead code scanner
  # pkgs.statix # Nix linter
  # pkgs.nix # Nix expression checker (nix-instantiate --parse)

  # ============================================================================
  # SHELL SCRIPTS
  # ============================================================================

  pkgs.shellcheck # Shell script linter (bash, sh, zsh)
  # pkgs.dash # POSIX shell checker

  # Zsh
  pkgs.zsh # Zsh syntax checker

  # Fish
  # pkgs.fish # Fish shell syntax checker

  # ============================================================================
  # CSS & STYLING
  # ============================================================================

  pkgs.nodePackages.stylelint # CSS/SCSS/SASS/LESS linter

  # ============================================================================
  # MARKUP & DOCUMENTATION
  # ============================================================================

  # Markdown
  pkgs.markdownlint-cli
  # pkgs.markdownlint-cli2 # Fast, flexible Markdown linter
  # pkgs.nodePackages.markdownlint-cli # Original markdownlint
  # pkgs.nodePackages.alex # Catch insensitive, inconsiderate writing
  # pkgs.python3Packages.mdit-py-plugins # Markdown linter (mado)

  # reStructuredText
  # pkgs.python3Packages.rstcheck # reStructuredText checker
  # pkgs.python3Packages.doc8 # reStructuredText style checker

  # LaTeX
  pkgs.texlivePackages.chktex # LaTeX semantic checker
  # pkgs.lacheck # LaTeX checker (basic)

  # HTML
  # pkgs.nodePackages.htmlhint # HTML linter
  # pkgs.html-tidy # HTML validator and formatter
  # pkgs.curlylint # HTML template linter

  # Prose/Writing
  # pkgs.vale # Prose linter (syntax-aware)
  # pkgs.languagetool # Grammar and spell checker
  # pkgs.proselint # Prose linter
  # pkgs.write-good # English prose linter

  # ============================================================================
  # LUA
  # ============================================================================

  pkgs.lua54Packages.luacheck # Lua linter
  # pkgs.selene # Modern Lua linter

  # ============================================================================
  # RUST
  # ============================================================================

  # pkgs.clippy # Rust linter (via cargo clippy)

  # ============================================================================
  # GO
  # ============================================================================

  # pkgs.golangci-lint # Go meta-linter (runs multiple linters)
  # pkgs.revive # Fast Go linter
  # pkgs.staticcheck # Go static analyzer

  # ============================================================================
  # C/C++
  # ============================================================================

  # pkgs.clang-tools # Provides clang-tidy
  # pkgs.cppcheck # C/C++ static analyzer
  # pkgs.cpplint # C++ style checker (Google)
  # pkgs.flawfinder # C/C++ security scanner

  # ============================================================================
  # JAVA & JVM
  # ============================================================================

  # Java
  # pkgs.checkstyle # Java code style checker
  # pkgs.pmd # Multi-language static analyzer
  # pkgs.spotbugs # Java bug detector

  # Kotlin
  # pkgs.ktlint # Kotlin linter and formatter

  # Groovy
  # pkgs.nodePackages.npm-groovy-lint # Groovy/Jenkinsfile/Gradle linter

  # Scala
  # pkgs.scalastyle # Scala style checker

  # ============================================================================
  # RUBY
  # ============================================================================

  # pkgs.rubocop # Ruby linter and formatter
  # pkgs.ruby # Ruby syntax checker (ruby -c)
  # pkgs.standardrb # Ruby standard style

  # ============================================================================
  # ELIXIR & ERLANG
  # ============================================================================

  # Elixir
  # pkgs.elixir # Provides mix for credo

  # ============================================================================
  # HASKELL & ML LANGUAGES
  # ============================================================================

  # Haskell
  # pkgs.haskellPackages.hlint # Haskell linter

  # OCaml
  # pkgs.ocamlPackages.ocaml # OCaml compiler for type checking

  # ============================================================================
  # F#
  # ============================================================================

  # pkgs.fsharplint # F# linter

  # ============================================================================
  # SWIFT & OBJECTIVE-C
  # ============================================================================

  # Swift
  # pkgs.swiftlint # Swift linter

  # Objective-C
  # pkgs.clang-tools # Provides clang-tidy for Objective-C

  # ============================================================================
  # CRYSTAL
  # ============================================================================

  # pkgs.crystal # Provides ameba linter

  # ============================================================================
  # ZIG
  # ============================================================================

  # pkgs.zig # Zig compiler (for checking)

  # ============================================================================
  # CONFIG & DATA FILES
  # ============================================================================

  # JSON
  # pkgs.jq # JSON validator and processor
  # pkgs.jsonlint # JSON linter
  # pkgs.python3Packages.json-spec # JSON schema validator

  # YAML
  # pkgs.yamllint # YAML linter
  # pkgs.actionlint # GitHub Actions workflow linter
  # pkgs.ansible-lint # Ansible playbook linter
  # pkgs.circleci-cli # CircleCI config validator
  # pkgs.python3Packages.cfn-lint # AWS CloudFormation linter

  # TOML
  # pkgs.taplo # TOML linter (via taplo lint)

  # XML
  # pkgs.libxml2 # Provides xmllint

  # CUE
  # pkgs.cue # CUE validation tool

  # ============================================================================
  # PROTOCOL BUFFERS
  # ============================================================================

  # pkgs.buf # Protocol Buffers linter
  # pkgs.protolint # Protocol Buffers linter

  # ============================================================================
  # SQL & DATABASES
  # ============================================================================

  # pkgs.sqlfluff # SQL linter and formatter
  # pkgs.sqruff # SQL linter (Rust version)

  # PostgreSQL
  # pkgs.pgformatter # PostgreSQL linter/formatter

  # Prisma
  # pkgs.nodePackages.prisma # Prisma schema linter

  # ============================================================================
  # DOCKER & CONTAINERS
  # ============================================================================

  # pkgs.hadolint # Dockerfile linter
  # pkgs.trivy # Security scanner for containers/IaC
  # pkgs.dockle # Container image linter

  # Docker Compose
  # pkgs.docker-compose # Validates compose files

  # ============================================================================
  # INFRASTRUCTURE AS CODE
  # ============================================================================

  # Terraform
  # pkgs.tflint # Terraform linter
  # pkgs.tfsec # Terraform security scanner
  # pkgs.checkov # IaC security scanner
  # pkgs.terraform # Provides terraform validate

  # OpenTofu
  # pkgs.opentofu # OpenTofu linter

  # Ansible
  # pkgs.ansible-lint # Ansible playbook linter

  # Kubernetes
  # pkgs.kubeval # Kubernetes manifest validator
  # pkgs.kubeconform # Kubernetes manifest validator
  # pkgs.kube-linter # Kubernetes YAML linter

  # CloudFormation
  # pkgs.python3Packages.cfn-lint # AWS CloudFormation linter

  # ============================================================================
  # OPEN POLICY AGENT
  # ============================================================================

  # pkgs.opa # Open Policy Agent (opa check)
  # pkgs.regal # Rego linter

  # ============================================================================
  # BUILD SYSTEMS
  # ============================================================================

  # Makefile
  # pkgs.checkmake # Makefile linter
]
