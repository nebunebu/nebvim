# Neotest Configuration

Comprehensive test runner setup for nebvim using [neotest](https://github.com/nvim-neotest/neotest).

## Overview

Neotest provides a modern, extensible testing framework for Neovim with rich UI, DAP integration, and support for multiple languages through adapters.

## Installed Adapters

### Officially Supported Languages

1. **Python** - `neotest-python`
   - Runner: pytest
   - Features: DAP debugging, pytest discovery, parametrized tests
   - Test files: `test_*.py`, `*_test.py`

2. **Lua (Plenary)** - `neotest-plenary`
   - Runner: plenary.nvim test harness
   - Ideal for Neovim plugin development
   - Test files: `*_spec.lua`

3. **Lua (Busted)** - `neotest-busted`
   - Runner: busted
   - Full-featured Lua testing framework
   - Test files: `*_spec.lua`

4. **Go** - `neotest-go`
   - Runner: go test
   - Features: table tests, subtests, benchmarks
   - Test files: `*_test.go`

5. **Haskell** - `neotest-haskell`
   - Runners: cabal test, stack test
   - Test files: Spec.hs, `*Spec.hs`

6. **Bash** - `neotest-bash`
   - Runners: bats, custom bash test scripts
   - Test files: `*_test.sh`, `*.bats`

### Vim-Test Integration

**neotest-vim-test** provides fallback support for languages not natively supported by neotest adapters:
- JavaScript/TypeScript (jest)
- Ruby (rspec)
- Rust (cargo test)
- C# (dotnet)
- And many more...

See `nvim-test.lua:28-39` for configured vim-test runners.

### Custom Adapter Example

**nixtest** (`neotest/nixtest.lua`) - Example custom adapter showing how to create a provider for frameworks not in neotest or vim-test.

Features:
- Nix expression testing
- Flake check integration
- Test discovery using Treesitter
- JSON output parsing

Use this as a template for creating your own adapters.

## Key Bindings

All bindings use the `<leader>t` prefix (Space + t by default):

| Key | Action | Description |
|-----|--------|-------------|
| `<leader>tr` | Run nearest test | Execute test under cursor |
| `<leader>tf` | Run file | Run all tests in current file |
| `<leader>ts` | Run suite | Run all tests in project |
| `<leader>tl` | Run last | Re-run last test |
| `<leader>td` | Debug test | Debug nearest test with DAP |
| `<leader>ta` | Attach | Attach to running test |
| `<leader>to` | Show output | Open test output window |
| `<leader>tO` | Toggle output panel | Toggle persistent output panel |
| `<leader>tS` | Toggle summary | Toggle test summary sidebar |
| `<leader>tx` | Stop test | Stop running test |
| `<leader>tw` | Toggle watch | Toggle watch mode |

## Summary Window Mappings

When in the summary window (`<leader>tS`):

| Key | Action |
|-----|--------|
| `<CR>` / Double-click | Expand/collapse test |
| `r` | Run test |
| `d` | Debug test |
| `o` | Show output |
| `m` | Mark test |
| `R` | Run marked tests |
| `a` | Attach to test |
| `w` | Watch test |
| `e` | Expand all |
| `J` | Next failed test |
| `K` | Previous failed test |
| `t` | Set target |
| `u` | Stop test |

## Configuration

The main configuration is in `neotest/init.lua` with the following features:

### Adapter Configuration

Each adapter can be customized:

```lua
require("neotest-python")({
  dap = { justMyCode = false },
  args = { "--log-level", "DEBUG" },
  runner = "pytest",
})
```

### Output Settings

- **Auto-open**: Short output shown automatically on test failure
- **Panel**: Persistent output panel at bottom (15 lines)
- **Floating**: Focused output in floating window

### Icons and Highlights

Custom icons for test states:
- ✓ Passed
- ✖ Failed
- ↓ Skipped
- ⟳ Running
- 👁 Watching

### Watch Mode

Automatically re-runs tests when dependencies change. Uses Treesitter queries to track:
- Imports/requires
- Function calls
- Module dependencies

## Integration with nvim-test

Both neotest and nvim-test are configured and can be used together:

- **nvim-test**: Use `<leader>n` prefix (Space + n)
  - Simpler, terminal-based output
  - Good for quick test runs

- **neotest**: Use `<leader>t` prefix (Space + t)
  - Rich UI with status, output panel, summary
  - Better for debugging and exploring test failures

Choose based on your workflow preference.

## Runtime Dependencies

Test runners are provided via Nix in `packages/default.nix`:

```nix
# Test Runners (for neotest)
pkgs.python3Packages.pytest # Python testing
pkgs.luaPackages.busted     # Lua testing
pkgs.go                     # Includes go test
pkgs.cabal-install          # Haskell testing
pkgs.stack                  # Alternative Haskell testing
pkgs.bats                   # Bash Automated Testing System
```

## Example Usage

### Running Tests

1. Open a test file (e.g., `test_example.py`)
2. Place cursor on a test function
3. Press `<leader>tr` to run that specific test
4. Press `<leader>tO` to see detailed output

### Debugging Tests

1. Set breakpoints in your test or source code
2. Navigate to test
3. Press `<leader>td` to start DAP debugging session
4. Use standard DAP controls to step through

### Test Summary

1. Press `<leader>tS` to open test summary
2. Navigate the tree to find failed tests
3. Press `o` on a failed test to see output
4. Press `r` to re-run just that test

### Watch Mode

1. Start working on a test file
2. Press `<leader>tw` to enable watch mode
3. Tests automatically re-run when you save changes to dependencies

## Custom Adapter Development

See `neotest/nixtest.lua` for a complete example adapter implementation.

Required methods:
- `root(dir)` - Find project root
- `filter_dir(name, rel_path, root)` - Filter directories during search
- `is_test_file(file_path)` - Determine if file contains tests
- `discover_positions(file_path)` - Parse tests using Treesitter
- `build_spec(args)` - Build command to run tests
- `results(spec, result, tree)` - Parse test output into results

## Troubleshooting

### Tests not discovered

1. Check test file naming matches adapter patterns
2. Verify test runner is in PATH (`:!which pytest`)
3. Check `:messages` for adapter errors
4. Ensure project root is detected correctly

### Debug mode not working

1. Verify DAP adapter is configured for your language
2. Check debug adapter is in PATH
3. Ensure test framework supports debugging

### Output not showing

1. Try `<leader>to` to open output explicitly
2. Check `:Neotest output` command
3. Look in `:messages` for errors

## See Also

- [neotest documentation](https://github.com/nvim-neotest/neotest)
- [nvim-test configuration](../nvim-test.lua)
- [DAP configuration](../dap/)
- Individual adapter documentation on GitHub
