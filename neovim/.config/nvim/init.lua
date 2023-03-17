-- init.lua
-- Loads all configs

-- General configs
require('keymaps')
require('settings')


-- Plugin manager (lazy.nvim)
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)


-- Plugins setup
-- This autoloads all config files from /lua/plugins folder
require("lazy").setup({
  import = "plugins",
  change_detection = {
    enabled = true,
    notify = false,
  }
})
