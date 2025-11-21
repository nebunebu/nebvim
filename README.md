# nebvim

> A full-featured, reproducible Neovim IDE configuration built with Nix

[![Built with Nix](https://img.shields.io/badge/Built_With-Nix-5277C3.svg?logo=nixos&labelColor=73C3D5)](https://nixos.org)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)

**nebvim** is a personal Neovim configuration that emphasizes reproducibility,
performance, and developer experience. Built on [tolerable-nvim-nix](https://github.com/wires-org/tolerable-nvim-nix),
it provides a complete IDE experience with zero manual installation required.

---

## ✨ Features

### 🚀 Performance & Reliability
- **Fast Startup**: Lazy loading with [lz.n](https://github.com/nvim-neorocks/lz.n) - plugins load only when needed
- **Fully Reproducible**: All dependencies managed via Nix flakes
- **Zero Configuration**: Works out-of-the-box, no manual plugin installation

### 🛠️ Developer Tools
- **LSP Support**: 6 language servers (Lua, Nix, TypeScript, Astro, Markdown, QML)
- **Auto-formatting**: 15+ formatters with format-on-save
- **Linting**: 8+ linters with real-time feedback
- **Debugging**: DAP integration for Bash and Lua
- **Testing**: Built-in test runner for multiple languages
- **Git Integration**: Lazygit, gitsigns, and advanced git workflows

### 🎨 Rich UI
- **Theme**: Rose Pine (Main, Moon, Dawn variants)
- **Modern Completion**: blink.cmp with LSP, buffer, and AI sources
- **Status Line**: Customized lualine with git and LSP info
- **File Navigation**: Fuzzy finder (Snacks.picker), file tree (Triptych)
- **Dashboard**: Beautiful startup screen with recent files and shortcuts

### 🧩 Language Support
- **Syntax Highlighting**: 42 Treesitter parsers
- **Languages**: Rust, Python, TypeScript, Lua, Nix, Go, C/C++, and more
- **Specialized**: HTTP/REST client (kulala), Markdown rendering, Typst support

### 🤖 AI Integration
- **Avante.nvim**: Claude AI assistant for code generation and chat
- **AI Completions**: Integrated into completion engine

### 📦 Total: 90+ Plugins
All curated, configured, and ready to use.

---

## 📋 Table of Contents

- [Quick Start](#quick-start)
- [Installation](#installation)
- [Configurations](#configurations)
- [Key Bindings](#key-bindings)
- [Language Support](#language-support)
- [Development](#development)
- [Customization](#customization)
- [Troubleshooting](#troubleshooting)
- [Contributing](#contributing)
- [Special Thanks](#special-thanks)

---

## ⚡ Quick Start

### Try Without Installing

```bash
nix run github:nebunebu/nebvim
```

This launches nebvim with all dependencies in an isolated environment.

### Basic Usage

Once launched:

1. **Open files**: `<Space>ff` (find files) or `<Space>fr` (recent files)
2. **File browser**: `<Space>t` (toggle Triptych)
3. **Find text**: `<Space>fg` (grep in project)
4. **Git**: `<Space>lg` (launch Lazygit)
5. **Help**: `<Space>?` (which-key guide)

---

## 📥 Installation

### NixOS System Package

Add to your flake inputs:

```nix
{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nebvim.url = "github:nebunebu/nebvim";
  };
}
```

Then add to your system configuration:

```nix
{ inputs, pkgs, ... }:

{
  environment.systemPackages = [
    inputs.nebvim.packages."${pkgs.system}".default
  ];
}
```

### Home Manager

```nix
{ inputs, pkgs, ... }:

{
  home.packages = [
    inputs.nebvim.packages."${pkgs.system}".default
  ];
}
```

### Standalone Installation

```bash
# Clone the repository
git clone https://github.com/nebunebu/nebvim.git
cd nebvim

# Build and run
nix build
./result/bin/nvim
```

---

## ⚙️ Configurations

This flake provides two Neovim configurations:

### `nebvim` (default)

Full-featured IDE with:
- 90+ plugins
- LSP, DAP, linting, formatting
- Git integration
- AI assistance
- Testing framework
- Rich UI components

**Usage:**
```bash
nix run github:nebunebu/nebvim
# or
nix run github:nebunebu/nebvim#nebvim
```

### `manvim`

Minimal configuration optimized for reading man pages:
- Clean, distraction-free interface
- Optimized for text reading
- Fast startup
- Perfect for `MANPAGER`

**Usage:**
```bash
nix run github:nebunebu/nebvim#manvim
```

**Set as MANPAGER:**
```bash
export MANPAGER='nvim +Man!'
# or use manvim directly
export MANPAGER="$(nix build github:nebunebu/nebvim#manvim --print-out-paths)/bin/nvim +Man!"
```

---

## ⌨️ Key Bindings

Leader key: `<Space>` | Local leader: `,`

### Essential Shortcuts

| Key | Action | Description |
|-----|--------|-------------|
| `<Space>?` | Which Key | Show all keybindings |
| `<Space>ff` | Find Files | Fuzzy file finder |
| `<Space>fg` | Find Grep | Search in project |
| `<Space>fr` | Find Recent | Recent files |
| `<Space>fb` | Find Buffers | Open buffers |
| `<Space>t` | Triptych | Toggle file browser |
| `<Space>lg` | LazyGit | Git interface |

### File Operations

| Key | Action |
|-----|--------|
| `<Space>fs` | Save file |
| `<Space>fq` | Quit |
| `<Space>fw` | Save and quit |

### LSP (Language Server)

| Key | Action |
|-----|--------|
| `gd` | Go to definition |
| `gr` | Find references |
| `gi` | Go to implementation |
| `K` | Hover documentation |
| `<Space>ca` | Code actions |
| `<Space>rn` | Rename symbol |
| `<Space>f` | Format buffer |

### Diagnostics

| Key | Action |
|-----|--------|
| `<Space>xl` | Diagnostics to location list |
| `]d` | Next diagnostic |
| `[d` | Previous diagnostic |
| `<Space>e` | Show line diagnostics |

### Git

| Key | Action |
|-----|--------|
| `<Space>lg` | Open Lazygit |
| `<Space>gh` | Preview hunk |
| `<Space>gd` | Diff this |
| `]h` | Next hunk |
| `[h` | Previous hunk |

### Debugging (DAP)

| Key | Action |
|-----|--------|
| `<Space>dc` | Continue |
| `<Space>db` | Toggle breakpoint |
| `<Space>dso` | Step over |
| `<Space>dsi` | Step into |
| `<Space>dr` | REPL |

### Testing

| Key | Action |
|-----|--------|
| `<Space>nn` | Test nearest |
| `<Space>ns` | Test suite |
| `<Space>nl` | Run last test |
| `<Space>nv` | Visit test |

### HTTP/REST (Kulala)

| Key | Action |
|-----|--------|
| `<Space>Rr` | Run request |
| `<Space>Ri` | Inspect request |
| `<Space>Rt` | Toggle view |

### Wiki (Neowiki)

| Key | Action |
|-----|--------|
| `<Space>ww` | Open wiki |
| `<Space>wi` | Index |

### AI Assistant (Avante)

| Key | Action |
|-----|--------|
| `<Space>aa` | Ask AI |
| `<Space>ae` | Edit selection |
| `<Space>ar` | Refresh |

### Markdown

| Key | Action |
|-----|--------|
| `<Space>mp` | Preview |
| `<Space>mv` | Toggle Markview |

> **Tip**: Press `<Space>?` in Neovim to see all available keybindings with descriptions!

---

## 🌐 Language Support

### LSP Servers

| Language | Server | Features |
|----------|--------|----------|
| Lua | lua-language-server | Completion, diagnostics, workspace support |
| Nix | nixd | Flake-aware, option completion |
| TypeScript/JavaScript | ts_ls | Full TS/JS support |
| Astro | astro-ls | Astro framework support |
| Markdown | marksman | Wiki links, references |
| QML | qmlls | Qt Quick support |

### Formatters

- **CSS/SCSS**: prettierd
- **HTML**: htmlbeautifier
- **JavaScript/TypeScript**: prettierd
- **JSON**: fixjson
- **Lua**: stylua
- **Markdown**: markdownlint
- **Nix**: nixfmt
- **Python**: black
- **Rust**: rustfmt
- **Shell**: shfmt
- **YAML**: yamlfmt
- **XML**: xmlformat

### Linters

- **Bash**: shellcheck
- **CSS**: stylelint
- **JavaScript/TypeScript**: eslint
- **Lua**: luacheck
- **Markdown**: markdownlint-cli2
- **Nix**: deadnix, statix
- **Python**: pylint
- **TeX**: chktex

### Syntax Highlighting (Treesitter)

42 parsers including: bash, c, cpp, css, go, html, javascript, json, lua,
markdown, nix, python, rust, toml, typescript, yaml, and more.

### Debug Adapters

- **Bash**: bashdb
- **Lua**: OSV (one-small-step-for-vimkind)

---

## 🔧 Development

### Development Shell

Enter a development environment with all tools:

```bash
nix develop
```

This provides:
- Lua language server
- Formatters and linters
- Development utilities

### Check Configuration

```bash
# Run all checks
nix flake check

# Format code
nix fmt

# Build configuration
nix build
```

### Plugin Status

Inside Neovim:

```vim
:LzCheck
```

Shows all plugins and their load status. Useful for debugging lazy loading.

### Project Structure

```
nebvim/
├── confs/
│   ├── nebvim/          # Main configuration
│   │   ├── init.lua     # Entry point
│   │   ├── lua/neb/     # Core modules
│   │   │   └── plugins/ # Plugin configs
│   │   ├── packages.nix # Runtime dependencies
│   │   └── plugins.nix  # Plugin declarations
│   └── manvim/          # Minimal config
├── nix/                 # Nix infrastructure
├── flake.nix           # Flake definition
└── CLAUDE.md           # Developer documentation
```

---

## 🎨 Customization

### Fork and Modify

1. **Fork this repository**
2. **Clone your fork**:
   ```bash
   git clone https://github.com/YOUR-USERNAME/nebvim.git
   cd nebvim
   ```

3. **Modify configuration**:
   - **Add plugins**: Edit `confs/nebvim/plugins.nix` and create config in `lua/neb/plugins/`
   - **Add keybindings**: Edit `lua/neb/plugins/which-key.lua`
   - **Change options**: Edit `lua/neb/options.lua`
   - **Add LSP servers**: Create file in `lua/neb/plugins/lsp/servers/`
   - **Add dependencies**: Edit `confs/nebvim/packages.nix`

4. **Test changes**:
   ```bash
   nix run .
   ```

5. **Use your fork**:
   ```nix
   inputs.nebvim.url = "github:YOUR-USERNAME/nebvim";
   ```

### Common Customizations

#### Add a Plugin

1. **Declare in `plugins.nix`**:
   ```nix
   lib.lz.fromVimPlugins [ "plugin-name" ]
   ```

2. **Configure in `lua/neb/plugins/plugin-name.lua`**:
   ```lua
   return {
     "plugin-name",
     event = "BufReadPre",
     after = function()
       require("plugin-name").setup({})
     end,
   }
   ```

3. **Register in `init.lua`**:
   ```lua
   local lz_plugins = {
     "plugin-name",
     -- ... other plugins
   }
   ```

#### Change Colorscheme

Edit `lua/neb/colorscheme.lua`:
```lua
vim.cmd("colorscheme rose-pine-moon")  -- or rose-pine, rose-pine-dawn
```

#### Add Custom Keybinding

Edit `lua/neb/plugins/which-key.lua`:
```lua
{
  { "<leader>x", function() print("Hello!") end, desc = "Say hello" },
}
```

---

## 🐛 Troubleshooting

### Plugin Not Loading

1. Check plugin status: `:LzCheck`
2. Verify plugin name matches between `plugins.nix` (pname) and config file
3. Check trigger condition (event, key, command, filetype)
4. View messages: `:messages`

### LSP Not Working

1. Check LSP status: `:LspInfo`
2. Verify server package in `packages.nix`
3. Check server config in `lua/neb/plugins/lsp/servers/`
4. Ensure server is enabled in `lua/neb/plugins/lsp/init.lua`

### Formatter Not Working

1. Verify formatter in `packages.nix`
2. Check `lua/neb/plugins/conform.lua` for language mapping
3. Test manually: `<Space>f` or `:ConformInfo`

### Build Errors

1. Update flake: `nix flake update`
2. Clean build: `nix build --rebuild`
3. Check Nix version: `nix --version` (requires Nix ≥ 2.4)

### Performance Issues

1. Check startup time: `nvim --startuptime startup.log`
2. Review eager-loaded plugins in `init.lua`
3. Consider switching plugins to lazy loading

---

## 🤝 Contributing

Contributions are welcome! Whether it's:
- 🐛 Bug reports
- 💡 Feature suggestions
- 📝 Documentation improvements
- 🔧 Code contributions

### How to Contribute

1. **Open an issue** to discuss changes
2. **Fork the repository**
3. **Create a feature branch**: `git checkout -b feature/my-feature`
4. **Make your changes**
5. **Test thoroughly**: `nix flake check && nix build`
6. **Submit a pull request**

### Development Guidelines

- Follow existing code style (Lua: stylua, Nix: nixfmt)
- Keep plugin configs modular (one file per plugin)
- Add runtime dependencies to `packages.nix`
- Update documentation when adding features
- Test with `:LzCheck` after plugin changes

For detailed development documentation, see [CLAUDE.md](CLAUDE.md).

---

## 📚 Documentation

- **[CLAUDE.md](CLAUDE.md)**: Comprehensive developer guide for AI assistants and contributors
- **[tolerable-nvim-nix](https://github.com/wires-org/tolerable-nvim-nix)**: Build framework documentation
- **[lz.n](https://github.com/nvim-neorocks/lz.n)**: Lazy loading plugin manager

---

## 🙏 Special Thanks

- **[wires-org/tolerable-nvim-nix](https://github.com/wires-org/tolerable-nvim-nix)** - Build framework
- **[mrshmllow/nvim-candy](https://github.com/mrshmllow/nvim-candy)** - Inspiration
- **[folke](https://github.com/folke)** - Many excellent plugins (Snacks.nvim, which-key, etc.)
- **[Rose Pine](https://rosepinetheme.com/)** - Beautiful colorscheme
- **All plugin authors and contributors** who make this configuration possible

---

## 📄 License

MIT License - see [LICENSE](LICENSE) file for details.

---

## 💬 Support

- **Issues**: [GitHub Issues](https://github.com/nebunebu/nebvim/issues)
- **Discussions**: [GitHub Discussions](https://github.com/nebunebu/nebvim/discussions)

---

**Built with ❤️ and Nix**

> Note: This is a personal configuration shared publicly. While it works well for me,
> you may want to fork and customize it to fit your workflow.
