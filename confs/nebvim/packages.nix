{ pkgs, ... }:
{

  inherit (pkgs.luajitPackages)
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
    ;
}
