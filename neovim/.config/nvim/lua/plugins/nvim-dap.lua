-- nvim-dap
-- Debug Adapter Protocol client implementation for Neovim
return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "leoluz/nvim-dap-go",
    "mfussenegger/nvim-dap-python"
  },
  config = function()
    local dap = require("dap")

    -- To use inside container
    dap.adapters.generic_remote = function(callback, config)
      callback({
        type = 'server',
        host = '127.0.0.1',
        port = 80,
      })
    end

    -- Go adapter
    dap.adapters.delve = {
      type = 'server',
      port = '${port}',
      executable = {
        command = 'dlv',
        args = {'dap', '-l', '127.0.0.1:${port}'},
      }
    }

    -- Python adapter
    dap.adapters.python = {
      type = "executable",
      command = "$HOME/.local/share/nvim/mason/packages/debugpy/venv/bin/python",
      args = { "-m", "debugpy.adapter" },
    }

    -- https://github.com/go-delve/delve/blob/master/Documentation/usage/dlv_dap.md
    dap.configurations.go = {
      {
        type = "delve",
        name = "Debug current file",
        request = "launch",
        program = "${file}"
      },
      {
        type = "delve",
        name = "Debug project",
        request = "launch",
        program = "./${relativeFileDirname}"
      },
      {
        type = "delve",
        name = "Debug test", -- configuration for debugging test files
        request = "launch",
        mode = "test",
        program = "${file}"
      },
      -- works with go.mod packages and sub packages 
      {
        type = "delve",
        name = "Debug test (go.mod)",
        request = "launch",
        mode = "test",
        program = "./${relativeFileDirname}"
      }
    }

    -- Attach to docker container
    dap.configurations.python = {
      {
        type = 'generic_remote',
        name = 'Generic remote',
        request = 'attach',
        pathMappings = {{
          -- Update this as needed
          localRoot = vim.fn.getcwd();
          remoteRoot = "/";
        }};
      },
    }

    -- Keybindings
    -- -- Set breakpoints, get variable values, step into/out of functions, etc.
    -- vim.keymap.set("n", "<leader>dl", require("dap.ui.widgets").hover)
    vim.keymap.set("n", "<leader>dc", dap.continue)
    vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint)
    vim.keymap.set("n", "<leader>dn", dap.step_over)
    vim.keymap.set("n", "<leader>di", dap.step_into)
    vim.keymap.set("n", "<leader>do", dap.step_out)
    -- vim.keymap.set("n", "<leader>dC", function()
    --   dap.clear_breakpoints()
    --   require("notify")("Breakpoints cleared", "warn")
    -- end)
  end,
}
