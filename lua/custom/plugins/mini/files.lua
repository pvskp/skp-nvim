local open_desc = '  Toggle File Explorer'

return {
  'echasnovski/mini.files',
  version = '*',
  ft = 'alpha',
  init = function()
    vim.api.nvim_create_user_command('OpenFileManager', function()
      vim.cmd 'lua MiniFiles.open()'
    end, {})
  end,
  keys = {
    { '<leader>e', '<cmd>lua MiniFiles.open()<cr>', desc = open_desc },
    { '<c-e>',     '<cmd>lua MiniFiles.open()<cr>', desc = open_desc },
  },
  opts = {
    content = {
      filter = nil,
      prefix = nil,
      sort = nil,
    },

    mappings = {
      close = 'q',
      go_in = 'L',
      -- go_in_plus = 'L',
      go_out = 'H',
      -- go_out_plus = 'H',
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
      preview = true,
      width_focus = 50,
      width_nofocus = 30,
      width_preview = 70,
    },
  },
  config = function(_, opts)
    local MiniFiles = require 'mini.files'
    MiniFiles.setup(opts)
    vim.api.nvim_create_autocmd('User', {
      pattern = 'MiniFilesWindowOpen',
      callback = function(args)
        local win_id = args.data.win_id
        vim.api.nvim_win_set_config(win_id, {
          border = Borders.simple,
        })
      end,
    })

    local map_split = function(buf_id, lhs, direction)
      local rhs = function()
        -- Make new window and set it as target
        local new_target_window
        vim.api.nvim_win_call(MiniFiles.get_target_window(), function()
          vim.cmd(direction .. ' split')
          new_target_window = vim.api.nvim_get_current_win()
        end)

        MiniFiles.set_target_window(new_target_window)
        MiniFiles.go_in()
        MiniFiles.close()
      end

      -- Adding `desc` will result into `show_help` entries
      local desc = 'Split ' .. direction
      vim.keymap.set('n', lhs, rhs, { buffer = buf_id, desc = desc })
    end

    vim.api.nvim_create_autocmd('User', {
      pattern = 'MiniFilesBufferCreate',
      callback = function(args)
        local buf_id = args.data.buf_id
        -- Tweak keys to your liking
        map_split(buf_id, '<C-s>', 'belowright horizontal')
        map_split(buf_id, '<C-v>', 'belowright vertical')
      end,
    })
    vim.cmd 'highlight! MiniFilesNormal guibg=NONE'
  end,
}
