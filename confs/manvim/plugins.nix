{ pkgs, ... }:

{
  inherit (pkgs.vimPlugins)
    rose-pine
    lualine-nvim
    ;
}
