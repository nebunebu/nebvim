{ pkgs }:
let
  # Fetch the patch from nixpkgs
  bash-5-or-greater-patch = pkgs.fetchurl {
    url = "https://raw.githubusercontent.com/NixOS/nixpkgs/nixos-unstable/pkgs/by-name/ba/bashdb/bash-5-or-greater.patch";
    hash = "sha256-zRc4as4CVXT/fuejf0BOCVP8wMjYdY0Frb27qYT1GOk=";
  };
in
pkgs.stdenv.mkDerivation {
  pname = "bashdb";
  version = "5.2-1.1.2-unstable-2025-06-07";

  src = pkgs.fetchFromGitHub {
    owner = "Trepan-Debuggers";
    repo = "bashdb";
    rev = "7d0f9751e04fa54f48f0ab4be32ecb8030a4315d";
    sha256 = "sha256-fwxmlFC66Lv+zD632s9a44I9IEQ/82caKnQ44pdVes4=";
  };

  patches = [ bash-5-or-greater-patch ];

  nativeBuildInputs = with pkgs; [
    autoreconfHook
    texinfo
    perl
  ];

  buildInputs = [
    (pkgs.python3.withPackages (ps: [ ps.pygments ]))
  ];

  configureFlags = [
    "--with-dbg-main=${placeholder "out"}/share/bashdb/bashdb-main.inc"
  ];

  meta = with pkgs.lib; {
    homepage = "https://bashdb.sourceforge.net/";
    description = "A gdb-like debugger for bash";
    longDescription = ''
      The Bash Debugger Project is a source-code debugger for bash
      that follows the gdb command syntax.
    '';
    license = licenses.gpl2Plus;
    mainProgram = "bashdb";
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
