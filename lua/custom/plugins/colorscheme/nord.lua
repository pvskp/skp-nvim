local set_hl = function(hl_group_name, colors)
  vim.api.nvim_set_hl(0, hl_group_name, colors)
end


nord = {
  black = "#2E3440",             -- nord0 in palette
  dark_gray = "#3B4252",         -- nord1 in palette
  gray = "#434C5E",              -- nord2 in palette
  light_gray = "#4C566A",        -- nord3 in palette
  light_gray_bright = "#616E88", -- out of palette
  darkest_white = "#D8DEE9",     -- nord4 in palette
  darker_white = "#E5E9F0",      -- nord5 in palette
  white = "#ECEFF4",             -- nord6 in palette
  teal = "#8FBCBB",              -- nord7 in palette
  off_blue = "#88C0D0",          -- nord8 in palette
  glacier = "#81A1C1",           -- nord9 in palette
  blue = "#5E81AC",              -- nord10 in palette
  red = "#BF616A",               -- nord11 in palette
  orange = "#D08770",            -- nord12 in palette
  yellow = "#EBCB8B",            -- nord13 in palette
  green = "#A3BE8C",             -- nord14 in palette
  purple = "#B48EAD",            -- nord15 in palette
  none = "NONE",
}


local function set_treesitter_hl()
  set_hl('TreesitterContextLineNumber', { bg = nord.dark_gray })
  set_hl('TreesitterContextBottom', { bg = nord.dark_gray, sp = nord.gray, underline = true }) -- Adds underline to TreesitterContextBottom
  set_hl('TreesitterContext', { bg = nord.dark_gray })
end


local function set_telescope_hl()
  local TelescopePrompt = {
    TelescopeNormal = { bg = nord.black },
    TelescopeBorder = { fg = "NvimDarkGrey3", bg = "NvimDarkGrey3" },

    TelescopeResultsNormal = { bg = nord.dark_gray },
    TelescopeResultsBorder = { fg = nord.dark_gray, bg = nord.dark_gray },
    TelescopeResultTitle = {
      fg = nord.dark_gray,
      bg = nord.dark_gray
    },

    TelescopePreviewNormal = { bg = nord.gray },
    TelescopePreviewBorder = { fg = nord.gray, bg = nord.gray },
    TelescopePreviewTitle = { bg = nord.gray },
    TelescopePreviewLine = { bg = nord.light_gray_bright },

    TelescopePromptNormal = { fg = 'White', bg = nord.light_gray, },
    TelescopePromptBorder = { fg = nord.light_gray, bg = nord.light_gray, },
    TelescopePromptTitle = { fg = nord.light_gray, bg = nord.light_gray, },
    TelescopePromptCounter = { fg = nord.teal },

    TelescopeSelection = { fg = "White", bg = nord.gray, bold = true },
    TelescopeSelectionCaret = { fg = nord.green, bg = nord.gray },
  }

  for hl, col in pairs(TelescopePrompt) do
    set_hl(hl, col)
  end
end

local function other_color_improvements()
  set_hl('MatchParen', { bg = nord.red })
  set_hl('CursorlineNr', { fg = nord.orange, bg = nord.black, bold = true })
end

-- set_telescope_hl()
other_color_improvements()
set_treesitter_hl()


return {
  'shaunsingh/nord.nvim',
  priority = 1000,
  lazy = false,
  init = function()
    vim.opt.cursorlineopt = 'both'
  end,
  config = function()
    -- Example config in lua
    vim.g.nord_contrast = true
    vim.g.nord_borders = false
    vim.g.nord_disable_background = false
    vim.g.nord_italic = true
    vim.g.nord_uniform_diff_background = true
    vim.g.nord_bold = true

    -- Load the colorscheme
    require('nord').set()

    set_telescope_hl()
    set_treesitter_hl()
    other_color_improvements()
  end,
}
