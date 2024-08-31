local set_hl = function(hl_group_name, colors)
  vim.api.nvim_set_hl(0, hl_group_name, colors)
end

local function set_treesitter_hl()
  set_hl('TreesitterContextLineNumber', { bg = Nord.dark_gray })
  set_hl('TreesitterContextBottom', { bg = Nord.dark_gray, sp = Nord.gray, underline = true }) -- Adds underline to TreesitterContextBottom
  set_hl('TreesitterContext', { bg = Nord.dark_gray })
  set_hl('@string', { fg = Nord.yellow })

  set_hl('@text.diff.add.diff', { bold = true, fg = Nord.green })
  set_hl('@text.diff.delete.diff', { bold = true, fg = Nord.red })
end

local function set_gitsigns_hl()
  set_hl('GitSignsCurrentLineBlame', { fg = Nord.light_gray_bright })
end

local function set_telescope_hl()
  local TelescopePrompt = {
    TelescopeNormal = { bg = Nord.black },
    TelescopeBorder = { fg = 'NvimDarkGrey3', bg = 'NvimDarkGrey3' },

    TelescopeResultsNormal = { bg = Nord.dark_gray },
    TelescopeResultsBorder = { fg = Nord.dark_gray, bg = Nord.dark_gray },
    TelescopeResultTitle = {
      fg = Nord.dark_gray,
      bg = Nord.dark_gray,
    },

    TelescopePreviewNormal = { bg = Nord.gray },
    TelescopePreviewBorder = { fg = Nord.gray, bg = Nord.gray },
    TelescopePreviewTitle = { bg = Nord.gray },
    TelescopePreviewLine = { bg = Nord.light_gray_bright },

    TelescopePromptNormal = { fg = 'White', bg = Nord.light_gray },
    TelescopePromptBorder = { fg = Nord.light_gray, bg = Nord.light_gray },
    TelescopePromptTitle = { fg = Nord.light_gray, bg = Nord.light_gray },
    TelescopePromptCounter = { fg = Nord.teal },

    TelescopeSelection = { fg = 'White', bg = Nord.gray, bold = true },
    TelescopeSelectionCaret = { fg = Nord.green, bg = Nord.gray },
  }

  for hl, col in pairs(TelescopePrompt) do
    set_hl(hl, col)
  end
end

local function other_color_improvements()
  set_hl('MatchParen', { bg = Nord.red })
  set_hl('CursorlineNr', { fg = Nord.orange, bg = Nord.black, bold = true })
end

-- set_telescope_hl()
other_color_improvements()
set_treesitter_hl()
set_gitsigns_hl()

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
    set_gitsigns_hl()
  end,
}
