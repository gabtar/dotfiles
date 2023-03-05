-- plugin-manager.lua
-- Lazy.nvim

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

require("lazy").setup({
  'tpope/vim-fugitive',             -- Git commands in nvim

  {
    "numToStr/Comment.nvim",          -- "gc" to comment visual regions/lines
    config = function()
      require('Comment').setup()
    end,

  },

  'ludovicchabant/vim-gutentags',   -- Automatic tags management

  -- UI to select things (files, grep results, open buffers...)
  { 'nvim-telescope/telescope.nvim',
    lazy = false,
    dependencies = { 'nvim-lua/plenary.nvim',
      {'nvim-telescope/telescope-fzf-native.nvim',
      build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
      }
    }
  },

  -- Colorscheme
  {
    "cpea2506/one_monokai.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("one_monokai").setup({
      })
    end,
  },

  'vim-test/vim-test', -- Commands for testing files/etc -> :TestFile, :TestSuit, etc

  'lukas-reineke/indent-blankline.nvim', -- Add indentation guides even on blank lines

  -- Add git related info in the signs columns and popups
  { 'lewis6991/gitsigns.nvim', 
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('gitsigns').setup {
        signs = {
          add = { text = '+' },
          change = { text = '~' },
          delete = { text = '_' },
          topdelete = { text = '‾' },
          changedelete = { text = '~' },
        }
      }
    end,
  },

  -- Highlight, edit, and navigate code using a fast incremental parsing library
  'nvim-treesitter/nvim-treesitter',
  -- Additional textobjects for treesitter
  'nvim-treesitter/nvim-treesitter-textobjects',

   -- Easily install and manage LSP servers, DAP servers, linters, and formatters.
   { "williamboman/mason.nvim" },
   { "williamboman/mason-lspconfig.nvim" },
   { "neovim/nvim-lspconfig" },

   -- Status line
  { 'nvim-lualine/lualine.nvim',
    dependencies = { 'kyazdani42/nvim-web-devicons', opt = true }
  },

  -- A light-weight lsp plugin based on neovim's built-in lsp with a highly performant UI.
  {
    "glepnir/lspsaga.nvim",
    event = "BufRead",
    config = function()
        require("lspsaga").setup({})
    end,
   },

  -- Icons (works with patched fonts)
  { 'kyazdani42/nvim-web-devicons' },

  { 'ms-jpq/coq_nvim',
    lazy = false,
    dependencies = {
      'ms-jpq/coq.artifacts'
    }
  },
})
