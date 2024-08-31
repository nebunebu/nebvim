{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixpkgs-unstable";
    tolerable = {
      url = "github:wires-org/tolerable-nvim-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    tool-suites.url = "github:nebunebu/tool-suites";

    # PLUGINS
    journal-nvim = { url = "github:jakobkhansen/journal.nvim"; flake = false; };
    tiny-code-action-nvim = { url = "github:rachartier/tiny-code-action.nvim"; flake = false; };
    tiny-devicons-auto-colors-nvim = { url = "github:rachartier/tiny-devicons-auto-colors.nvim"; flake = false; };
    markdown-toc = { url = "github:ChuufMaster/markdown-toc"; flake = false; };
    nerdy-nvim = { url = "github:2KAbhishek/nerdy.nvim"; flake = false; };
    telescope-emoji-nvim = { url = "github:xiyaowong/telescope-emoji.nvim"; flake = false; };
    easypick-nvim = { url = "github:axkirillov/easypick.nvim"; flake = false; };
    telescope-git-conflicts-nvim = { url = "github:Snikimonkd/telescope-git-conflicts.nvim"; flake = false; };
  };

  outputs = inputs: {
    packages = builtins.mapAttrs
      (system: _:
        let
          pkgs = import inputs.nixpkgs {
            inherit system;
            overlays = [ inputs.tool-suites.overlays.default ];
          };
          mkFlakePlugins = map
            (plugin: pkgs.vimUtils.buildVimPlugin {
              src = inputs.${plugin};
              name = plugin;
            }) [
            "journal-nvim"
            "markdown-toc"
            "nerdy-nvim"
            "telescope-emoji-nvim"
            "easypick-nvim"
            "telescope-git-conflicts-nvim"
            "tiny-code-action-nvim"
            "tiny-devicons-auto-colors-nvim"
          ];
        in
        {
          default =
            (inputs.tolerable.makeNeovimConfig "nebvim" {
              inherit pkgs;
              src = pkgs.lib.fileset.toSource {
                root = ./.;
                fileset = ./nebvim;
              };
              config = {
                plugins = mkFlakePlugins
                  ++ [ pkgs.vimPlugins.nvim-treesitter.withAllGrammars ]
                  ++ builtins.attrValues (import ./plugins.nix { inherit pkgs; });
              };
            }).overrideAttrs
              (old: {
                generatedWrapperArgs = (old.generatedWrapperArgs or [ ]) ++ [
                  "--prefix"
                  "PATH"
                  ":"
                  (builtins.toString
                    (pkgs.lib.makeBinPath (
                      pkgs.tool-suite.bash
                        ++ pkgs.tool-suite.json
                        ++ pkgs.tool-suite.nix
                        ++ pkgs.tool-suite.md
                        ++ pkgs.tool-suite.nvim-tools
                        ++ pkgs.tool-suite.xml
                        ++ pkgs.tool-suite.yaml
                    )))
                ];
              });
        }
      )
      inputs.nixpkgs.legacyPackages;

    devShells = builtins.mapAttrs
      (
        system: _:
          let
            pkgs = import inputs.nixpkgs {
              inherit system;
              overlays = [ inputs.tool-suites.overlays.default ];
            };
          in
          {
            default = pkgs.mkShell {
              name = "testShell";
              packages = [
                pkgs.tool-suite.lua
              ];
            };
          }
      )
      inputs.nixpkgs.legacyPackages;
  };
}
