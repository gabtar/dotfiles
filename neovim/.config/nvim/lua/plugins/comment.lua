-- Comment.nvim
-- Smart and powerful comment plugin for neovim. Supports treesitter, dot repeat, left-right/up-down motions, hooks, and more
return {
    "numToStr/Comment.nvim",          -- "gc" to comment visual regions/lines
    config = function()
      require('Comment').setup()
    end,
}
