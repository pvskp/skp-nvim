return {
  'nvim-lualine/lualine.nvim',
  lazy = false,
  config = function()
    local nvimbattery = {
      function()
        local ok, result = pcall(require('battery').get_status_line)
        if not ok then
          return {}
        end
        return result
      end,

      separator = { left = '' },
      color = {
        fg = 'black',
      },
    }

    local copilot_section = {}
    if pcall(require, 'copilot') then
      copilot_section = {
        'copilot',
        -- Default values
        symbols = {
          status = {
            icons = {
              enabled = ' ',
              disabled = ' ',
              warning = ' ',
              unknown = ' ',
            },
            hl = {
              enabled = '#50FA7B',
              disabled = '#6272A4',
              warning = '#FFB86C',
              unknown = '#FF5555',
            },
          },
        },

        separator = { right = '' },
        show_colors = true,
        show_loading = true,
      }
    end

    require('lualine').setup {
      options = {
        icons_enabled = USE_DEVICONS,
        theme = 'auto',
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
        disabled_filetypes = {
          statusline = {},
          winbar = {},
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
          {
            'mode',
            fmt = function(str)
              return ' ' .. str
            end,

            color = {
              gui = 'bold',
              fg = 'black',
            },
            separator = { right = '' },
          },
        },
        lualine_b = {
          {
            'branch',
            icon = {
              Symbols.lualine.branch,
              color = {
                -- fg = 'orange'
              },
            },
            color = {
              gui = 'bold',
              -- fg = 'orange',
              -- bg = 'vimDarkGray2',
            },
            separator = { right = '' },
          },
          {
            'diff',
            symbols = {
              added = Symbols.changes.Added,
              modified = Symbols.changes.Modified,
              removed = Symbols.changes.Removed,
            }, -- Changes the symbols used by the diff.
            separator = { right = '' },
            color = {
              gui = 'bold',
              -- bg = 'NvimDarkGray3',
            },
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
            separator = { right = '' },
            color = {
              -- bg = 'NvimDarkGray3'
            },
          },
        },
        lualine_c = {
          '%=',
          {
            'filetype',
            icon_only = true,
            separator = { left = '' },
            color = {
              gui = 'bold',
              -- bg = 'NvimDarkGray3',
            },
          },
          {
            'filename',
            path = 1,
            separator = { right = '' },
            symbols = {
              modified = '[+]', -- Text to show when the file is modified.
              readonly = ' ', -- Text to show when the file is non-modifiable or readonly.
              unnamed = '[No Name]', -- Text to show for unnamed buffers.
              newfile = '[New]', -- Text to show for newly created file before first write
              -- modified = ' ', -- Text to show when the file is modified.
              -- readonly = '[-]', -- Text to show when the file is non-modifiable or readonly.
              -- unnamed = '[No Name]', -- Text to show for unnamed buffers.
              -- newfile = ' ', -- Text to show for newly created file before first write
            },
            color = {
              gui = 'bold',
              -- bg = 'NvimDarkGray3',
              fg = 'white',
            },
          },
        },
        lualine_x = {},
        lualine_y = {
          copilot_section,
        },
        lualine_z = {
          nvimbattery,
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
        lualine_x = { 'location' },
        lualine_y = {},
        lualine_z = {},
      },
      tabline = {},
      winbar = {},
      inactive_winbar = {},
      extensions = {},
    }
  end,
}
