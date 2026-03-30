{ lib, pkgs, ... }:
[
  (lib.lz.build rec {
    pname = "neowiki-nvim";
    version = "1.0";
    src = pkgs.fetchFromGitHub {
      owner = "echaya";
      repo = "neowiki.nvim";
      rev = "v${version}";
      hash = "sha256-PXJhaX9pqIgDWZZbzK8z9SstW0kQ9SuB5IMPq7EjYic=";
    };
  })
  (lib.lz.build {
    pname = "snipbrowzurr-nvim";
    version = "stable-2024-10-16";
    src = pkgs.fetchFromGitHub {
      owner = "blaze-d83";
      repo = "snipbrowzurr.nvim";
      rev = "b32aa902a8b9fd2adf0b11215b9a1523baba4526";
      hash = "sha256-aDd2bpnWYEOvgpKn+wn0tdf9jM8mVyAOwE0q2sH85Cw=";
    };
  })
  (lib.lz.build {
    pname = "line-numbers-nvim";
    version = "2026-03-30";
    src = pkgs.fetchFromGitHub {
      owner = "shrynx";
      repo = "line-numbers.nvim";
      rev = "2b4e1ddf00c11bee26cb790e64c53223d38f5597";
      hash = "sha256-cktt0sBQ0BcXicIPoGLyQrwcwhsrZ2k3NA1TxbOqkVk=";
    };
  })
]
