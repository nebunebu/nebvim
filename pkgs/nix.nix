{ pkgs, ... }:
{

  inherit (pkgs)
    nixd
    deadnix
    statix
    nixfmt-rfc-style
    # nixpkgs-fmt
    ;
}
