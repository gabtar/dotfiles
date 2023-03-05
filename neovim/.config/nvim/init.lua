-- init.lua
-- Loads all configs

-- General configs
require('keymaps')
require('plugin-manager')
require('settings')

-- Plugins specific configs
require('plugins/coq')
require('plugins/indent-blankline')
require('plugins/lspsaga')
require('plugins/lualine')
require('plugins/mason')
require('plugins/telescope')
require('plugins/treesitter')

