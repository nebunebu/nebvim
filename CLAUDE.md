# CLAUDE.md - AI Assistant Guide for nebvim

> Comprehensive guide for AI assistants working with the nebvim Neovim configuration

**Last Updated:** 2025-11-18
**Version:** nebvim (Nix Flake-based Neovim Configuration)

---

## Table of Contents

- [Project Overview](#project-overview)
- [Architecture](#architecture)
- [Directory Structure](#directory-structure)
- [Development Workflows](#development-workflows)
- [Plugin Management](#plugin-management)
- [LSP and Language Configuration](#lsp-and-language-configuration)
- [Key Conventions](#key-conventions)
- [Common Tasks](#common-tasks)
- [Testing and Quality Assurance](#testing-and-quality-assurance)
- [Important Files Reference](#important-files-reference)

---

## Project Overview

**nebvim** is a personal, full-featured Neovim IDE configuration built with Nix using the [tolerable-nvim-nix](https://github.com/wires-org/tolerable-nvim-nix) framework. It emphasizes:

- **Reproducibility**: All dependencies managed via Nix
- **Performance**: Lazy loading with lz.n for fast startup
- **Modularity**: Each plugin in separate file with consistent patterns
- **Multi-language Support**: 42+ Treesitter parsers, 6 LSP servers, 15+ formatters
- **Developer Experience**: Debugging, testing, AI integration, rich UI

### Key Statistics

- **Total Plugins:** 90+
- **Configuration Files:** 77 Lua files (~2,500+ LOC)
- **LSP Servers:** 6 (Lua, Nix, TypeScript, Astro, Markdown, QML)
- **Formatters:** 15+ languages
- **Linters:** 8+ languages
- **Treesitter Parsers:** 42
- **Debug Adapters:** 2 (Bash, Lua)

### Flake Outputs

- `default` / `nebvim` - Full-featured IDE configuration
- `manvim` - Minimal MANPAGER configuration
- `devShells` - Development environments
- `checks` - CI/CD validation
- `formatter` - Code formatting (treefmt-nix)

---

## Architecture

### Layer Model

The configuration is organized in distinct layers:

```
┌─────────────────────────────────────────────────────┐
│  Nix Layer (flake.nix, plugins.nix, packages.nix)  │
│  - Plugin sourcing from nixpkgs/overlays/GitHub     │
│  - Runtime dependency management                    │
│  - Build system (tolerable-nvim-nix)                │
└─────────────────────────────────────────────────────┘
                        ↓
┌─────────────────────────────────────────────────────┐
│  Bootstrap Layer (init.lua)                         │
│  - Loads core modules (options, colorscheme, etc.)  │
│  - Initializes lz.n lazy loader                     │
│  - Orchestrates plugin loading                      │
└─────────────────────────────────────────────────────┘
                        ↓
┌─────────────────────────────────────────────────────┐
│  Core Layer (lua/neb/*.lua)                         │
│  - options.lua: Vim settings                        │
│  - colorscheme.lua: Theme configuration             │
│  - autocmd.lua: Autocommands                        │
│  - commands.lua: Custom commands                    │
│  - filetype.lua: Filetype detection                 │
│  - lz.lua: Lazy loading utilities                   │
└─────────────────────────────────────────────────────┘
                        ↓
┌─────────────────────────────────────────────────────┐
│  Plugin Layer (lua/neb/plugins/*.lua)               │
│  - Individual plugin configurations                 │
│  - Organized by feature (lsp/, dap/, snacks/)       │
│  - Lazy loading specifications                      │
└─────────────────────────────────────────────────────┘
                        ↓
┌─────────────────────────────────────────────────────┐
│  Filetype Layer (after/ftplugin/*.lua)              │
│  - Language-specific overrides                      │
│  - Buffer-local settings                            │
└─────────────────────────────────────────────────────┘
```

### Plugin Loading Flow

```
flake.nix
   ↓
plugins.nix (declare plugins, mark as optional)
   ↓
init.lua (define lazy load triggers)
   ↓
lz.n (lazy loader runtime)
   ↓
plugin config files (setup on trigger)
```

### Key Technologies

- **Nix Flakes**: Dependency and package management
- **tolerable-nvim-nix**: Neovim build framework
- **lz.n**: Fast, minimal lazy-loading plugin manager
- **Rose Pine**: Colorscheme
- **blink.cmp**: Modern completion engine
- **Snacks.nvim**: Modular utility plugin suite

---

## Directory Structure

```
/home/user/nebvim/
├── confs/
│   ├── nebvim/                      # Main configuration
│   │   ├── init.lua                 # Entry point, plugin orchestration
│   │   ├── lua/neb/                 # Core Lua modules
│   │   │   ├── autocmd.lua          # Autocommands
│   │   │   ├── colorscheme.lua      # Rose Pine theme
│   │   │   ├── commands.lua         # Custom commands (FloatingMpv)
│   │   │   ├── filetype.lua         # Filetype detection (kulala_http)
│   │   │   ├── lz.lua               # Lazy loading utilities, :LzCheck
│   │   │   ├── options.lua          # Vim options/settings
│   │   │   └── plugins/             # Plugin configurations (66 files)
│   │   │       ├── lsp/             # LSP infrastructure
│   │   │       │   ├── init.lua     # LSP server enablement
│   │   │       │   ├── servers/     # Individual server configs (6 servers)
│   │   │       │   └── ui/          # LSP UI (outline, fidget)
│   │   │       ├── dap/             # Debug adapters (bashdb, lua)
│   │   │       ├── snacks/          # Snacks.nvim modules (15+ features)
│   │   │       ├── tiny/            # Lightweight utilities
│   │   │       └── *.lua            # Individual plugin configs
│   │   ├── after/ftplugin/          # Filetype-specific settings
│   │   │   ├── markdown.lua         # 80 char width, spell check
│   │   │   └── typst.lua            # 59 char width, spell check
│   │   ├── packages.nix             # Runtime dependencies (LSPs, formatters)
│   │   └── plugins.nix              # Plugin declarations (Nix)
│   └── manvim/                      # Minimal MANPAGER config
├── nix/                             # Nix infrastructure
│   ├── lib.nix                      # mkNvimConf, lz.* helpers
│   ├── overlays.nix                 # Nixpkgs overlays
│   ├── shell.nix                    # Development shells
│   ├── checks.nix                   # CI/CD checks
│   └── formatter.nix                # treefmt configuration
├── flake.nix                        # Main flake, package outputs
├── flake.lock                       # Locked dependency versions
├── .luacheckrc                      # Luacheck configuration
├── .luarc.json                      # Lua LSP settings
├── .envrc                           # direnv configuration
└── README.md                        # User documentation
```

---

## Development Workflows

### Adding a New Plugin

#### 1. Declare Plugin in Nix (`confs/nebvim/plugins.nix`)

```nix
# From nixpkgs
lib.lz.fromVimPlugins [
  "plugin-name"
]

# From NixNeovimPlugins overlay
lib.lz.fromExtraVimPlugins [
  "plugin-name"
]

# From GitHub
lib.lz.build {
  pname = "plugin-name";
  version = "2024-01-01";
  src = inputs.plugin-source;
}

# Mark as optional for lazy loading
lib.lz.mkOptional [/* plugin derivations */]
```

#### 2. Create Configuration File (`confs/nebvim/lua/neb/plugins/<plugin-name>.lua`)

```lua
return {
  "plugin-name",           -- Required: matches Nix pname

  -- Lazy loading triggers (choose one or more):
  event = "BufReadPre",    -- On event
  keys = {                 -- On keymap
    { "<leader>x", desc = "Do something" },
  },
  cmd = "CommandName",     -- On command
  ft = "filetype",         -- On filetype

  -- Setup function (required):
  after = function()
    require("plugin-name").setup({
      -- Plugin configuration
    })
  end,
}
```

#### 3. Register in Lazy Loader (`confs/nebvim/init.lua`)

```lua
local lz_plugins = {
  "plugin-name",           -- Add to this list
  -- ... other plugins
}

require("neb.lz").setup(lz_plugins)
```

### Adding Runtime Dependencies

Add to `confs/nebvim/packages.nix`:

```nix
[
  pkgs.tool-name           # LSP, formatter, linter, etc.
]
```

### Adding an LSP Server

#### 1. Add Server Package (`packages.nix`)

```nix
[
  pkgs.language-server-name
]
```

#### 2. Create Server Config (`lua/neb/plugins/lsp/servers/<language>.lua`)

```lua
return {
  "nvim",                  -- Built-in LSP client
  event = "BufReadPre",
  after = function()
    vim.lsp.enable("server_name")

    vim.lsp.config("server_name", {
      cmd = { "server-command" },
      filetypes = { "language" },
      root_markers = { ".git", "config-file" },
      settings = {
        -- Server-specific settings
      },
    })
  end,
}
```

#### 3. Register Server (`lua/neb/plugins/lsp/init.lua`)

Add filename to the list of servers to load.

### Configuring a Formatter

Edit `confs/nebvim/lua/neb/plugins/conform.lua`:

```lua
formatters_by_ft = {
  language = { "formatter-name" },
}
```

Add formatter package to `packages.nix`.

### Configuring a Linter

Edit `confs/nebvim/lua/neb/plugins/nvim-lint.lua`:

```lua
linters_by_ft = {
  language = { "linter-name" },
}
```

Add linter package to `packages.nix`.

### Building and Testing

```bash
# Build the configuration
nix build

# Run without installing
nix run github:nebunebu/nebvim

# Enter development shell
nix develop

# Check plugin load status (inside Neovim)
:LzCheck
```

---

## Plugin Management

### Plugin Sources

1. **nixpkgs (`pkgs.vimPlugins`)**: Standard Nixpkgs plugins
2. **NixNeovimPlugins overlay (`pkgs.vimExtraPlugins`)**: Community plugins
3. **Flake inputs + `lib.lz.build`**: Custom/development plugins

### Lazy Loading Triggers

- `event`: Event name(s) - e.g., `"BufReadPre"`, `"VeryLazy"`
- `keys`: Keybindings - loads on first keypress
- `cmd`: Commands - loads when command executed
- `ft`: Filetypes - loads for specific file types

### Eager-Loaded Plugins

These load immediately (configured in `init.lua` outside `lz_plugins`):

- `nvim-treesitter`: Syntax highlighting
- `blink.cmp`: Completion engine
- `nvim`: Built-in LSP client
- `snacks.nvim`: Core utilities
- `lz.n`: Lazy loader itself

### Plugin Configuration Pattern

**Standard Structure:**

```lua
return {
  "plugin-name",
  event = "BufReadPre",
  after = function()
    require("plugin-name").setup({
      -- config here
    })
  end,
}
```

**With Keybindings:**

```lua
return {
  "plugin-name",
  keys = {
    { "<leader>x", function() require("plugin").action() end, desc = "Action" },
  },
  after = function()
    require("plugin-name").setup({})
  end,
}
```

**With Commands:**

```lua
return {
  "plugin-name",
  cmd = "PluginCommand",
  after = function()
    require("plugin-name").setup({})
  end,
}
```

### Important Plugins

| Plugin | Purpose | Load Trigger | Config Location |
|--------|---------|--------------|-----------------|
| blink.cmp | Completion | Eager | `plugins/blink.lua` |
| nvim-treesitter | Syntax highlighting | Eager | Loaded in init.lua |
| snacks.nvim | Utilities (dashboard, picker, git, etc.) | Eager | `plugins/snacks/` |
| lualine.nvim | Status line | Event | `plugins/lualine.lua` |
| conform.nvim | Formatting | BufWritePre | `plugins/conform.lua` |
| nvim-lint | Linting | BufReadPre, BufWritePost | `plugins/nvim-lint.lua` |
| gitsigns.nvim | Git signs | BufReadPre | `plugins/gitsigns.lua` |
| which-key.nvim | Keybinding hints | VeryLazy | `plugins/which-key.lua` |
| neowiki | Personal wiki | Keys | `plugins/neowiki.lua` |
| rustaceanvim | Rust support | ft=rust | `plugins/rustaceanvim.lua` |
| kulala.nvim | HTTP/REST client | ft=http,rest | `plugins/kulala.lua` |

---

## LSP and Language Configuration

### LSP Architecture

nebvim uses **Neovim's built-in LSP client** (no lspconfig plugin).

- Server enablement: `vim.lsp.enable("server_name")`
- Configuration: `vim.lsp.config("server_name", { ... })`
- Server configs: `lua/neb/plugins/lsp/servers/<language>.lua`

### Configured LSP Servers

| Language | Server | Config File | Root Markers |
|----------|--------|-------------|--------------|
| Lua | lua-language-server | `lsp/servers/luals.lua` | `.luarc.json`, `.git` |
| Nix | nixd | `lsp/servers/nixd.lua` | `.git`, `flake.nix` |
| TypeScript/JavaScript | ts_ls | `lsp/servers/typescript.lua` | `tsconfig.json`, `package.json` |
| Astro | astro-ls | `lsp/servers/astro.lua` | `astro.config.*` |
| Markdown | marksman | `lsp/servers/marksman.lua` | `.git` |
| QML | qmlls | `lsp/servers/qmlls.lua` | `.git` |

### LSP UI Enhancements

- **Fidget** (`lsp/ui/fidget.lua`): LSP progress notifications
- **Outline** (`lsp/ui/outline.lua`): Code outline/symbols viewer
- **Inline Diagnostic** (`tiny/inline-diagnostic.lua`): Better diagnostic display
- **Inlay Hints**: Enabled with custom highlight group

### Completion (blink.cmp)

**Sources (priority order):**
2. lsp (Language server)
3. buffer (Current buffer)
4. path (File paths)

**Key Bindings:**
- `<Tab>`: Select next / snippet forward
- `<S-Tab>`: Select previous / snippet backward
- `<CR>`: Accept completion
- `<C-d>`: Show/hide documentation
- `<C-e>`: Hide completion
- `<C-b>/<C-f>`: Scroll documentation

### Formatters (conform.nvim)

Auto-format on save enabled. Configured formatters:

- **CSS/SCSS**: prettierd
- **HTML**: htmlbeautifier
- **HTTP**: kulala-fmt
- **JavaScript/TypeScript/JSON**: prettierd, fixjson
- **Lua**: stylua
- **Markdown**: markdownlint
- **Nix**: nixfmt
- **Python**: black
- **Rust**: rustfmt
- **Shell**: shfmt
- **TeX**: tex-fmt
- **XML**: xmlformat
- **YAML**: yamlfmt

### Linters (nvim-lint)

Auto-lint on save. Configured linters:

- **Bash**: shellcheck
- **CSS/SCSS**: stylelint
- **JavaScript/TypeScript**: eslint
- **Lua**: luacheck
- **Markdown**: markdownlint-cli2
- **Nix**: deadnix, statix
- **Python**: pylint
- **TeX**: chktex

### Treesitter Parsers

42 parsers installed, including:
- Languages: bash, css, html, javascript, json, lua, markdown, nix, python, rust, typescript, yaml, etc.
- Special: kulala_http (custom HTTP request syntax)

### Debug Adapters (DAP)

- **Bash**: bashdb
- **Lua**: one-small-step-for-vimkind (OSV)

DAP UI with `nvim-dap-ui` plugin.

---

## Key Conventions

### File Naming

- **Plugin configs**: `lua/neb/plugins/<plugin-name>.lua`
- **LSP servers**: `lua/neb/plugins/lsp/servers/<language>.lua`
- **DAP adapters**: `lua/neb/plugins/dap/<adapter>.lua`
- **Snacks modules**: `lua/neb/plugins/snacks/<feature>.lua`
- **Filetype configs**: `after/ftplugin/<filetype>.lua`

### Module Organization

- **Core modules**: `lua/neb/` (options, colorscheme, autocmd, commands, filetype, lz)
- **Plugin configs**: `lua/neb/plugins/` (one file per plugin)
- **Feature subdirectories**: `lsp/`, `dap/`, `snacks/`, `tiny/`

### Leader Keys

- `<leader>` = **Space**
- `<localleader>` = **Comma**

### Keybinding Groups

Major keybinding prefixes (configured in `which-key.lua`):

| Prefix | Purpose | Example |
|--------|---------|---------|
| `<leader>f` | Find/Pickers | `<leader>ff` - Find files |
| `<leader>d` | Debug (DAP) / Direnv | `<leader>dc` - Continue debugging |
| `<leader>x` | Diagnostics | `<leader>xl` - Diagnostics to loclist |
| `<leader>m` | Markdown | `<leader>mv` - Toggle Markview |
| `<leader>n` | Testing (nvim-test) | `<leader>nn` - Test nearest |
| `<leader>w` | Wiki | `<leader>ww` - Open wiki |
| `<leader>R` | HTTP/REST (kulala) | `<leader>Rr` - Run request |
| `<leader>q` | Quickfix | `<leader>qt` - Todo comments |
| `<leader>lg` | Lazygit | Open lazygit |
| `<leader>t` | Triptych (file browser) | Toggle file browser |

### Color Scheme

**Theme**: Rose Pine
**Variants**: Main, Moon, Dawn
**Location**: `lua/neb/colorscheme.lua`

Custom highlights defined for:
- LSP inlay hints
- Rainbow delimiters
- Custom color mappings

### Code Style

**Lua:**
- Linter: luacheck (`.luacheckrc`)
- Formatter: stylua
- Globals allowed: `vim`, `require`, `pairs`, `ipairs`, `string`, `table`

**Nix:**
- Formatter: nixfmt
- Linters: deadnix, statix

---

## Common Tasks

### Check Plugin Load Status

```vim
:LzCheck
```

Shows table of all plugins and whether they're loaded.

### Add Custom Keybinding

Edit `lua/neb/plugins/which-key.lua`:

```lua
{
  { "<leader>x", function() print("Hello") end, desc = "My action" },
}
```

### Add Custom Command

Edit `lua/neb/commands.lua`:

```lua
vim.api.nvim_create_user_command("MyCommand", function()
  print("Command executed")
end, {})
```

### Add Autocommand

Edit `lua/neb/autocmd.lua`:

```lua
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.lua",
  callback = function()
    print("Saving Lua file")
  end,
})
```

### Add Filetype Detection

Edit `lua/neb/filetype.lua`:

```lua
vim.filetype.add({
  extension = {
    myext = "myfiletype",
  },
})
```

### Configure Filetype-Specific Settings

Create `after/ftplugin/<filetype>.lua`:

```lua
-- after/ftplugin/python.lua
vim.opt_local.textwidth = 88
vim.opt_local.colorcolumn = "88"
```

### Add Treesitter Parser

Edit `confs/nebvim/init.lua`:

```lua
require("nvim-treesitter.configs").setup({
  ensure_installed = {
    "lua", "nix", "rust", "newlang",  -- Add here
  },
})
```

Add parser to `packages.nix` if not in nixpkgs.

### Debug Lazy Loading Issues

1. Run `:LzCheck` to see plugin status
2. Check `lua/neb/lz.lua` for loaded plugin list
3. Verify plugin name matches Nix `pname`
4. Check `init.lua` for plugin in `lz_plugins` list
5. Test trigger (event, key, command, filetype)

---

## Testing and Quality Assurance

### Testing Framework

**Plugin**: nvim-test
**Location**: `lua/neb/plugins/nvim-test.lua`

**Supported test runners:**
- JavaScript/TypeScript: jest
- Lua: busted
- Python: pytest
- Rust: cargo-test
- Go: go-test
- Ruby: rspec
- C#: dotnet
- Haskell: hspec

**Keybindings:**
- `<leader>ne` - Edit test
- `<leader>ni` - Test info
- `<leader>nl` - Run last test
- `<leader>nn` - Run nearest test
- `<leader>ns` - Run test suite
- `<leader>nv` - Visit test

### Linting (Lua)

**Tool**: luacheck
**Config**: `.luacheckrc`

```bash
# In development shell
luacheck confs/nebvim/lua/
```

### Formatting

**Tool**: treefmt-nix
**Usage**:

```bash
nix fmt
```

Formats all files according to language-specific rules.

### Nix Checks

```bash
nix flake check
```

Runs CI/CD validation checks.

---

## Important Files Reference

### Critical Configuration Files

| File | Purpose | When to Edit |
|------|---------|--------------|
| `flake.nix` | Package outputs, system config | Changing flake inputs/outputs |
| `confs/nebvim/plugins.nix` | Plugin declarations (Nix) | Adding/removing plugins |
| `confs/nebvim/packages.nix` | Runtime dependencies | Adding LSPs/formatters/tools |
| `confs/nebvim/init.lua` | Bootstrap, plugin orchestration | Changing load order, eager plugins |
| `lua/neb/lz.lua` | Lazy loading utilities | Debugging lazy loading |
| `lua/neb/options.lua` | Vim options/settings | Changing editor behavior |
| `lua/neb/colorscheme.lua` | Theme configuration | Changing colors |
| `lua/neb/plugins/which-key.lua` | Keybinding definitions | Adding/modifying keybindings |
| `lua/neb/plugins/lsp/init.lua` | LSP server enablement | Activating LSP servers |
| `lua/neb/plugins/conform.lua` | Formatter configuration | Adding formatters |
| `lua/neb/plugins/nvim-lint.lua` | Linter configuration | Adding linters |

### Nix Infrastructure

| File | Purpose |
|------|---------|
| `nix/lib.nix` | `mkNvimConf`, `lz.*` helper functions |
| `nix/overlays.nix` | Nixpkgs overlays (NixNeovimPlugins) |
| `nix/shell.nix` | Development shell definitions |
| `nix/checks.nix` | CI/CD check definitions |
| `nix/formatter.nix` | treefmt configuration |

### Configuration Standards

- **Nix files**: Use `nixfmt` formatting
- **Lua files**: Use `stylua` formatting
- **Line width**: 80-100 characters (context-dependent)
- **Indentation**: 2 spaces (Lua, Nix)
- **Quotes**: Prefer double quotes in Lua

---

## AI Assistant Guidelines

When working with this codebase:

1. **Always check existing patterns** before creating new files
2. **Follow the plugin configuration template** for consistency
3. **Use lazy loading** for new plugins unless eager loading is required
4. **Add runtime dependencies** to `packages.nix`, not shell.nix
5. **Test with `:LzCheck`** after adding plugins
6. **Document keybindings** in which-key.lua
7. **Keep plugin configs modular** - one file per plugin
8. **Respect the layer architecture** - don't mix concerns
9. **Use Nix for dependency management** - avoid manual downloads
10. **Follow naming conventions** - plugin file names match pname

### When Adding Features

1. Check if existing plugin provides functionality
2. Search for similar configurations in `lua/neb/plugins/`
3. Follow the three-step workflow: Nix declaration → Lua config → init.lua registration
4. Add necessary packages to `packages.nix`
5. Test in isolation before committing
6. Update this CLAUDE.md if introducing new patterns

### When Debugging

1. Run `:LzCheck` to verify plugin load status
2. Check `:messages` for errors
3. Verify plugin name matches between Nix and Lua
4. Test trigger conditions (event, key, cmd, ft)
5. Check dependencies in `packages.nix`
6. Use `:Inspect` to check syntax highlighting
7. Use `:LspInfo` to check LSP status

### Performance Considerations

- Prefer lazy loading over eager loading
- Use specific events (e.g., `BufReadPre` not `BufEnter`)
- Avoid heavy computations in setup functions
- Use `after` callback for plugin initialization
- Profile with `:Lazy profile` if available

---

## Additional Resources

- **tolerable-nvim-nix**: https://github.com/wires-org/tolerable-nvim-nix
- **lz.n documentation**: Plugin lazy loading specs
- **Neovim LSP**: `:help lsp`
- **NixOS Wiki**: https://nixos.wiki/wiki/Neovim

---

**For questions or issues**, refer to:
- This CLAUDE.md file
- README.md for user documentation
- Individual plugin config files for examples
- Nix flake outputs for build system details

**Last updated**: 2025-11-18 by AI assistant analyzing nebvim repository
