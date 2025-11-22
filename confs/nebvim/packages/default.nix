{ pkgs, ... }:
(import ./linters.nix { inherit pkgs; })
++ (import ./formatters.nix { inherit pkgs; })
# ++ (import ./lang-servers.nix { inherit pkgs; })
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

  # kulala dependencies
  pkgs.curl
  pkgs.jq
  # pkgs.grpcurl
  # pkgs.websocat
  # pkgs.openssl
]
