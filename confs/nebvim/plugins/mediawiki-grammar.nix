{ pkgs, ... }:

pkgs.stdenv.mkDerivation {
  pname = "mediawiki-grammar";
  version = "1340c1b";
  src = pkgs.fetchFromGitHub {
    owner = "Ordoviz";
    repo = "tree-sitter-mediawiki";
    rev = "1340c1bf8a0379b49318ab237fd43aa3cffcad5b";
    hash = "sha256-NNng2ZkeNFf7oHfv5DIH1l/gkvjZuOvuArrYOhHLwJ0=";
  };
  buildInputs = [ pkgs.tree-sitter ];
  buildPhase = ''
    HOME=$(pwd) ${pkgs.tree-sitter}/bin/tree-sitter build -o mediawiki.so
  '';
  installPhase = ''
    mkdir -p $out/parser
    mv mediawiki.so $out/parser/
  '';
}
