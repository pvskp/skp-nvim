return {
  'EdenEast/nightfox.nvim',
  lazy = false,
  priority = 1000,
  config = function(_, opts)
    local theme = 'duskfox'
    local nightfox = require('nightfox')
    local palette = require('nightfox.palette').load(theme)
    nightfox.setup({
      options = {
        dim_inactive = false, -- Non focused panes set to alternative background
        styles = { -- Style to be applied to different syntax groups
          comments = 'NONE', -- Value is any valid attr-list value `:help attr-list`
          conditionals = 'NONE',
          constants = 'NONE',
          functions = 'NONE',
          keywords = 'NONE',
          numbers = 'NONE',
          operators = 'NONE',
          strings = 'NONE',
          types = 'NONE',
          variables = 'NONE',
        },
      },
      palettes = {},
      specs = {},
      groups = {
        all = {
          NormalFloat = { bg = 'none' },
          FloatBorder = { bg = 'none' },
          Pmenu = { bg = 'none' },

          RenderMarkdownH1Bg = { fg = palette.green, bg = 'none', style = 'bold' },
          RenderMarkdownH2Bg = { fg = palette.blue, bg = 'none', style = 'bold' },
          RenderMarkdownH3Bg = { fg = palette.red, bg = 'none', style = 'bold' },
          RenderMarkdownDash = { fg = palette.gray, bg = 'none' },
          RenderMarkdownCode = { bg = palette.bg1 },

          TrueHighlighGroup = { fg = palette.green },
          FalseHighlighGroup = { fg = palette.red },

          TreesitterContext = { bg = 'none' },
          TreesitterContextLineNumber = { bg = 'none' },
          TreesitterContextBottom = { style = 'underline', sp = palette.bg2 },
        },
      },
    })
    vim.cmd.colorscheme(theme)
  end,
}
