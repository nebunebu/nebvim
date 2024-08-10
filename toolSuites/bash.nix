{ pkgs, ... }:
{
  # bashPackages = builtins.attrValues {
  inherit (pkgs.nodePackages)
    bash-language-server# bashls
    ;
  inherit (pkgs)
    shellcheck# shellcheck
    shfmt# shfmt
    ;
}
