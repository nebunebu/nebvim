{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixpkgs-unstable";
    tolerable = {
      url = "github:wires-org/tolerable-nvim-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    tool-suites.url = "github:nebunebu/tool-suites";

    # PLUGINS
    helpview = { url = "github:OXY2DEV/helpview.nvim"; flake = false; }; # NOTE: pr
    journal-nvim = { url = "github:jakobkhansen/journal.nvim"; flake = false; };
    tiny-code-action-nvim = { url = "github:rachartier/tiny-code-action.nvim"; flake = false; };
    cellular-automaton = { url = "github:Eandrju/cellular-automaton.nvim"; flake = false; }; #NOTE: pr
    tiny-devicons-auto-colors-nvim = { url = "github:rachartier/tiny-devicons-auto-colors.nvim"; flake = false; };
    markdown-toc = { url = "github:ChuufMaster/markdown-toc"; flake = false; };
    nerdy-nvim = { url = "github:2KAbhishek/nerdy.nvim"; flake = false; };
    telescope-emoji-nvim = { url = "github:xiyaowong/telescope-emoji.nvim"; flake = false; };
    easypick-nvim = { url = "github:axkirillov/easypick.nvim"; flake = false; };
    telescope-git-conflicts-nvim = { url = "github:Snikimonkd/telescope-git-conflicts.nvim"; flake = false; };
  };

  outputs =
    inputs:
    let
      forAllSystems = inputs.nixpkgs.lib.genAttrs [
        "x86_64-linux"
        "x86_64-darwin"
        "aarch64-linux"
        "aarch64-darwin"
      ];
    in
    {
      packages = forAllSystems (
        system:
        let
          pkgs = inputs.nixpkgs.legacyPackages.${system};
          mkFlakePlugins = map
            (plugin: pkgs.vimUtils.buildVimPlugin {
              src = inputs.${plugin};
              name = plugin;
            }) [
            "cellular-automaton"
            "journal-nvim"
            "markdown-toc"
            "helpview"
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

                  # (toString
                  #   (pkgs.lib.makeBinPath (
                  #     (inputs.tool-suites.lib.${system}.bash pkgs).use
                  #       ++ (inputs.tool-suites.lib.${system}.json pkgs).use
                  #       ++ (inputs.tool-suites.lib.${system}.nix pkgs).use
                  #       ++ (inputs.tool-suites.lib.${system}.xml pkgs).use
                  #       ++ (inputs.tool-suites.lib.${system}.yaml pkgs).use
                  #   )))
                ];
              });
        }
      );

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
                  pkgs.tool-suite.nix
                ];
              };
            }
        )
        inputs.nixpkgs.legacyPackages;
    };
}
