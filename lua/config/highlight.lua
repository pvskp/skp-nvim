vim.api.nvim_create_autocmd({ 'ColorScheme', 'BufEnter' }, {
  pattern = '*',
  callback = function()
    local normal_hl = vim.api.nvim_get_hl(0, { name = 'Normal' })
    local darker = Dark_a_color(normal_hl.bg, 6)
    local darker2 = Dark_a_color(darker, 6)
    local darker3 = Dark_a_color(darker2, 6)
    local darker4 = Dark_a_color(darker3, 6)

    vim.api.nvim_set_hl(0, 'TreesitterContext', { bg = darker })
    vim.api.nvim_set_hl(0, 'TreesitterContextBottom', { bg = darker, underline = false })
    vim.api.nvim_set_hl(0, 'TreesitterContextLineNumber', { bg = darker })

    vim.api.nvim_set_hl(0, 'WinBar', { bg = darker })

    -- transparent background
    -- vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
    vim.api.nvim_set_hl(0, 'NormalFloat', { bg = darker2 })
    vim.api.nvim_set_hl(0, 'FloatBorder', { fg = Fg('NormalFloat'), bg = 'none' })
    -- vim.api.nvim_set_hl(0, 'FloatBorder', { bg = darker })
    vim.api.nvim_set_hl(0, 'WinSeparator', { bg = darker, fg = darker })
    -- vim.api.nvim_set_hl(0, 'Pmenu', { bg = 'none' })
    vim.api.nvim_set_hl(0, 'Terminal', { bg = 'none' })
    vim.api.nvim_set_hl(0, 'EndOfBuffer', { bg = 'none' })
    vim.api.nvim_set_hl(0, 'FoldColumn', { bg = 'none' })
    vim.api.nvim_set_hl(0, 'Folded', { bg = 'none' })
    vim.api.nvim_set_hl(0, 'SignColumn', { bg = 'none' })
    vim.api.nvim_set_hl(0, 'NormalNC', { bg = 'none' })
    vim.api.nvim_set_hl(0, 'WhichKeyFloat', { bg = 'none' })
    vim.api.nvim_set_hl(0, 'TelescopeBorder', { bg = 'none' })
    vim.api.nvim_set_hl(0, 'TelescopeNormal', { bg = 'none' })
    vim.api.nvim_set_hl(0, 'SnacksPickerInputBorder', { bg = 'none' })
    vim.api.nvim_set_hl(0, 'TelescopePromptBorder', { bg = 'none' })
    vim.api.nvim_set_hl(0, 'TelescopePromptTitle', { bg = 'none' })

    --- snacks
    vim.api.nvim_set_hl(0, 'SnacksPickerPreview', {})
    vim.api.nvim_set_hl(0, 'SnacksPickerInputBorder', { bg = darker3, fg = darker3 })
    vim.api.nvim_set_hl(0, 'SnacksPickerInput', { bg = darker4 })
    -- vim.api.nvim_set_hl(0, 'SnacksPickerInputBorder', { bg = darker2 })
    vim.api.nvim_set_hl(0, 'SnacksPickerList', { bg = darker2 })
    vim.api.nvim_set_hl(0, 'SnacksPickerBorder', { link = 'SnacksPickerList' })
    vim.api.nvim_set_hl(0, 'SnacksPickerPreview', { bg = darker3 })
    vim.api.nvim_set_hl(0, 'SnacksPickerPreviewBorder', { bg = darker3 })
    vim.api.nvim_set_hl(0, 'SnacksPickerInputTitle', { bg = 'red' })
    vim.api.nvim_set_hl(0, 'SnacksPickerBoxTitle', { bg = 'red' })

    --- vimwiki
    -- vim.api.nvim_set_hl(0, 'VimwikiLink', { bold = true })
    vim.api.nvim_set_hl(0, 'SnacksPickerInputTitle', { bg = 'red' })

    --- blink

    -- vim.api.nvim_set_hl(0, 'BlinkCmpMenuBorder', { link = 'Pmenu' })
    -- vim.api.nvim_set_hl(0, 'LineNr', { bg = 'none' })

    vim.api.nvim_set_hl(0, 'GitSignsAdd', { force = true, fg = Fg('GitSignsAdd'), bg = 'none' })
    vim.api.nvim_set_hl(0, 'GitSignsDelete', { force = true, fg = Fg('GitSignsDelete'), bg = 'none' })
    vim.api.nvim_set_hl(0, 'GitSignsChange', { force = true, fg = Fg('GitSignsChange'), bg = 'none' })

    -- stylua: ignore start
    vim.api.nvim_set_hl( 0, 'DiagnosticSignHint', { force = true, fg = Fg('DiagnosticSignHint'), bg = 'none' })
    vim.api.nvim_set_hl( 0, 'DiagnosticSignInfo', { force = true, fg = Fg('DiagnosticSignInfo'), bg = 'none' })
    vim.api.nvim_set_hl( 0, 'DiagnosticSignWarn', { force = true, fg = Fg('DiagnosticSignWarn'), bg = 'none' })
    vim.api.nvim_set_hl( 0, 'DiagnosticSignError', { force = true, fg = Fg('DiagnosticSignError'), bg = 'none' })
    -- stylua: ignore end

    vim.api.nvim_set_hl(0, 'CursorlineNr', { force = true, bg = 'none' })

    -- vim.api.nvim_set_hl(0, 'LspReferenceWrite', { force = true, underline = false })

    -- vim.api.nvim_set_hl(0, 'String', { fg = Fg('diffChanged'), italic = true })

    vim.api.nvim_set_hl(0, '@variable.kulala_http', {
      fg = vim.g.terminal_color_10,
      underline = false,
    })

    vim.api.nvim_set_hl(0, '@punctuation.bracket.kulala_http', {
      fg = vim.g.terminal_color_10,
      underline = false,
    })

    vim.api.nvim_set_hl(0, '@string.special.url.kulala_http', {
      force = true,
      fg = Fg('@string.special.url.kulala_http'),
      bg = Bg('Visual'),
      underline = false,
    })
  end,
})
