{ pkgs, ... }:
let
  importPackageFile = file: import file { inherit pkgs; };
  packageFiles = [
    ./linters.nix
    ./formatters.nix
    ./lang-servers.nix
    # ./debug-adapters.nix
    # ./test-runners.nix
  ];
  # Custom bashdb built from GitHub with bash 5.3+ support
  bashdb = import ../packages/bashdb.nix { inherit pkgs; };
in
pkgs.lib.flatten (map importPackageFile packageFiles)
++ [
  # pkgs.ast-grep # for grug-far

  pkgs.kdePackages.qtdeclarative
  # pkgs.git

  pkgs.direnv
  pkgs.imagemagick
  pkgs.delta # For tiny-code-action diff backend
  # pkgs.eslint

  # Debug Adapters
  bashdb # Custom build from GitHub with bash 5.3+ support
  pkgs.delve # Go debugger

  # Test Runners (for neotest)
  pkgs.python3Packages.pytest # Python testing
  pkgs.luaPackages.busted # Lua testing
  pkgs.go # Includes go test
  pkgs.cabal-install # Haskell testing (cabal test)
  pkgs.stack # Alternative Haskell testing
  pkgs.bats # Bash Automated Testing System

  # kulala dependencies
  pkgs.curl
  pkgs.jq
  # pkgs.grpcurl
  # pkgs.websocat
  # pkgs.openssl
]
