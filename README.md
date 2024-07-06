# nebvim

My personal neovim config using [tolerable](https://github.com/wires-org/tolerable-nvim-nix).

## Usage

To use without installing,

```sh
nix run github:nebunebu/nebvim#neovim
```

## Installation

Add nebvim to your flake inputs.

```nix
 inputs = {
    nebvim.url = "github:nebunebu/nebvim";
 };
```

To add as a system package,

```nix
{ inputs, pkgs, ...}:

{
  enviornment.systemPackages = [ inputs.nebvim.packages."${pkgs.system}".neovim ];
}
```

And to add as a home-manager package,

```nix
{ inputs, pkgs, ...}:

{
  home.packages = [ inputs.nebvim.packages."${pkgs.system}".neovim ];
}
```

## Contributing

If you see any issues, or have any feedback or suggestions, feel free to submit and issue
or make a pull request.

## Special Thanks

- [wires-org/tolerable-nvim-nix](https://github.com/wires-org/tolerable-nvim-nix)
- [mrshmllow/nvim-candy](https://github.com/mrshmllow/nvim-candy)
