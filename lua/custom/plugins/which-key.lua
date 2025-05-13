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
    preset = 'helix',
    ---@type wk.Win.opts
    win = {

      -- border = "none",
      -- row = 50,
      border = 'single',
      width = 50,
    },

    layout = {
      width = { min = 20 }, -- min and max width of the columns
      spacing = 3, -- spacing between columns
    },
    delay = 1,
  },
  config = function(_, opts)
    vim.api.nvim_set_hl(0, 'WhichKeyBorder', { link = 'NormalFloat' })
    require('which-key').setup(opts)
  end,
}
