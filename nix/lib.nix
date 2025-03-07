{ inputs, pkgs, ... }:
{
  mkNvimConf =
    conf:
    (inputs.tolerable.makeNeovimConfig "${conf}" {
      inherit pkgs;
      src = pkgs.lib.fileset.toSource {
        root = ../confs;
        fileset = ../confs/${conf};
      };
      config = {
        plugins = builtins.attrValues (import ../confs/${conf}/plugins.nix { inherit pkgs; });
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

  # mkLazyLoadable = pluginName: {
  #   ${pluginName} = pkgs.vimPlugins.${pluginName}.overrideAttrs (_: {
  #     optional = true;
  #   });
  # };
  #
  # mkLazyLoadables =
  #   plugins: builtins.foldl' (acc: plugin: acc // (mkLazyLoadable plugin)) { } plugins;
}
