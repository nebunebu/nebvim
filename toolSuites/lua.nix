{ pkgs, ... }:
{
  inherit (pkgs) lua-language-server stylua;
  inherit (pkgs.luajitPackages) luacheck;
}
