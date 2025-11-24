{ pkgs, ... }:

pkgs.stdenv.mkDerivation {
  pname = "kulala_http-grammar";
  version = "5.3.3";
  src = pkgs.fetchFromGitHub {
    owner = "mistweaverco";
    repo = "kulala.nvim";
    rev = "902fc21e8a3fee7ccace37784879327baa6d1ece";
    hash = "sha256-whQpwZMEvD62lgCrnNryrEvfSwLJJ+IqVCywTq78Vf8=";
  };

  buildInputs = [ pkgs.tree-sitter ];

  buildPhase = ''
    cd lua/tree-sitter
    HOME=$(pwd) ${pkgs.tree-sitter}/bin/tree-sitter build -o kulala_http.so
  '';

  installPhase = ''
    mkdir -p $out/parser
    mv kulala_http.so $out/parser/
  '';
}
