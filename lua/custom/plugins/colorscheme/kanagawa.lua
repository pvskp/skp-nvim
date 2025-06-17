return {
  'rebelot/kanagawa.nvim',
  lazy = false,
  priority = 1000,
  ---@module "kanagawa"
  ---@type KanagawaConfig
  opts = {
    ---@param colors KanagawaColors
    ---@return table
    overrides = function(colors)
      local palette_colors = colors.palette
      local border_color = palette_colors.sumiInk6
      local text_fg = palette_colors.dragonWhite
      return {
        -- Normal = { bg = 'none' },
        TrueHighlighGroup = { fg = palette_colors.dragonGreen },
        FalseHighlighGroup = { fg = palette_colors.dragonRed },
        LspReferenceText = { undercurl = false, underline = false },

        --- Native
        NormalFloat = { fg = border_color, bg = 'none' },
        FloatBorder = { bg = 'none' },
        Pmenu = { bg = 'none' },

        -- rendermarkdown
        RenderMarkdownH1Bg = { fg = palette_colors.autumnGreen, bg = nil, bold = true },
        RenderMarkdownH2Bg = { fg = palette_colors.crystalBlue, bg = nil, bold = true },
        RenderMarkdownH3Bg = { fg = palette_colors.autumnRed, bg = nil, bold = true },
        RenderMarkdownDash = { fg = palette_colors.dragonGray, bg = nil },
        RenderMarkdownCode = { bg = palette_colors.sumiInk3 },

        --- Cursorline
        LineNr = { bg = 'none' },
        CursorLineNr = { bg = 'none' },

        --- Git signs
        GitSignsAdd = { bg = 'none' },
        GitSignsChange = { bg = 'none' },
        GitSignsDelete = { bg = 'none' },

        --- Diagnostics signs
        DiagnosticSignHint = { bg = 'none' },
        DiagnosticSignInfo = { bg = 'none' },
        DiagnosticSignWarn = { bg = 'none' },

        DiagnosticSignError = { bg = 'none' },

        --- Blink cmp
        BlinkCmpMenuBorder = { fg = border_color, bg = 'none' },

        SnacksPickerFile = { fg = text_fg },
      }
    end,
  },
  config = function(_, opts)
    require('kanagawa').setup(opts)
    vim.cmd.colorscheme('kanagawa')
  end,
}
