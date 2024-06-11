local nvimbattery = {
  function()
    local ok, result = pcall(require('battery').get_status_line)
    if not ok then
      return {}
    end
    return result
  end,

  -- separator = { left = '' },
  -- color = {
  --   fg = 'black',
  -- },
}

local lazy_status = require 'lazy.status'

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

local colors = {
  bg = '#202328',
  fg = '#bbc2cf',
  yellow = '#ECBE7B',
  cyan = '#008080',
  darkblue = '#081633',
  green = '#98be65',
  orange = '#FF8800',
  violet = '#a9a1e1',
  magenta = '#c678dd',
  blue = '#51afef',
  red = '#ec5f67',

  -- insert = Lighten_color(Get_highlight_bg 'lualine_a_insert', 1.2),
  -- normal = Lighten_color(Get_highlight_bg 'lualine_a_normal', 1.2),
  -- visual = Lighten_color(Get_highlight_bg 'lualine_a_visual', 1.2),
  -- command = Lighten_color(Get_highlight_bg 'lualine_a_command', 1.2),
  -- replace = Lighten_color(Get_highlight_bg 'lualine_a_replace', 1.2),
  -- inactive = Lighten_color(Get_highlight_bg 'lualine_a_inactive', 1.2),
  -- terminal = Lighten_color(Get_highlight_bg 'lualine_a_terminal', 1.2),
}

if vim.o.background == 'light' then
  colors.bg = '#E1E0C3'

  colors.fg = '#202328'
end

local function color_as_mode()
  -- auto change color according to neovims mode
  local mode_color = {
    n = colors.blue,
    i = colors.green,
    v = colors.orange,
    [''] = colors.orange,
    V = colors.orange,
    c = colors.magenta,
    no = colors.blue,
    s = colors.orange,
    S = colors.orange,
    [''] = colors.orange,
    ic = colors.yellow,
    R = colors.violet,
    Rv = colors.violet,
    cv = colors.blue,
    ce = colors.blue,
    r = colors.cyan,
    rm = colors.cyan,
    ['r?'] = colors.cyan,
    ['!'] = colors.blue,
    t = colors.blue,
  }
  return { fg = mode_color[vim.fn.mode()] }
end

local opts = {
  options = {
    icons_enabled = USE_DEVICONS,
    -- theme = 'auto',
    theme = {
      -- We are going to use lualine_c an lualine_x as left and
      -- right section. Both are highlighted by c theme .  So we
      -- are just setting default looks o statusline
      normal = { c = { fg = colors.fg, bg = colors.bg } },
      inactive = { c = { fg = colors.fg, bg = colors.bg } },
    },
    component_separators = { left = '', right = '' },
    section_separators = { left = '', right = '' },
    disabled_filetypes = {
      'alpha',
      'NeogitStatus',
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
    lualine_a = {},
    lualine_b = {},
    lualine_c = {
      {
        function()
          return '▊'
        end,
        color = color_as_mode,
        -- color = {
        --   fg = colors.blue
        -- }, -- Sets highlighting of component
        padding = { left = 0, right = 0 }, -- We don't need space before this
      },
      {
        function(str)
          -- return ' ' .. str
          return ''
        end,

        color = color_as_mode,
      },
      {
        'branch',
        icon = {
          Symbols.lualine.branch,
          color = {
            fg = 'orange',
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
        colored = true,
        -- diff_color = {
        --   -- Same color values as the general color option can be used here.
        --   added = 'LuaLineDiffAdd', -- Changes the diff's added color
        --   modified = 'LuaLineDiffChange', -- Changes the diff's modified color
        --   removed = 'LuaLineDiffDelete', -- Changes the diff's removed color you
        -- },
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
          -- bg = 'NvimDarkGray3'
          gui = 'bold',
        },
        separator = { right = '' },
      },

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
        -- separator = { right = '' },
        symbols = {
          modified = '+', -- Text to show when the file is modified.
          readonly = ' ', -- Text to show when the file is non-modifiable or readonly.
          unnamed = '[?]', -- Text to show for unnamed buffers.
          newfile = '[New]', -- Text to show for newly created file before first write
        },
        -- color = {
        --   gui = 'bold',
        --   bg = 'NvimDarkGray3',
        --   fg = 'white',
        -- },
      },
    },
    lualine_x = {
      {
        lazy_status.updates,
        cond = lazy_status.has_updates,
        color = {
          fg = 'orange',
        },

        -- separator = { left = '' },
      },
      nvimbattery,
      {
        'ctime',
        color = {
          -- fg = 'blue',
        },
      },
      {
        function()
          return '▊'
        end,
        color = color_as_mode,
        padding = { left = 1, right = 0 }, -- We don't need space before this
      },
    },
    lualine_y = {
      copilot_section,
    },
    lualine_z = {},
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
  extensions = { 'fugitive', 'lazy', 'mason', 'quickfix', 'trouble' },
}

return opts
