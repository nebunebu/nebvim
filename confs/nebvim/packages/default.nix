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
  # Bash debugger - patched to work with Bash 5.x+
  # Uses nixpkgs patch approach: patches configure.ac source and regenerates configure
  (pkgs.bashdb.overrideAttrs (old: {
    patches = (old.patches or [ ]) ++ [
      (pkgs.fetchpatch {
        url = "https://raw.githubusercontent.com/NixOS/nixpkgs/refs/heads/nixos-unstable/pkgs/by-name/ba/bashdb/bash-5-or-greater.patch";
        hash = "sha256-LJjl+UkNSGQFGMu+6ROu5r7HzrENnw87KVcGiZxkN+Y=";
      })
    ];
    nativeBuildInputs = (old.nativeBuildInputs or [ ]) ++ [ pkgs.autoreconfHook ];
  }))
  pkgs.delve # Go debugger

  # kulala dependencies
  pkgs.curl
  pkgs.jq
  # pkgs.grpcurl
  # pkgs.websocat
  # pkgs.openssl
]
