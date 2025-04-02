{ pkgs, ... }:
{
  inherit (pkgs)
    # lua
    stylua
    # nix
    # bash
    imagemagick

    ;
}
#   #   toolSuites = builtins.attrValues {
#   #     inherit (pkgs.tool-suite)
#   #       bash
#   #       json
#   #       nix
#   #       md
#   #       nvim-tools
#   #       xml
#   #       yaml
#   #       ;
#   # NOTE: move to a tool suite
#   pkgs.luajitPackages.magick
#   pkgs.delta
#   pkgs.prettierd
#   pkgs.timg
#   pkgs.tinymist
#
#   pkgs.fzf
#
#   pkgs.bashdb
#   pkgs.nodejs
#   pkgs.bash
#   pkgs.bash-completion
#   pkgs.coreutils # For cat, mkfifo
#   pkgs.procps # For pkill
#
#   pkgs.luajitPackages.busted
#   pkgs.luajitPackages.busted-htest
#   pkgs.stylua
#   pkgs.luajitPackages.luacheck
#   pkgs.lua-language-server
#   # TODO: add lua debugger
