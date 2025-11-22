{
  projectRootFile = "flake.nix";
  programs = {
    # nix
    nixfmt.enable = true;
    deadnix.enable = true;
    # statix.enable = true;
    # md
    mdformat.enable = true;
    # lua
    stylua.enable = true;
    # json
    jsonfmt.enable = true;
  };

  settings = {
    formatter.deadnix = {
      options = [ "--no-lambda-pattern-names" ];
    };
    formatter.stylua = {
      includes = [ ".luacheckrc" ];
    };
    formatter.mdformat = {
      includes = [ "LICENSE" ];
    };
  };
}
