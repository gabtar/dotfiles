-- one_monokai.nvim
-- Colorscheme
-- One Monokai for Neovim
return {
  "sainnhe/edge",
  lazy = false,
  priority = 1000,
  config = function()
    vim.cmd 'colorscheme edge'
  end,
}
