{ pkgs, ... }:
{
  inherit (pkgs.lua54Packages)
    luacheck
    ;

  inherit (pkgs.kdePackages)
    qtdeclarative
    ;

  inherit (pkgs)
    direnv
    imagemagick
    # eslint

    # Shell
    shellcheck # linter
    shfmt

    # Json
    fixjson

    # LaTeX
    tex-fmt
    # texlivePackages.chktex

    # Lua
    lua-language-server
    stylua

    # markdown
    markdownlint-cli2
    marksman

    # nix
    deadnix
    nixd
    nixfmt-rfc-style
    statix

    # typst

    # kulala-fmt
    curl
    jq
    # grpcurl
    # websocat
    # openssl
    # prettierd
    # libxml2

    # xml
    xmlformat

    # yaml
    yamlfmt
    ;
}
