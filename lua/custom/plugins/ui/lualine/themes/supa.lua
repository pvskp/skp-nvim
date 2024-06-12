local opts = {
  options = {
    icons_enabled = USE_DEVICONS,
    theme = 'auto',
    component_separators = { left = '', right = '' },
    section_separators = { left = '', right = '' },
    -- section_separators = { left = '', right = '' },
    disabled_filetypes = {
      'alpha',
      'neogit',
      -- statusline = {},
      -- winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
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
          -- color = {
          --   fg = 'orange',
          -- },
        },
        -- color = {
        --   gui = 'bold',
        --   fg = 'orange',
        --   -- bg = 'vimDarkGray2',
        -- },
      },
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
    },
    lualine_c = {
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
        'filetype',
        icon_only = true,
        color = {
          gui = 'bold',
        },
      },
      {
        'filename',
        path = 1,
        symbols = {
          -- modified = '[+]', -- Text to show when the file is modified.
          -- readonly = ' ', -- Text to show when the file is non-modifiable or readonly.
          -- unnamed = '[No Name]', -- Text to show for unnamed buffers.
          -- newfile = '[New]', -- Text to show for newly created file before first write
          -- -- modified = ' ', -- Text to show when the file is modified.
          -- -- readonly = '[-]', -- Text to show when the file is non-modifiable or readonly.
          -- -- unnamed = '[No Name]', -- Text to show for unnamed buffers.
          -- -- newfile = ' ', -- Text to show for newly created file before first write
        },
        color = {
          gui = 'bold',
          fg = 'white',
        },
      },
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
