return {
  'rose-pine/neovim',
  name = 'rose-pine',
  priority = 1000,
  lazy = false,
  opts = {
    variant = 'moon',      -- auto, main, moon, or dawn
    dark_variant = 'moon', -- main, moon, or dawn
    dim_inactive_windows = false,
    extend_background_behind_borders = true,

    enable = {
      terminal = true,
      legacy_highlights = true, -- Improve compatibility for previous versions of Neovim
      migrations = true,        -- Handle deprecated options automatically
    },


    highlight_groups = {
      Comment = { italic = true },
      StatusLine = { fg = "love", bg = "love", blend = 10 },
      StatusLineNC = { fg = "subtle", bg = "surface" },
      ["@markup.link.label.tsx"] = { fg = "love", underline = false },
      htmlLink = { underline = false },
      -- VertSplit = { fg = "muted", bg = "muted" },
    },

    styles = {
      bold = true,
      italic = false,
      transparency = false,
    },
  },

  config = function(_, opts)
    require('rose-pine').setup(opts)
    vim.cmd [[colorscheme rose-pine]]
  end,
}
