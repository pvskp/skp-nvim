local function custom_hl()
  -- local numberline_bg = ""
  local numberline_bg = '#1a1a1a'
  -- local numberline_bg = "#000000"

  -- vim.api.nvim_set_hl(0, 'Normal', { bg = "#1a1a1a" })
  vim.api.nvim_set_hl(0, 'NormalFloat', { fg = 'White' })
  vim.api.nvim_set_hl(0, 'FloatBorder', { fg = 'White' })

  vim.api.nvim_set_hl(0, 'MiniFilesTitleFocused', {
    -- bg = "#282828",
    fg = '#33b2a4',
  })

  for _, v in ipairs { 'MiniFilesDirectory', 'MiniFilesNormal', 'MiniFilesTitle' } do
    vim.api.nvim_set_hl(0, v, {
      link = 'NormalFloat',
    })
  end

  vim.api.nvim_set_hl(0, 'CursorlineNr', { fg = '#33b2a4', bg = numberline_bg }) -- Green number on CursorLine
  vim.api.nvim_set_hl(0, 'CursorLine', { fg = '#33b2a4' }) -- Green number on CursorLine
  vim.api.nvim_set_hl(0, 'LineNr', { fg = '#5e5c64', bg = numberline_bg })

  vim.api.nvim_set_hl(0, 'MatchParen', { fg = '#282828', bg = 'Red' })

  vim.api.nvim_set_hl(0, 'NewCustomTelescope', {
    bg = '#282828',
  })

  vim.api.nvim_set_hl(0, 'LazyProgressTodo', {
    fg = '#282828',
    bg = nil,
  })

  vim.api.nvim_set_hl(0, 'WhichKeyFloat', { link = 'NewCustomTelescope' })
  vim.api.nvim_set_hl(0, 'TelescopeNormal', { link = 'NewCustomTelescope' })
  vim.api.nvim_set_hl(0, 'TelescopeBorder', { link = 'NewCustomTelescope' })
  -- vim.api.nvim_set_hl(0, 'TelescopePromptBorder', { underline = true, sp = "White" })
  vim.api.nvim_set_hl(0, 'TelescopePromptBorder', { link = 'NewCustomTelescope' })
  vim.api.nvim_set_hl(0, 'TelescopePreviewBorder', { link = 'NewCustomTelescope' })
  vim.api.nvim_set_hl(0, 'TelescopeResultsBorder', { link = 'NewCustomTelescope' })

  vim.api.nvim_set_hl(0, 'DiagnosticSignOk', { fg = 'NvimLightGreen', bg = numberline_bg })
  vim.api.nvim_set_hl(0, 'DiagnosticSignWarn', { fg = 'Orange', bg = numberline_bg })
  vim.api.nvim_set_hl(0, 'DiagnosticSignInfo', { fg = 'Green', bg = numberline_bg })
  vim.api.nvim_set_hl(0, 'DiagnosticSignError', { fg = 'Red', bg = numberline_bg })
  vim.api.nvim_set_hl(0, 'DiagnosticSignHint', { fg = 'LightBlue', bg = numberline_bg })

  vim.api.nvim_set_hl(0, 'Added', { fg = 'Green', bg = numberline_bg })
  vim.api.nvim_set_hl(0, 'Removed', { fg = 'Red', bg = numberline_bg })
  vim.api.nvim_set_hl(0, 'Changed', { fg = 'Orange', bg = numberline_bg })

  vim.api.nvim_set_hl(0, 'DiagnosticUnderlineError', { undercurl = true, sp = 'Red' })
  vim.api.nvim_set_hl(0, 'DiagnosticUnderlineWarn', { undercurl = true, sp = 'Orange' })
  vim.api.nvim_set_hl(0, 'DiagnosticUnderlineInfo', { undercurl = true, sp = 'Blue' })
  vim.api.nvim_set_hl(0, 'DiagnosticUnderlineHint', { undercurl = true, sp = 'Green' })

  -- vim.api.nvim_set_hl(0, 'TreesitterContextLineNumber', { link = "NormalFloat" })
  vim.api.nvim_set_hl(0, 'TreesitterContextLineNumber', { link = 'LineNr' })
  vim.api.nvim_set_hl(0, 'TreesitterContextBottom', { sp = 'NvimDarkGrey4', underline = true }) -- Adds underline to TreesitterContextBottom
  -- vim.api.nvim_set_hl(0, 'TreesitterContext', { bg = "#1a1a1a" })                               -- Adds underline to TreesitterContextBottom
  vim.api.nvim_set_hl(0, 'TreesitterContext', { bg = '#0f0f0f' }) -- Adds underline to TreesitterContextBottom

  vim.api.nvim_set_hl(0, 'CmpItemKindMethod', { fg = 'Orange' })
  vim.api.nvim_set_hl(0, 'CmpItemKindField', { fg = 'LightBlue' })
  vim.api.nvim_set_hl(0, 'CmpItemKindText', { fg = 'White' })
  vim.api.nvim_set_hl(0, 'CmpItemKindFunction', { fg = 'Purple' })
  vim.api.nvim_set_hl(0, 'CmpItemKindConstructor', { fg = 'Orange' })
  vim.api.nvim_set_hl(0, 'CmpItemKindVariable', { fg = 'LightBlue' })
  vim.api.nvim_set_hl(0, 'CmpItemKindClass', { fg = 'DarkOrange' })
  vim.api.nvim_set_hl(0, 'CmpItemKindInterface', { fg = 'LightRed' })
  vim.api.nvim_set_hl(0, 'CmpItemKindModule', { fg = 'LightRed' })
  vim.api.nvim_set_hl(0, 'CmpItemKindProperty', { fg = 'Orange' })
  vim.api.nvim_set_hl(0, 'CmpItemKindUnit', { fg = 'Orange' })
  vim.api.nvim_set_hl(0, 'CmpItemKindValue', { fg = 'White' })
  vim.api.nvim_set_hl(0, 'CmpItemKindEnum', { fg = 'White' })
  vim.api.nvim_set_hl(0, 'CmpItemKindKeyword', { fg = 'White' })
  vim.api.nvim_set_hl(0, 'CmpItemKindSnippet', { fg = 'Green' })
  vim.api.nvim_set_hl(0, 'CmpItemKindColor', { fg = 'White' })
  vim.api.nvim_set_hl(0, 'CmpItemKindFile', { fg = 'White' })
  vim.api.nvim_set_hl(0, 'CmpItemKindReference', { fg = 'White' })
  vim.api.nvim_set_hl(0, 'CmpItemKindFolder', { fg = 'White' })
  vim.api.nvim_set_hl(0, 'CmpItemKindEnumMember', { fg = 'White' })
  vim.api.nvim_set_hl(0, 'CmpItemKindConstant', { fg = 'White' })
  vim.api.nvim_set_hl(0, 'CmpItemKindStruct', { fg = 'White' })
  vim.api.nvim_set_hl(0, 'CmpItemKindEvent', { fg = 'White' })
  vim.api.nvim_set_hl(0, 'CmpItemKindOperator', { fg = 'White' })
  vim.api.nvim_set_hl(0, 'CmpItemKindTypeParameter', { fg = 'White' })
  vim.api.nvim_set_hl(0, 'CmpItemAbbrMatchDefault', { fg = 'Green' })
end

return {
  'Mofiqul/adwaita.nvim',
  lazy = false,
  priority = 1000,

  -- configure and set on startup
  config = function()
    -- vim.g.adwaita_darker = true             -- for darker version
    vim.g.adwaita_disable_cursorline = true -- to disable cursorline
    vim.g.adwaita_transparent = false -- makes the background transparent
    vim.cmd 'colorscheme adwaita'

    custom_hl()
  end,
}
