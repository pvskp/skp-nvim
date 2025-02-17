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
      sidebars = "dark", -- style for sidebars, see below
      floats = "light",  -- style for floating windows
    },
    on_highlights = function(hl, c)
      local statusline_bg = c.bg_dark
      local statusline_accent = c.blue0
      hl.StatusLine = { bg = statusline_bg, fg = c.teal }
      hl.StatuslineMode = { bg = statusline_accent }
      hl.StatuslineSeparator = { fg = statusline_accent, bg = statusline_bg }
      hl.IconSun = { bg = statusline_accent, fg = c.yellow }
      hl.IconSunset = { bg = statusline_accent, fg = c.yellow }
      hl.IconMoon = { bg = statusline_accent, fg = c.blue1 }
      hl.IconBranch = { bg = statusline_accent, fg = c.orange }
      hl.TreesitterContextBottom = { underline = true, sp = c.bg_highlight }
      hl.TreesitterContext = { bg = c.bg_dark }
      hl.TreesitterContextLineNumber = { bg = c.bg_dark, fg = c.fg }
    end,
    dim_inactive = true, -- dims inactive windows
  },
  config = function(_, opts)
    require('tokyonight').setup(opts)
    vim.cmd("colorscheme tokyonight-moon")
  end
}
