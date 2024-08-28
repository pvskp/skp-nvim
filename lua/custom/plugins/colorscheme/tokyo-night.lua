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
  end
}
