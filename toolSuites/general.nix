{ pkgs, ... }:
{
  inherit (pkgs)
    ripgrep
    # manix
    direnv
    curl
    imagemagick
    ;
  inherit (pkgs.luajitPackages) magick;

}
