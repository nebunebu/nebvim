{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixpkgs-unstable";

    tolerable = {
      url = "github:wires-org/tolerable-nvim-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    treefmt-nix = {
      url = "github:numtide/treefmt-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs: {
    devShells = import ./nix/shell.nix { inherit inputs; };
    checks = import ./nix/checks.nix { inherit inputs; };
    formatter = import ./nix/formatter.nix { inherit inputs; };
    packages =
      inputs.nixpkgs.legacyPackages
      |> builtins.mapAttrs (
        system: _:
        let
          pkgs = inputs.nixpkgs.legacyPackages.${system};
          mkNvimConf = (import ./nix/lib.nix { inherit inputs pkgs; }).mkNvimConf;
          configuredManvim = (mkNvimConf "manvim");
        in
        {
          default = (mkNvimConf "nebvim");
          nebvim = (mkNvimConf "nebvim");
          # manvim = (mkNvimConf "manvim");
          manvim = pkgs.runCommand "manvim" { } ''
            mkdir -p $out/bin
            ln -s "${configuredManvim}/bin/nvim" "$out/bin/manvim"
          '';
          testvim = (mkNvimConf "testvim");
        }
      );
  };
}
