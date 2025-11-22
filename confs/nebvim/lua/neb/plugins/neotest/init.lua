return {
  "neotest",
  keys = {
    { "<leader>t", group = "neotest" },
    {
      "<leader>tr",
      function()
        require("neotest").run.run()
      end,
      desc = "Run nearest test",
    },
    {
      "<leader>tf",
      function()
        require("neotest").run.run(vim.fn.expand("%"))
      end,
      desc = "Run current file",
    },
    {
      "<leader>ts",
      function()
        require("neotest").run.run(vim.fn.getcwd())
      end,
      desc = "Run all tests",
    },
    {
      "<leader>tl",
      function()
        require("neotest").run.run_last()
      end,
      desc = "Run last test",
    },
    {
      "<leader>td",
      function()
        require("neotest").run.run({ strategy = "dap" })
      end,
      desc = "Debug nearest test",
    },
    {
      "<leader>ta",
      function()
        require("neotest").run.attach()
      end,
      desc = "Attach to nearest test",
    },
    {
      "<leader>to",
      function()
        require("neotest").output.open({ enter = true })
      end,
      desc = "Show output",
    },
    {
      "<leader>tO",
      function()
        require("neotest").output_panel.toggle()
      end,
      desc = "Toggle output panel",
    },
    {
      "<leader>tS",
      function()
        require("neotest").summary.toggle()
      end,
      desc = "Toggle summary",
    },
    {
      "<leader>tx",
      function()
        require("neotest").run.stop()
      end,
      desc = "Stop nearest test",
    },
    {
      "<leader>tw",
      function()
        require("neotest").watch.toggle()
      end,
      desc = "Toggle watch",
    },
  },
  after = function()
    require("neotest").setup({
      adapters = {
        -- Python (pytest)
        require("neotest-python")({
          dap = { justMyCode = false },
          args = { "--log-level", "DEBUG" },
          runner = "pytest",
        }),
        -- Lua (plenary)
        require("neotest-plenary"),
        -- Lua (busted)
        require("neotest-busted"),
        -- Go
        require("neotest-go")({
          experimental = {
            test_table = true,
          },
          args = { "-count=1", "-timeout=60s" },
        }),
        -- Haskell
        require("neotest-haskell"),
        -- Bash
        require("neotest-bash")({
          -- Custom bash test file detection
          is_test_file = function(file_path)
            return file_path:match("_test%.sh$") ~= nil or file_path:match("%.bats$") ~= nil
          end,
        }),
        -- vim-test integration (fallback for unsupported languages)
        require("neotest-vim-test")({
          ignore_file_types = { "python", "lua", "go", "haskell", "sh" },
        }),
        -- Custom nixtest adapter example
        require("neb.plugins.neotest.nixtest"),
      },
      -- Discovery settings
      discovery = {
        enabled = true,
        concurrent = 1,
      },
      -- Diagnostic settings
      diagnostic = {
        enabled = true,
        severity = vim.diagnostic.severity.ERROR,
      },
      -- Floating window settings
      floating = {
        border = "rounded",
        max_height = 0.8,
        max_width = 0.8,
        options = {},
      },
      -- Highlights
      highlights = {
        adapter_name = "NeotestAdapterName",
        border = "NeotestBorder",
        dir = "NeotestDir",
        expand_marker = "NeotestExpandMarker",
        failed = "NeotestFailed",
        file = "NeotestFile",
        focused = "NeotestFocused",
        indent = "NeotestIndent",
        marked = "NeotestMarked",
        namespace = "NeotestNamespace",
        passed = "NeotestPassed",
        running = "NeotestRunning",
        select_win = "NeotestWinSelect",
        skipped = "NeotestSkipped",
        target = "NeotestTarget",
        test = "NeotestTest",
        unknown = "NeotestUnknown",
        watching = "NeotestWatching",
      },
      -- Icons
      icons = {
        child_indent = "│",
        child_prefix = "├",
        collapsed = "─",
        expanded = "╮",
        failed = "✖",
        final_child_indent = " ",
        final_child_prefix = "╰",
        non_collapsible = "─",
        passed = "✓",
        running = "⟳",
        running_animated = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" },
        skipped = "↓",
        unknown = "?",
        watching = "👁",
      },
      -- Output settings
      output = {
        enabled = true,
        open_on_run = "short",
      },
      -- Output panel settings
      output_panel = {
        enabled = true,
        open = "botright split | resize 15",
      },
      -- Quickfix settings
      quickfix = {
        enabled = true,
        open = false,
      },
      -- Run settings
      run = {
        enabled = true,
      },
      -- State settings
      state = {
        enabled = true,
      },
      -- Status settings
      status = {
        enabled = true,
        signs = true,
        virtual_text = false,
      },
      -- Summary settings
      summary = {
        enabled = true,
        expand_errors = true,
        follow = true,
        mappings = {
          attach = "a",
          clear_marked = "M",
          clear_target = "T",
          debug = "d",
          debug_marked = "D",
          expand = { "<CR>", "<2-LeftMouse>" },
          expand_all = "e",
          jumpto = "i",
          mark = "m",
          next_failed = "J",
          output = "o",
          prev_failed = "K",
          run = "r",
          run_marked = "R",
          short = "O",
          stop = "u",
          target = "t",
          watch = "w",
        },
        open = "botright vsplit | vertical resize 50",
      },
      -- Watch settings
      watch = {
        enabled = true,
        symbol_queries = {
          go = [[  ;query
            ;Captures imported types
            (qualified_type name: (type_identifier) @symbol)
            ;Captures package-local and built-in types
            (type_identifier)@symbol
            ;Captures imported function calls and variables/constants
            (selector_expression field: (field_identifier) @symbol)
            ;Captures package-local functions calls
            (call_expression function: (identifier) @symbol)
          ]],
          haskell = [[  ;query
            ;explicit imports
            (import_declaration (import_spec (import_item (variable))))@symbol
            ;symbols that may be imported implicitly
            (import_declaration (module))@symbol
          ]],
          lua = [[  ;query
            ;Captures module names in require calls
            (function_call
              name: ((identifier) @function (#eq? @function "require"))
              arguments: (arguments (string) @symbol))
          ]],
          python = [[  ;query
            ;imports
            (import_statement name: (dotted_name (identifier) @symbol))
            (import_from_statement name: (dotted_name (identifier) @symbol))
            ;function calls
            (call function: (identifier) @symbol)
            (call function: (attribute attribute: (identifier) @symbol))
          ]],
        },
      },
    })
  end,
}
