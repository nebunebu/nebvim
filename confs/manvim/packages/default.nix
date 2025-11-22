{ pkgs, ... }:
let
  importPackageFile = file: import file { inherit pkgs; };
  packageFiles = [
    # Add package files here as needed
  ];
in
pkgs.lib.flatten (map importPackageFile packageFiles)
++ [ ]
