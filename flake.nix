{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixpkgs-unstable";
    tolerable = {
      url = "github:wires-org/tolerable-nvim-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    dev-environments.url = "github:nebunebu/dev-enviornments";


    # PLUGINS
    # NOTE: made pr
    tiny-inline-diagnostic-nvim = {
      url = "github:rachartier/tiny-inline-diagnostic.nvim";
      flake = false;
    };

    # NOTE: made pr
    helpview = {
      url = "github:OXY2DEV/helpview.nvim";
      flake = false;
    };

    markview = {
      url = "github:OXY2DEV/markview.nvim";
      flake = false;
    };

    tiny-code-action-nvim = {
      url = "github:rachartier/tiny-code-action.nvim";
      flake = false;
    };

    detour-nvim = {
      url = "github:carbon-steel/detour.nvim";
      flake = false;
    };

    cellular-automaton = {
      url = "github:Eandrju/cellular-automaton.nvim";
      flake = false;
    };

    tiny-devicons-auto-colors-nvim = {
      url = "github:rachartier/tiny-devicons-auto-colors.nvim";
      flake = false;
    };

    flow-nvim = {
      url = "github:0xstepit/flow.nvim";
      flake = false;
    };

    markdown-toc = {
      url = "github:ChuufMaster/markdown-toc";
      flake = false;
    };

    # NOTE: made pr
    fortune = {
      url = "github:rubiin/fortune.nvim";
      flake = false;
    };

    # NOTE: made pr
    img-clip = {
      url = "github:HakonHarnes/img-clip.nvim";
      flake = false;
    };

    nerdy-nvim = {
      url = "github:2KAbhishek/nerdy.nvim";
      flake = false;
    };

    telescope-emoji-nvim = {
      url = "github:xiyaowong/telescope-emoji.nvim";
      flake = false;
    };

    easypick-nvim = {
      url = "github:axkirillov/easypick.nvim";
      flake = false;
    };

    telescope-git-conflicts-nvim = {
      url = "github:Snikimonkd/telescope-git-conflicts.nvim";
      flake = false;
    };
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
                plugins =
                  let
                    flakePlugins = [
                      (pkgs.vimUtils.buildVimPlugin {
                        src = inputs.cellular-automaton;
                        name = "cellular-automaton";
                      })
                      (pkgs.vimUtils.buildVimPlugin {
                        src = inputs.markview;
                        name = "markview";
                      })
                      (pkgs.vimUtils.buildVimPlugin {
                        src = inputs.detour-nvim;
                        name = "detour";
                      })
                      (pkgs.vimUtils.buildVimPlugin {
                        src = inputs.markdown-toc;
                        name = "markdown-toc";
                      })
                      (pkgs.vimUtils.buildVimPlugin {
                        src = inputs.flow-nvim;
                        name = "flow-nvim";
                      })
                      (pkgs.vimUtils.buildVimPlugin {
                        src = inputs.fortune;
                        name = "fortune";
                      })
                      (pkgs.vimUtils.buildVimPlugin {
                        src = inputs.helpview;
                        name = "helpview";
                      })
                      (pkgs.vimUtils.buildVimPlugin {
                        src = inputs.img-clip;
                        name = "img-clip";
                      })
                      (pkgs.vimUtils.buildVimPlugin {
                        src = inputs.nerdy-nvim;
                        name = "nerdy-nvim";
                      })
                      (pkgs.vimUtils.buildVimPlugin {
                        src = inputs.telescope-emoji-nvim;
                        name = "telescope-emoji-nvim";
                      })
                      (pkgs.vimUtils.buildVimPlugin {
                        src = inputs.easypick-nvim;
                        name = "easypick-nvim";
                      })
                      (pkgs.vimUtils.buildVimPlugin {
                        src = inputs.telescope-git-conflicts-nvim;
                        name = "telescope-git-conflicts-nvim";
                      })
                      (pkgs.vimUtils.buildVimPlugin {
                        src = inputs.tiny-inline-diagnostic-nvim;
                        name = "tiny-inline-diagnostic-nvim";
                      })
                      (pkgs.vimUtils.buildVimPlugin {
                        src = inputs.tiny-code-action-nvim;
                        name = "tiny-code-action-nvim";
                      })
                      (pkgs.vimUtils.buildVimPlugin {
                        src = inputs.tiny-devicons-auto-colors-nvim;
                        name = "tiny-devicons-auto-colors-nvim";
                      })
                    ];
                  in
                  flakePlugins
                  ++ [ pkgs.vimPlugins.nvim-treesitter.withAllGrammars ]
                  ++ builtins.attrValues (import ./plugins.nix { inherit pkgs; });
              };
            }).overrideAttrs
              (old: {
                generatedWrapperArgs = (old.generatedWrapperArgs or [ ]) ++ [
                  "--prefix"
                  "PATH"
                  ":"
                  # (pkgs.lib.makeBinPath [
                  # (inputs.dev-environments.lib.${system}.bash pkgs).use
                  # (inputs.dev-environments.lib.${system}.json pkgs).use
                  # (inputs.dev-environments.lib.${system}.markdown pkgs).use
                  # (inputs.dev-environments.lib.${system}.nix pkgs).use
                  # (inputs.dev-environments.lib.${system}.yaml pkgs).use
                  # ])
                  (pkgs.lib.makeBinPath (
                    let
                      useToolSuite = filePath: builtins.attrValues (import filePath { inherit pkgs; });
                    in
                    useToolSuite ./toolSuites/bash.nix
                      ++ useToolSuite ./toolSuites/general.nix
                      ++ useToolSuite ./toolSuites/markdown.nix
                      ++ useToolSuite ./toolSuites/nix.nix
                      ++ useToolSuite ./toolSuites/serializedData.nix
                  ))
                ];
              });
        }
      );

      devShells = forAllSystems (
        system:
        let
          pkgs = inputs.nixpkgs.legacyPackages.${system};
        in
        {
          default = pkgs.mkShell {
            name = "nebvim";
            packages = [
              (inputs.dev-environments.lib.${system}.lua pkgs).use
            ];
          };
        }
      );
    };
}
