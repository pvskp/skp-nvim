return {
  'echasnovski/mini.files',
  version = '*',
  keys = {
    { '<leader>e', '<cmd>lua MiniFiles.open()<cr>', desc = 'Toggle File Explorer' },
    { '<c-e>',     '<cmd>lua MiniFiles.open()<cr>', desc = 'Toggle File Explorer' }
  },
  opts = {
    content = {
      filter = nil,
      prefix = nil,
      sort = nil,
    },

    mappings = {
      close = 'q',
      go_in = 'l',
      go_in_plus = 'L',
      go_out = 'h',
      go_out_plus = 'H',
      reset = '<BS>',
      reveal_cwd = '@',
      show_help = 'g?',
      synchronize = '<CR>',
      trim_left = '<',
      trim_right = '>',
    },

    -- General options
    options = {
      permanent_delete = true,
      use_as_default_explorer = true,
    },

    windows = {
      max_number = 5,
      preview = false,
      width_focus = 50,
      width_nofocus = 30,
      width_preview = 25,
    },
  },
  config = true,
}
