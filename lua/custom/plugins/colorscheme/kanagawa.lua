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
      return {
        -- Normal = { bg = 'none' },
        TrueHighlighGroup = { fg = palette_colors.dragonGreen },
        FalseHighlighGroup = { fg = palette_colors.dragonRed },
        LspReferenceText = { undercurl = false, underline = false },

        -- rendermarkdown
        RenderMarkdownH1Bg = { fg = palette_colors.autumnGreen, bg = nil, bold = true },
        RenderMarkdownH2Bg = { fg = palette_colors.crystalBlue, bg = nil, bold = true },
        RenderMarkdownH3Bg = { fg = palette_colors.autumnRed, bg = nil, bold = true },
        RenderMarkdownDash = { fg = palette_colors.dragonGray, bg = nil },

        --- Cursorline
        LineNr = { bg = palette_colors.sumiInk3 },
        CursorLineNr = { bg = palette_colors.sumiInk3 },

        --- Git signs
        GitSignsAdd = { bg = palette_colors.sumiInk3 },
        GitSignsChange = { bg = palette_colors.sumiInk3 },
        GitSignsDelete = { bg = palette_colors.sumiInk3 },
      }
    end,
  },
  config = function(_, opts)
    require('kanagawa').setup(opts)
    vim.cmd.colorscheme('kanagawa')
  end,
}
