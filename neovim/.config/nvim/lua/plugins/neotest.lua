-- neotest
-- An extensible framework for interacting with tests within NeoVim.
return {
  -- A framework for interacting with tests within NeoVim.
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "antoinemadec/FixCursorHold.nvim",
    -- Vim test 'Generic adapter'
    "vim-test/vim-test",
    -- Adapters
    "nvim-neotest/neotest-python",
    "nvim-neotest/neotest-vim-test",
  },
  config = function()
    local neotest = require("neotest")

    require("neotest").setup({
      quickfix = {
        open = false,
        enabled = false,
      },
      status = {
        enabled = true,
        signs = true, -- Sign after function signature
        virtual_text = false
      },
      icons = {
        child_indent = "│",
        child_prefix = "├",
        collapsed = "─",
        expanded = "╮",
        failed = "✘",
        final_child_indent = " ",
        final_child_prefix = "╰",
        non_collapsible = "─",
        passed = "✓",
        running = "",
        running_animated = { "/", "|", "\\", "-", "/", "|", "\\", "-" },
        skipped = "↓",
        unknown = ""
      },
      floating = {
        border = "rounded",
        max_height = 0.9,
        max_width = 0.9,
        options = {}
      },
      summary = {
        open = "botright vsplit | vertical resize 60"
      },
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
        unknown = "NeotestUnknown"
      },
      adapters = {
      }
    })



    vim.keymap.set(
    "n",
    "<localleader>tfr",
    function()
      neotest.run.run(vim.fn.expand("%"))
    end,
    map_opts
    )

    vim.keymap.set(
    "n",
    "<localleader>tr",
    function()
      neotest.run.run()
      neotest.summary.open()
    end,
    map_opts
    )

    vim.keymap.set(
    "n",
    "<localleader>to",
    function()
      neotest.output.open({ last_run = true, enter = true })
    end
    )


    vim.keymap.set(
    "n",
    "<localleader>tt",
    function()
      neotest.summary.toggle()
      u.resize_vertical_splits()
    end,
    map_opts
    )
  end

}
