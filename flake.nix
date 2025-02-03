{
  outputs = inputs: {
    packages = builtins.mapAttrs (
      system: _:
      let

        # TODO: REMOVE
        # {{{ FOLD: define pkgs
        pkgs = import inputs.nixpkgs {
          inherit system;
          overlays = [ inputs.tool-suites.overlays.default ];
        };
        # }}}

        # {{{ mkFlakePlugins function
        # Filters through inputs names with the suffix -nvim
        # and makes plugins from those inputs
        # Plugin inputs with names ending in "-nvim" are automatically
        # built.
        mkFlakePlugins =
          map
            (
              plugin:
              pkgs.vimUtils.buildVimPlugin {
                src = inputs.${plugin};
                name = plugin;
              }
            )
            (
              inputs.nixpkgs.lib.filter (inputs.nixpkgs.lib.hasSuffix "-nvim") (
                inputs.nixpkgs.lib.attrNames inputs
              )
            );
      in
      # }}}
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
                mkFlakePlugins
                ++ [ pkgs.vimPlugins.nvim-treesitter.withAllGrammars ]
                ++ builtins.attrValues (import ./plugins.nix { inherit pkgs; });
            };
          }).overrideAttrs
            (old: {
              generatedWrapperArgs =
                let
                  toolSuites = builtins.attrValues {
                    inherit (pkgs.tool-suite)
                      bash
                      json
                      nix
                      md
                      nvim-tools
                      xml
                      yaml
                      ;
                  };
                  toolPath = pkgs.lib.makeBinPath (builtins.concatLists toolSuites);
                in
                (old.generatedWrapperArgs or [ ])
                ++ [
                  "--prefix"
                  "PATH"
                  ":"
                  (builtins.toString (
                    toolPath
                    + ":"
                    + (pkgs.lib.makeBinPath [
                      # NOTE: move to a tool suite
                      pkgs.luajitPackages.magick
                      pkgs.delta
                      pkgs.prettierd
                      pkgs.timg

                      pkgs.fzf

                      pkgs.bashdb
                      pkgs.nodejs
                      pkgs.bash
                      pkgs.bash-completion
                      pkgs.coreutils # For cat, mkfifo
                      pkgs.procps # For pkill

                      pkgs.luajitPackages.busted
                      pkgs.luajitPackages.busted-htest
                      pkgs.stylua
                      pkgs.luajitPackages.luacheck
                      pkgs.lua-language-server
                      # TODO: add lua debugger
                    ])
                  ))
                ];
            });
      }
    ) inputs.nixpkgs.legacyPackages;

    devShells = import ./nix/shell.nix { inherit inputs; };
  };

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixpkgs-unstable";
    tolerable = {
      url = "github:wires-org/tolerable-nvim-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    tool-suites.url = "github:nebunebu/tool-suites";

    # NOTE: Flake Inputs for plugins
    # {{{
    # git-dev-nvim = {
    #   url = "github:moyiz/git-dev.nvim";
    #   flake = false;
    # };
    # global-note-nvim = {
    #   url = "github:backdround/global-note.nvim";
    #   flake = false;
    # };
    # haunt-nvim = {
    #   url = "github:adigitoleo/haunt.nvim";
    #   flake = false;
    # };
    # minty-nvim = {
    #   url = "github:NvChad/minty";
    #   flake = false;
    # };
    # px-to-rem-nvim = {
    #   url = "github:jsongerber/nvim-px-to-rem";
    #   flake = false;
    # };
    # snacks-nvim = {
    #   url = "github:folke/snacks.nvim";
    #   flake = false;
    # };
    # tiny-code-action-nvim = {
    #   url = "github:rachartier/tiny-code-action.nvim";
    #   flake = false;
    # };
    # tiny-devicons-auto-colors-nvim = {
    #   url = "github:rachartier/tiny-devicons-auto-colors.nvim";
    #   flake = false;
    # };
    # volt-nvim = {
    #   url = "github:NvChad/volt";
    #   flake = false;
    # };
    # yamlmatter-nvim = {
    #   url = "github:ray-x/yamlmatter.nvim";
    #   flake = false;
    # };
    #
    # # Telescope Based
    # nerdy-nvim = {
    #   url = "github:2KAbhishek/nerdy.nvim";
    #   flake = false;
    # };
    # taskwarrior-nvim = {
    #   url = "github:ribelo/taskwarrior.nvim";
    #   flake = false;
    # };
    # telescope-emoji-nvim = {
    #   url = "github:xiyaowong/telescope-emoji.nvim";
    #   flake = false;
    # };
    # telescope-git-conflicts-nvim = {
    #   url = "github:Snikimonkd/telescope-git-conflicts.nvim";
    #   flake = false;
    # };
    # telescope-heading-nvim = {
    #   url = "github:crispgm/telescope-heading.nvim";
    #   flake = false;
    # };
    # telescope-repo-nvim = {
    #   url = "github:cljoly/telescope-repo.nvim";
    #   flake = false;
    # };
    # }}}
  };
}
