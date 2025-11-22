{ pkgs, ... }:
let
  importPackageFile = file: import file { inherit pkgs; };
  packageFiles = [
    ./linters.nix
    ./formatters.nix
    # ./lang-servers.nix
  ];
in
pkgs.lib.flatten (map importPackageFile packageFiles)
++ [
  # pkgs.ast-grep # for grug-far

  pkgs.kdePackages.qtdeclarative

  pkgs.direnv
  pkgs.imagemagick
  # pkgs.eslint

  # Language Servers
  pkgs.lua-language-server
  pkgs.marksman
  pkgs.nixd

  # Debug Adapters
  pkgs.bashdb # Bash debugger - incompatible with Bash 5.3+
  pkgs.delve # Go debugger

  # kulala dependencies
  pkgs.curl
  pkgs.jq
  # pkgs.grpcurl
  # pkgs.websocat
  # pkgs.openssl
]
