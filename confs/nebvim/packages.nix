{ pkgs, ... }:
{

  inherit (pkgs.lua54Packages)
    luacheck
    ;

  inherit (pkgs)
    direnv
    imagemagick

    # lua
    stylua
    lua-language-server

    # nix
    nixd
    statix
    deadnix
    nixfmt-rfc-style

    # markdown
    marksman
    markdownlint-cli2

    # typst
    ;
}
