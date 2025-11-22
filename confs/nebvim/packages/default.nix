{ pkgs, ... }:
(import ./linters.nix { inherit pkgs; })
# ++ (import ./formatters.nix { inherit pkgs; })
# ++ (import ./lang-servers.nix { inherit pkgs; })
++ [
  # pkgs.ast-grep # for grug-far

  pkgs.kdePackages.qtdeclarative

  pkgs.direnv
  pkgs.imagemagick
  # pkgs.eslint

  # Shell
  pkgs.shfmt

  # LaTeX
  pkgs.tex-fmt

  # Lua
  pkgs.lua-language-server
  pkgs.stylua

  # markdown
  pkgs.marksman

  # nix
  pkgs.nixd
  pkgs.nixfmt-rfc-style

  # typst

  # kulala-fmt
  pkgs.curl
  pkgs.jq
  # pkgs.grpcurl
  # pkgs.websocat
  # pkgs.openssl
  # pkgs.prettierd
  # pkgs.libxml2

  # xml
  pkgs.xmlformat

  # yaml
  pkgs.yamlfmt
]
