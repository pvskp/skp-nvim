return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  opts = {
    styles = {
      comments = { italic = true },
      keywords = { italic = true },
      functions = {},
      variables = {},
      sidebars = "dark",  -- style for sidebars, see below
      floats = "dark",    -- style for floating windows
    },
    dim_inactive = false, -- dims inactive windows
  },
  config = function(_, opts)
    require('tokyonight').setup(opts)
    vim.cmd [[colorscheme tokyonight]]
    set_hl("TreesitterContextBottom", {
      underline = true,
      sp = TokyoNight.bg_highlight
    })

    set_hl("TreesitterContext", {
      bg = TokyoNight.bg_dark,
    })

    set_hl("TreesitterContextLineNumber", {
      bg = TokyoNight.bg_dark,
      fg = TokyoNight.fg,
    })
  end
}
