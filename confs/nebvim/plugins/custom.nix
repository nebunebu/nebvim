{ lib, pkgs, ... }:
[
  (lib.lz.build {
    pname = "neowiki-nvim";
    version = "unstable-2025-06-27";
    src = pkgs.fetchFromGitHub {
      owner = "echaya";
      repo = "neowiki.nvim";
      rev = "411766d31c76dc2613fca6ec45d025bac7ee1ac4";
      hash = "sha256-soMQN7oDx9HVS/crNcu6ilYoOtGXP/aMk7NfPYUjsXg=";
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
]
