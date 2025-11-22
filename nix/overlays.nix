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

    # Patch bashdb to work with bash 5.3+
    # The configure script has a hard-coded version check that rejects bash != 5.0
    bashdb = prev.bashdb.overrideAttrs (old: {
      postPatch = (old.postPatch or "") + ''
        # Patch the configure script to accept any bash 5.x version
        substituteInPlace configure \
          --replace-fail 'This package is only known to work with Bash 5.0' \
                         'This package works with Bash 5.x versions'

        # Remove the exit 1 on version mismatch to make it a warning instead of error
        sed -i '/as_fn_error.*This package is only known to work/d' configure
      '';
    });
  })
]
