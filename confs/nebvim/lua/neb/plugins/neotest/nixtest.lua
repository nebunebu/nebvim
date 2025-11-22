---@class neotest.Adapter
local NeotestAdapter = { name = "neotest-nixtest" }

local lib = require("neotest.lib")

---Find the project root directory.
---@param dir string @Directory to treat as cwd
---@return string | nil @Absolute root dir of test suite
function NeotestAdapter.root(dir)
  return lib.files.match_root_pattern("flake.nix", ".git")(dir)
end

---Filter directories when searching for test files
---@param name string Name of directory
---@param rel_path string Path to directory, relative to root
---@param root string Root directory of project
---@return boolean
function NeotestAdapter.filter_dir(name, rel_path, root)
  -- Ignore common directories
  local ignore_dirs = { "node_modules", ".git", ".direnv", "result", "target" }
  for _, ignore in ipairs(ignore_dirs) do
    if name == ignore then
      return false
    end
  end
  return true
end

---@param file_path string
---@return boolean
function NeotestAdapter.is_test_file(file_path)
  -- Match Nix test files (commonly _test.nix or test_*.nix)
  if not vim.endswith(file_path, ".nix") then
    return false
  end

  local file_name = vim.fn.fnamemodify(file_path, ":t")
  return file_name:match("_test%.nix$") ~= nil
    or file_name:match("^test_.*%.nix$") ~= nil
    or file_name:match("%.test%.nix$") ~= nil
end

---Given a file path, parse all the tests within it.
---@param file_path string Absolute file path
---@return neotest.Tree | nil
function NeotestAdapter.discover_positions(file_path)
  local query = [[
    ;; Match test function definitions
    (binding
      attrpath: (attrpath (identifier) @test.name)
      expression: [
        (apply_expression)
        (function_expression)
      ]) @test.definition
  ]]

  return lib.treesitter.parse_positions(file_path, query, {
    nested_tests = true,
    require_namespaces = false,
    position_id = function(position, namespaces)
      -- Create unique test IDs based on file path and test name
      return table.concat(
        vim.tbl_flatten({ file_path, position.name }),
        "::"
      )
    end,
  })
end

---@param args neotest.RunArgs
---@return neotest.RunSpec | nil
function NeotestAdapter.build_spec(args)
  local position = args.tree:data()
  local results_path = vim.fn.tempname() .. ".json"

  local command
  if position.type == "file" then
    -- Run all tests in the file
    command = {
      "nix",
      "eval",
      "--json",
      "--file",
      position.path,
    }
  elseif position.type == "test" then
    -- Run a specific test by evaluating the attribute path
    command = {
      "nix",
      "eval",
      "--json",
      "--file",
      position.path,
      position.name,
    }
  else
    -- Run all tests in directory (run flake checks)
    local root = NeotestAdapter.root(position.path)
    if root and vim.fn.filereadable(root .. "/flake.nix") == 1 then
      command = {
        "nix",
        "flake",
        "check",
        "--json",
        root,
      }
    else
      return nil
    end
  end

  return {
    command = table.concat(command, " "),
    context = {
      results_path = results_path,
      file = position.path,
      position_id = position.id,
    },
  }
end

---@param spec neotest.RunSpec
---@param result neotest.StrategyResult
---@param tree neotest.Tree
---@return table<string, neotest.Result>
function NeotestAdapter.results(spec, result, tree)
  local output_file = spec.context.results_path
  local success, data = pcall(lib.files.read, output_file)

  local results = {}
  local position_id = spec.context.position_id

  if success and data then
    -- Parse Nix evaluation output
    local ok, parsed = pcall(vim.json.decode, data)

    if ok and parsed then
      -- Consider test passed if Nix evaluation succeeded
      results[position_id] = {
        status = "passed",
        output = result.output,
      }
    else
      results[position_id] = {
        status = "failed",
        output = result.output,
        errors = {
          {
            message = "Failed to parse Nix evaluation output",
            line = 0,
          },
        },
      }
    end
  else
    -- If we can't read the output or command failed
    if result.code ~= 0 then
      results[position_id] = {
        status = "failed",
        output = result.output,
        errors = {
          {
            message = "Nix evaluation failed",
            line = 0,
          },
        },
      }
    else
      results[position_id] = {
        status = "skipped",
        output = result.output,
      }
    end
  end

  return results
end

setmetatable(NeotestAdapter, {
  __call = function(_, opts)
    return NeotestAdapter
  end,
})

return NeotestAdapter
