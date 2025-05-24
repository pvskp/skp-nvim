return {
  'stevearc/oil.nvim',
  keys = {
    { '=', '<CMD>Oil<CR>' },
  },
  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = {
    default_file_explorer = false,
    skip_confirm_for_simple_edits = true,
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
