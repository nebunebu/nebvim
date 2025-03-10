{ pkgs, ... }:

{
  inherit (pkgs.vimPlugins)
    rose-pine
    vim-tmux-navigator
    ;
}
