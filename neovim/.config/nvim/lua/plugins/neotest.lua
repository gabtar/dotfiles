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
}
