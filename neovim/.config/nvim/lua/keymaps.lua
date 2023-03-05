-- keymaps.lua 

local map = vim.api.nvim_set_keymap

-- Remap space as leader key
map('', '<Space>', '<Nop>', { noremap = true, silent = true })
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local options = { noremap = true }

map('n', '<A-j>', ':m .+1<CR>==', options) -- swap with above line and correct identation
map('n', '<A-k>', ':m .-2<CR>==', options) -- swap with below line and correct identation

-- Clipboard mappings
map('n', '<leader>p', '"+p', options) -- paste selected text from clipboard + into vim
map('n', '<leader>y', '"+y', options) -- copy selected text to clipboard + (paste with ctrl-v on any other application)

-- Auto inserts for matching pair
local settings = { noremap = true, nowait = true }

map('i', '{', '{}<Esc>i', settings) -- Auto insert matching curly bracer after '{'
map('i', '[', '[]<Esc>i', settings) -- Auto insert matching square bracer after '['
map('i', '(', '()<Esc>i', settings) -- Auto insert matching round bracer after '('
map('i', '"', '""<Esc>i', settings) -- Auto insert matching double quote after '"'
map('i', "'", "''<Esc>i", settings) -- Auto insert matching single quote after '''
