return {
  'stevearc/oil.nvim',
  keys = {
    {
      '<C-e>',
      '<CMD>Oil<CR>',
      -- function()
      --   require('oil').open(nil, {
      --     preview = {
      --       vertical = true,
      --     },
      --   }, nil)
      -- end,
    },
  },
  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = {
    win_options = {
      number = false,
      statuscolumn = '',
    },
    preview_win = {
      preview_method = 'fast_scratch',
      win_options = {
        number = false,
        statuscolumn = '',
      },
    },
    keymaps = {
      ['L'] = 'actions.select',
      ['H'] = 'actions.parent',
      ['q'] = { 'actions.close', mode = 'n' },
    },
  },
  -- Optional dependencies
  dependencies = { { 'echasnovski/mini.icons', opts = {} } },
  -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
  -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
  lazy = false,
}
