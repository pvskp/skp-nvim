return {
  'echasnovski/mini.files',
  version = '*',
  keys = {
    { '<leader>e', '<cmd>lua MiniFiles.open()<cr>', desc = 'Toggle File Explorer' },
    { '<c-e>',     '<cmd>lua MiniFiles.open()<cr>', desc = 'Toggle File Explorer' }
  },
  opts = {
    -- Customization of shown content
    content = {
      -- Predicate for which file system entries to show
      filter = nil,
      -- What prefix to show to the left of file system entry
      prefix = nil,
      -- In which order to show file system entries
      sort = nil,
    },

    -- Module mappings created only inside explorer.
    -- Use `''` (empty string) to not create one.
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
      -- Whether to delete permanently or move into module-specific trash
      permanent_delete = true,
      -- Whether to use for editing directories
      use_as_default_explorer = true,
    },

    windows = {
      max_number = 4,
      preview = false,
      width_focus = 50,
      width_nofocus = 15,
      width_preview = 25,
    },
  },
  config = true, -- do require("mini.files").setup()
}
