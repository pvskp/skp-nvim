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
      }
    end,
  },
  config = function(_, opts)
    require('kanagawa').setup(opts)
    vim.cmd.colorscheme('kanagawa')
  end,
}
