return {
  'folke/which-key.nvim',
  version = '*',
  event = 'VeryLazy',
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 150
  end,
  ---@module 'which-key'
  ---@type wk.Opts
  opts = {
    preset = 'classic',
    win = {
      row = 50,
    },
    delay = 1,
  },
}
