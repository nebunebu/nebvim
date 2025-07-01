# nebvim

My personal neovim config using [tolerable](https://github.com/wires-org/tolerable-nvim-nix).

> [!CAUTION]
> This is a work in progress and is under constant development.
> This README does not necessarily reflect the current state of the
> configuration.

## CONTENTS

- [Usage](#usage)
- [Gallery](#gallery)
- [Installation](#installation)
- [Configuration](#configuration)
- [Contributing](#contributing)
- [Special Thanks](#special-thanks)

## Usage

To use without installing,

```sh
nix run github:nebunebu/nebvim
```

## Gallery

### Greeter

![Greeter](https://imgur.com/4ztr5CR.png)

<!-- ### Markdown Rendering -->

<!---->

<!-- ![Md](.assets/mdrendering.gif) -->

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
  enviornment.systemPackages =
    [ inputs.nebvim.packages."${pkgs.system}".default ];
}
```

And to add as a home-manager package,

```nix
{ inputs, pkgs, ...}:

{
  home.packages = [ inputs.nebvim.packages."${pkgs.system}".default ];
}
```

## Configuration

> [!NOTE]
> Coming Soon

### Nix Functions

This configuration exposes the following functions under `pkgs.lib`:

- `mkNvimConf`: Takes a configuration name (e.g., "nebvim", "manvim") and builds a complete Neovim configuration using `tolerable`. It sources plugins and packages from the corresponding directory under `confs/`.

#### `lib.lz`

A set of helpers for making plugins compatible with the `lz.n` lazy-loader.

- `lz.fromVimPlugins`: Takes a list of plugin names and returns a list of derivations from `pkgs.vimPlugins`.
- `lz.fromExtraVimPlugins`: Takes a list of plugin names and returns a list of derivations from `pkgs.vimExtraPlugins`.
- `lz.build`: A simple wrapper around `pkgs.vimUtils.buildVimPlugin`.
- `lz.mkOptional`: Takes a list of plugin derivations and returns an attrset where each plugin is marked as optional.

## Contributing

If you see any issues, or have any feedback or suggestions, feel free to submit
an issue or make a pull request.

### Commands

- `:LzCheck`: Prints a list of all configured plugins and their current load status ("Loaded" or "Not Loaded"). This is useful for debugging the lazy-loader.

## Special Thanks

- [wires-org/tolerable-nvim-nix](https://github.com/wires-org/tolerable-nvim-nix)
- [mrshmllow/nvim-candy](https://github.com/mrshmllow/nvim-candy)
- All the plugin authors and contributors who make this configuration possible
