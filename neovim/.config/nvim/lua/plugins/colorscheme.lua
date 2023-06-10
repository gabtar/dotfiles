-- one_monokai.nvim
-- Colorscheme
-- One Monokai for Neovim
return {
  "cpea2506/one_monokai.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("one_monokai").setup({
    })
    vim.cmd 'colorscheme one_monokai'
  end,
}
