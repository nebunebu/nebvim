{ inputs }:
[
  inputs.nixneovimplugins.overlays.default
  (final: prev: {
    lib =
      prev.lib
      // (import ./lib.nix {
        inherit inputs;
        pkgs = final;
      });
  })
]
