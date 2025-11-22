{ pkgs, ... }:
{
  # ============================================================================
  # JAVASCRIPT & TYPESCRIPT
  # ============================================================================
  
  inherit (pkgs.nodePackages)
    eslint # JavaScript/TypeScript linter
    # eslint_d # Faster eslint daemon
    # jshint # Alternative JavaScript linter
    # typescript # TypeScript compiler (tsc for type checking)
    ;
  inherit (pkgs)
    # biome # Fast all-in-one linter/formatter
    # deno # Deno's built-in linter
    # quick-lint-js # Extremely fast JavaScript linter
    ;
  
  # ============================================================================
  # PYTHON
  # ============================================================================
  
  inherit (pkgs.python3Packages)
    pylint # Comprehensive Python linter
    # flake8 # Python linter
    # mypy # Python type checker
    # bandit # Python security linter
    # pycodestyle # PEP 8 style checker
    # pydocstyle # Python docstring checker
    # vulture # Dead code finder
    ;
  inherit (pkgs)
    # ruff # Extremely fast Python linter (Rust)
    ;
  
  # ============================================================================
  # NIX
  # ============================================================================
  
  inherit (pkgs)
    deadnix # Nix dead code scanner
    # statix # Nix linter (excluded deliberately)
    # nix # Nix expression checker (nix-instantiate --parse)
    ;
  
  # ============================================================================
  # SHELL SCRIPTS
  # ============================================================================
  
  inherit (pkgs)
    shellcheck # Shell script linter (bash, sh, zsh)
    # dash # POSIX shell checker
    ;
  
  # Fish
  inherit (pkgs)
    # fish # Fish shell syntax checker
    ;
  
  # ============================================================================
  # CSS & STYLING
  # ============================================================================
  
  inherit (pkgs.nodePackages)
    # stylelint # CSS/SCSS/SASS/LESS linter
    ;
  
  # ============================================================================
  # MARKUP & DOCUMENTATION
  # ============================================================================
  
  # Markdown
  inherit (pkgs)
    markdownlint-cli2 # Fast, flexible Markdown linter
    ;
  inherit (pkgs.nodePackages)
    # markdownlint-cli # Original markdownlint
    # alex # Catch insensitive, inconsiderate writing
    ;
  inherit (pkgs.python3Packages)
    # mdit-py-plugins # Markdown linter (mado)
    ;
  
  # reStructuredText
  inherit (pkgs.python3Packages)
    # rstcheck # reStructuredText checker
    # doc8 # reStructuredText style checker
    ;
  
  # LaTeX
  inherit (pkgs)
    chktex # LaTeX semantic checker
    # lacheck # LaTeX checker (basic)
    ;
  
  # HTML
  inherit (pkgs.nodePackages)
    # htmlhint # HTML linter
    ;
  inherit (pkgs)
    # html-tidy # HTML validator and formatter
    # curlylint # HTML template linter
    ;
  
  # Prose/Writing
  inherit (pkgs)
    # vale # Prose linter (syntax-aware)
    # languagetool # Grammar and spell checker
    # proselint # Prose linter
    # write-good # English prose linter
    ;
  
  # ============================================================================
  # LUA
  # ============================================================================
  
  inherit (pkgs.lua54Packages)
    luacheck # Lua linter
    ;
  inherit (pkgs)
    # selene # Modern Lua linter
    ;
  
  # ============================================================================
  # RUST
  # ============================================================================
  
  inherit (pkgs)
    # clippy # Rust linter (via cargo clippy)
    ;
  
  # ============================================================================
  # GO
  # ============================================================================
  
  inherit (pkgs)
    # golangci-lint # Go meta-linter (runs multiple linters)
    # revive # Fast Go linter
    # staticcheck # Go static analyzer
    ;
  
  # ============================================================================
  # C/C++
  # ============================================================================
  
  inherit (pkgs)
    # clang-tools # Provides clang-tidy
    # cppcheck # C/C++ static analyzer
    # cpplint # C++ style checker (Google)
    # flawfinder # C/C++ security scanner
    ;
  
  # ============================================================================
  # JAVA & JVM
  # ============================================================================
  
  # Java
  inherit (pkgs)
    # checkstyle # Java code style checker
    # pmd # Multi-language static analyzer
    # spotbugs # Java bug detector
    ;
  
  # Kotlin
  inherit (pkgs)
    # ktlint # Kotlin linter and formatter
    ;
  
  # Groovy
  inherit (pkgs.nodePackages)
    # npm-groovy-lint # Groovy/Jenkinsfile/Gradle linter
    ;
  
  # Scala
  inherit (pkgs)
    # scalastyle # Scala style checker
    ;
  
  # ============================================================================
  # RUBY
  # ============================================================================
  
  inherit (pkgs)
    # rubocop # Ruby linter and formatter
    # ruby # Ruby syntax checker (ruby -c)
    # standardrb # Ruby standard style
    ;
  
  # ============================================================================
  # ELIXIR & ERLANG
  # ============================================================================
  
  # Elixir
  inherit (pkgs)
    # elixir # Provides mix for credo
    ;
  
  # ============================================================================
  # HASKELL & ML LANGUAGES
  # ============================================================================
  
  # Haskell
  inherit (pkgs.haskellPackages)
    # hlint # Haskell linter
    ;
  
  # OCaml
  inherit (pkgs.ocamlPackages)
    # ocaml # OCaml compiler for type checking
    ;
  
  # ============================================================================
  # F#
  # ============================================================================
  
  inherit (pkgs)
    # fsharplint # F# linter
    ;
  
  # ============================================================================
  # SWIFT & OBJECTIVE-C
  # ============================================================================
  
  # Swift
  inherit (pkgs)
    # swiftlint # Swift linter
    ;
  
  # Objective-C
  inherit (pkgs)
    # clang-tools # Provides clang-tidy for Objective-C
    ;
  
  # ============================================================================
  # CRYSTAL
  # ============================================================================
  
  inherit (pkgs)
    # crystal # Provides ameba linter
    ;
  
  # ============================================================================
  # ZIG
  # ============================================================================
  
  inherit (pkgs)
    # zig # Zig compiler (for checking)
    ;
  
  # ============================================================================
  # CONFIG & DATA FILES
  # ============================================================================
  
  # JSON
  inherit (pkgs)
    # jq # JSON validator and processor
    # jsonlint # JSON linter
    ;
  inherit (pkgs.python3Packages)
    # json-spec # JSON schema validator
    ;
  
  # YAML
  inherit (pkgs)
    # yamllint # YAML linter
    # actionlint # GitHub Actions workflow linter
    # ansible-lint # Ansible playbook linter
    # circleci-cli # CircleCI config validator
    ;
  inherit (pkgs.python3Packages)
    # cfn-lint # AWS CloudFormation linter
    ;
  
  # TOML
  inherit (pkgs)
    # taplo # TOML linter (via taplo lint)
    ;
  
  # XML
  inherit (pkgs)
    # libxml2 # Provides xmllint
    ;
  
  # CUE
  inherit (pkgs)
    # cue # CUE validation tool
    ;
  
  # ============================================================================
  # PROTOCOL BUFFERS
  # ============================================================================
  
  inherit (pkgs)
    # buf # Protocol Buffers linter
    # protolint # Protocol Buffers linter
    ;
  
  # ============================================================================
  # SQL & DATABASES
  # ============================================================================
  
  inherit (pkgs)
    # sqlfluff # SQL linter and formatter
    # sqruff # SQL linter (Rust version)
    ;
  
  # PostgreSQL
  inherit (pkgs)
    # pgformatter # PostgreSQL linter/formatter
    ;
  
  # Prisma
  inherit (pkgs.nodePackages)
    # prisma # Prisma schema linter
    ;
  
  # ============================================================================
  # DOCKER & CONTAINERS
  # ============================================================================
  
  inherit (pkgs)
    # hadolint # Dockerfile linter
    # trivy # Security scanner for containers/IaC
    # dockle # Container image linter
    ;
  
  # Docker Compose
  inherit (pkgs)
    # docker-compose # Validates compose files
    ;
  
  # ============================================================================
  # INFRASTRUCTURE AS CODE
  # ============================================================================
  
  # Terraform
  inherit (pkgs)
    # tflint # Terraform linter
    # tfsec # Terraform security scanner
    # checkov # IaC security scanner
    # terraform # Provides terraform validate
    ;
  
  # OpenTofu
  inherit (pkgs)
    # opentofu # OpenTofu linter
    ;
  
  # Ansible
  inherit (pkgs)
    # ansible-lint # Ansible playbook linter
    ;
  
  # Kubernetes
  inherit (pkgs)
    # kubeval # Kubernetes manifest validator
    # kubeconform # Kubernetes manifest validator
    # kube-linter # Kubernetes YAML linter
    ;
  
  # CloudFormation
  inherit (pkgs.python3Packages)
    # cfn-lint # AWS CloudFormation linter
    ;
  
  # ============================================================================
  # OPEN POLICY AGENT
  # ============================================================================
  
  inherit (pkgs)
    # opa # Open Policy Agent (opa check)
    # regal # Rego linter
    ;
  
  # ============================================================================
  # BUILD SYSTEMS
  # ============================================================================
  
  # Makefile
  inherit (pkgs)
    # checkmake # Makefile linter
    ;
  
  # CM
