-- coq.nvim
-- Fast as FUCK nvim completion. SQLite, concurrent scheduler, hundreds of hours of optimization
return {
  'ms-jpq/coq_nvim',
  lazy = false,
  dependencies = {
    'ms-jpq/coq.artifacts'
  },
  config = function()
    vim.g.coq_settings = {
      auto_start = true,
      ["display.icons.mode"] = "short",
      ["display.preview.border"] = "single",
    }
  end,
}
