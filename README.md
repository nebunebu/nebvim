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

## Configurations

This flake provides two Neovim configurations:

-   **`nebvim` (default)**: A full-featured Neovim IDE, complete with plugins for development, debugging, and more.
-   **`manvim`**: A minimal configuration designed to be used as a `MANPAGER`, providing a clean and efficient way to read man pages.

### Plugin Management

The file `confs/${conf}/plugins.nix` serves as the primary plugin manager for each configuration. You can add plugins from three main sources:

-   **`pkgs.vimPlugins`**: The standard Nixpkgs repository for Vim plugins.
-   **`pkgs.vimExtraPlugins`**: An overlay providing additional community plugins.
-   **Flakes**: You can build plugins directly from flake inputs using the `lib.lz.build` helper.

The `plugins.nix` file contains examples of each method.


### Runtime Dependencies

Any runtime dependencies required by your plugins (e.g., external commands, libraries) should be added to `confs/nebvim/packages.nix`.

### Nix Functions

This configuration exposes the following functions under `pkgs.lib`:

- `mkNvimConf`: Takes a configuration name (e.g., "nebvim", "manvim") and builds a complete Neovim configuration using `tolerable`. It sources plugins and packages from the corresponding directory under `confs/`.

#### `lib.lz`

A set of helpers for making plugins compatible with the `lz.n` lazy-loader.

- `lz.fromVimPlugins`: Takes a list of plugin names and returns a list of derivations from `pkgs.vimPlugins`.
- `lz.fromExtraVimPlugins`: Takes a list of plugin names and returns a list of derivations from `pkgs.vimExtraPlugins`.
- `lz.build`: A simple wrapper around `pkgs.vimUtils.buildVimPlugin`.
- `lz.mkOptional`: Takes a list of plugin derivations and returns an attrset where each plugin is marked as optional.


### Commands

- `:LzCheck`: Prints a list of all configured plugins and their current load status ("Loaded" or "Not Loaded"). This is useful for debugging the lazy-loader.


## Contributing

If you see any issues, or have any feedback or suggestions, feel free to submit
an issue or make a pull request.

## Special Thanks

- [wires-org/tolerable-nvim-nix](https://github.com/wires-org/tolerable-nvim-nix)
- [mrshmllow/nvim-candy](https://github.com/mrshmllow/nvim-candy)
- All the plugin authors and contributors who make this configuration possible
