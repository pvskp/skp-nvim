local colors = {
  bg = "#24283b",
  bg_dark = "#1f2335",
  bg_dark1 = "#1b1e2d",
  bg_highlight = "#292e42",
  blue = "#7aa2f7",
  blue0 = "#3d59a1",
  blue1 = "#2ac3de",
  blue2 = "#0db9d7",
  blue5 = "#89ddff",
  blue6 = "#b4f9f8",
  blue7 = "#394b70",
  comment = "#565f89",
  cyan = "#7dcfff",
  dark3 = "#545c7e",
  dark5 = "#737aa2",
  fg = "#c0caf5",
  fg_dark = "#a9b1d6",
  fg_gutter = "#3b4261",
  green = "#9ece6a",
  green1 = "#73daca",
  green2 = "#41a6b5",
  magenta = "#bb9af7",
  magenta2 = "#ff007c",
  orange = "#ff9e64",
  purple = "#9d7cd8",
  red = "#f7768e",
  red1 = "#db4b4b",
  teal = "#1abc9c",
  terminal_black = "#414868",
  yellow = "#e0af68",
  git = {
    add = "#449dab",
    change = "#6183bb",
    delete = "#914c54",
  },
}

local statusline_bg = colors.bg_dark
local statusline_accent = colors.blue0


vim.api.nvim_set_hl(0, "Statusline", { bg = statusline_bg, fg = colors.teal })
vim.api.nvim_set_hl(0, "StatuslineMode", { bg = statusline_accent })
vim.api.nvim_set_hl(0, "StatuslineSeparator", { fg = statusline_accent, bg = statusline_bg })
vim.api.nvim_set_hl(0, "IconSun", { bg = statusline_accent, fg = colors.yellow })
vim.api.nvim_set_hl(0, "IconSunset", { bg = statusline_accent, fg = colors.yellow })
vim.api.nvim_set_hl(0, "IconMoon", { bg = statusline_accent, fg = colors.blue1 })
vim.api.nvim_set_hl(0, "IconBranch", { bg = statusline_accent, fg = colors.orange })
