local opts = {
  options = {
    icons_enabled = USE_DEVICONS,
    theme = 'auto',
    -- component_separators = { left = '', right = '' },
    section_separators = { left = '', right = '' },
    -- section_separators = { left = '', right = '' },
    component_separators = { left = '', right = '' },
    -- section_separators = { left = '', right = '' },
    disabled_filetypes = {
      'alpha',
      'neogit',
      'oil',
      -- statusline = {},
      -- winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = true,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    },
  },
  sections = {
    lualine_a = {
      -- { 'windows' },
      {
        'mode',
        fmt = function(str)
          return ' ' .. str
        end,

        color = {
          gui = 'bold',
          -- fg = 'black',
        },
      },
    },
    lualine_b = {
      {
        'branch',
        icon = {
          Symbols.lualine.branch,
          color = {
            fg = 'orange',
          },
        },
        -- color = {
        --   gui = 'bold',
        --   fg = 'orange',
        --   -- bg = 'vimDarkGray2',
        -- },
      },
    },
    lualine_c = {
      {
        'diagnostics',
        symbols = {
          hint = Symbols.diagnostics.Hint,
          info = Symbols.diagnostics.info,
          warn = Symbols.diagnostics.Warn,
          error = Symbols.diagnostics.Error,
        },
        color = {
          gui = 'bold',
        },
      },
      {
        'diff',
        symbols = {
          added = Symbols.changes.Added,
          modified = Symbols.changes.Modified,
          removed = Symbols.changes.Removed,
        }, -- Changes the symbols used by the diff.
        color = {
          gui = 'bold',
        },
      },
      '%=',
      {
        "buffers",
        use_mode_colors = false,
        buffers_color = {
          -- Same values as the general color option can be used here.
          active = 'lualine_a_normal',     -- Color for active buffer.
          inactive = 'lualine_a_inactive', -- Color for inactive buffer.
        },
        symbols = {
          modified = ' ●', -- Text to show when the buffer is modified
          -- alternate_file = '#', -- Text to show to identify the alternate file
          alternate_file = '', -- Text to show to identify the alternate file
          directory = '', -- Text to show when the buffer is a directory
        },
      }
    },
    lualine_x = {},
    lualine_y = {
      {
        require('lazy.status').updates,
        cond = require('lazy.status').has_updates,
        color = {
          fg = 'orange',
        },
      },
    },
    lualine_z = {
      {
        -- Nvim battery
        function()
          local ok, result = pcall(require('battery').get_status_line)
          if not ok then
            return {}
          end
          return result
        end,

        color = {
          fg = 'black',
        },
      },
      {
        'ctime',
        color = {
          fg = 'black',
        },
      },
    },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { 'filename' },
    lualine_x = {},
    lualine_y = {},
    lualine_z = {},
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {},
}

return opts
