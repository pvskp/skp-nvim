return {
  'echasnovski/mini.files',
  version = '*',
  keys = {
    { '<leader>e', '<cmd>lua MiniFiles.open()<cr>', desc = 'Toggle File Explorer' },
    { '<c-e>', '<cmd>lua MiniFiles.open()<cr>', desc = 'Toggle File Explorer' },
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
  config = function(_, opts)
    require('mini.files').setup(opts)
    vim.api.nvim_create_autocmd('User', {
      pattern = 'MiniFilesWindowOpen',
      callback = function(args)
        local win_id = args.data.win_id
        vim.api.nvim_win_set_config(win_id, { border = Borders.simple })
      end,
    })
    vim.cmd 'highlight! MiniFilesDirectory guibg=NONE'
    vim.cmd 'highlight! MiniFilesNormal guibg=NONE'
    vim.cmd 'highlight! link MiniFilesBorder TelescopeResultsBorder'
  end,
}
