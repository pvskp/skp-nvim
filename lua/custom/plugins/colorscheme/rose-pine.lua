return {
  'rose-pine/neovim',
  name = 'rose-pine',
  priority = 1000,
  lazy = false,
  opts = {
    variant = 'main', -- auto, main, moon, or dawn
    dark_variant = 'main', -- main, moon, or dawn
    dim_inactive_windows = false,
    extend_background_behind_borders = true,

    enable = {
      terminal = true,
      legacy_highlights = true, -- Improve compatibility for previous versions of Neovim
      migrations = true, -- Handle deprecated options automatically
    },

    styles = {
      bold = true,
      italic = true,
      transparency = false,
    },
  },
  config = function(_, opts)
    require('rose-pine').setup(opts)
    vim.cmd [[colorscheme rose-pine]]
  end,
}
