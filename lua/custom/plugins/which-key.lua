return {
  'folke/which-key.nvim',
  version = "v2.1.0",
  event = 'VeryLazy',
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 150
  end,
  opts = {},
}
