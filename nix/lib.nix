{ inputs, pkgs, ... }:
rec {
  mkNvimConf =
    conf:
    (inputs.tolerable.makeNeovimConfig "${conf}" {
      inherit pkgs;
      src = pkgs.lib.fileset.toSource {
        root = ../confs;
        fileset = ../confs/${conf};
      };
      config = {
        plugins = builtins.attrValues (
          import ../confs/${conf}/plugins.nix {
            inherit pkgs;
            inherit (pkgs) lib;
          }
        );
      };
    }).overrideAttrs
      (old: {
        generatedWrapperArgs = (old.generatedWrapperArgs or [ ]) ++ [
          "--prefix"
          "PATH"
          ":"
          (builtins.toString (
            # NOTE: Packages
            ":"
            + pkgs.lib.makeBinPath (
              builtins.attrValues (import ../confs/${conf}/packages.nix { inherit pkgs; })
            )
          ))
        ];
      });

  # A set of helpers for making plugins compatible with the lz.n lazy-loader.
  lz =
    let
      mkOptionalPlugin =
        plugin:
        let
          # NOTE: `lib.getName` will get the `pname` attr from a derivation
          pluginName = pkgs.lib.getName plugin;
        in
        {
          ${pluginName} = plugin.overrideAttrs (_: {
            optional = true;
          });
        };
    in
    rec {
      # Takes a list of plugin derivations and returns an attrset
      # where each plugin is marked as optional.
      mkOptional = plugins: builtins.foldl' (acc: plugin: acc // (mkOptionalPlugin plugin)) { } plugins;

      # Takes a list of plugin names and returns a list of derivations
      # from `pkgs.vimPlugins`.
      fromVimPlugins = pluginNames: builtins.map (pluginName: pkgs.vimPlugins.${pluginName}) pluginNames;

      # Takes a list of plugin names and returns a list of derivations
      # from `pkgs.vimExtraPlugins`.
      fromExtraVimPlugins =
        pluginNames: builtins.map (pluginName: pkgs.vimExtraPlugins.${pluginName}) pluginNames;

      # A simple wrapper around `pkgs.vimUtils.buildVimPlugin`.
      build = args: pkgs.vimUtils.buildVimPlugin args;
    };
}
