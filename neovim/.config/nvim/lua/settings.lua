-- settings.lua

local options = vim.o

-- global options
options.title = true                          -- Show filename on title
options.number = true                         -- Show line numbers
options.cursorline = true                     -- Highlight currentline
options.mouse = 'a'                           -- Mouse integration
options.termguicolors = true
options.breakindent = true
options.clipboard = 'unnamedplus'             -- Use system clipboard

options.tabstop = 2		                        -- 2 spaces identation
options.shiftwidth = 2
options.softtabstop = 2
options.shiftround = true
options.expandtab = true	                    -- Insert spaces when <TAB>
options.clipboard = 'unnamedplus'             -- Copies to system clipboard
options.colorcolumn = '80'                    -- Column marker at 80 lines
options.relativenumber = true                 -- Relative line number

options.ignorecase = true                     -- Ignorecase on search
options.smartcase = true                      -- No ignorecase if capitals

options.spelllang = 'en-es'                  -- Check spelling
options.background = 'dark'

options.showmode = false                      -- Don't display actual mode on cmd line

-- Set completeopt to have a better completion experience
options.completeopt = 'menu,menuone,noselect'

-- Set colorscheme
-- vim.cmd("colorscheme kanagawa")

-- Highlight on yank
vim.cmd [[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]]

-- Integrated terminal
vim.cmd [[
  augroup neovim_terminal
      autocmd!
      " Enter Terminal-mode (insert) automatically
      autocmd TermOpen * startinsert
      " Disables number lines on terminal buffers
      autocmd TermOpen * :set nonumber norelativenumber
      " allows you to use Ctrl-c on terminal window
      autocmd TermOpen * nnoremap <buffer> <C-c> i<C-c>
  augroup END
]]
