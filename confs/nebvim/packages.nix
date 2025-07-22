{ pkgs, ... }:
{
  inherit (pkgs.lua54Packages)
    luacheck
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

    # xml
    xmlformat

    # yaml
    yamlfmt
    ;
}
