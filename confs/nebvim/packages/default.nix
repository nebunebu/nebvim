{ pkgs, ... }:
{

  imports = [
    ./linters.nix
    # ./formatters.nix
    # ./lang-servers.nix
  ];

  # pkgs.ast-grep # for grug-far

  inherit (pkgs.kdePackages)
    qtdeclarative
    ;

  inherit (pkgs)
    direnv
    imagemagick
    # eslint

    # Shell
    shfmt

    # LaTeX
    tex-fmt
    # texlivePackages.chktex

    # Lua
    lua-language-server
    stylua

    # markdown
    marksman

    # nix
    nixd
    nixfmt-rfc-style
    # statix

    # typst

    # kulala-fmt
    curl
    jq
    # grpcurl
    # websocat
    # openssl
    # prettierd
    # libxml2

    # xml
    xmlformat

    # yaml
    yamlfmt
    ;
}
