local lspconfig = require("lspconfig")

local coq = require "coq"
-- lsp.tsserver.setup{}
-- lsp.tsserver.setup(coq.lsp_ensure_capabilities{})
-- vim.cmd('COQnow -s')

require("mason").setup()
require("mason-lspconfig").setup()

-- Alternatively lookup setup_handlers in the help pages of mason. It provides a method to automatically setup all installed LSPs.
require("mason-lspconfig").setup_handlers({
  -- The first entry (without a key) will be the default handler
  -- and will be called for each installed server that doesn't have
  -- a dedicated handler.
  function (server_name) -- default handler (optional)
    require("lspconfig")[server_name].setup {coq.lsp_ensure_capabilities{}}
  end,
  -- Next, you can provide targeted overrides for specific servers.
  -- ["rust_analyzer"] = function ()
  --   require("rust-tools").setup {}
  -- end,
  -- Add support for emmet snipets in extra filetypes
  ["emmet_ls"] = function()
    lspconfig.emmet_ls.setup {
      filetypes = { 'html', 'typescriptreact', 'javascriptreact', 'css', 'sass', 'scss', 'less' },
      init_options = {
      html = {
        options = {
          -- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
          ["bem.enabled"] = true,
        },
      },
    }
    }
  end,
})

vim.cmd('COQnow -s')
