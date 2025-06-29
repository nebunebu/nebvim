{ inputs, ... }:
inputs.nixpkgs.legacyPackages
|> builtins.mapAttrs (
  _system: pkgs:
  let
    eval = inputs.treefmt-nix.lib.evalModule pkgs {
      imports = [ ./treefmt.nix ];
    };
  in
  {
    formatting = eval.config.build.check ../.;
  }
)
