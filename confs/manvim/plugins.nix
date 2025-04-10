{ pkgs, ... }:

{
  inherit (pkgs.vimPlugins)
    rose-pine
    lualine-nvim
    vim-tmux-navigator
    ;
}
