local line_nr_bg = ''

-- Git diff
-- set_hl('DiffAdd', { fg = 'NvimLightGreen', bg = line_nr_bg })
-- set_hl('DiffChange', { fg = 'NvimLightYellow', bg = line_nr_bg })
-- set_hl('DiffDelete', { fg = 'NvimLightRed', bg = line_nr_bg })
-- set_hl('DiffText', { fg = 'NvimLightBlue', bg = line_nr_bg })

--- Treesitter
set_hl('@spell', { italic = false })
set_hl('@function', { bold = true, fg = 'NvimLightBlue' })
set_hl('Identifier', { bold = false, fg = 'NvimLightCyan' })
set_hl('Statement', { bold = true, fg = 'NvimLightYellow' })
set_hl('Type', { italic = false, fg = 'NvimLightCyan' })
set_hl('@conditional', { italic = false, bold = true, fg = 'White' })
set_hl('@include', { bold = true, fg = 'LightMagenta' })
set_hl('@text.diff.add.diff', { bold = true, bg = 'NvimLightGreen', fg = 'Black' })
set_hl('@text.diff.delete.diff', { bold = true, bg = 'NvimLightRed', fg = 'Black' })

set_hl('TreesitterContextLineNumber', { bg = 'NvimDarkGrey1', fg = 'NvimLightGrey3' })
set_hl('TreesitterContextBottom', { sp = 'NvimDarkGrey3', underline = true })
set_hl('TreesitterContext', { bg = 'NvimDarkGrey1' })

local diagnostic_colors_opts = {
  info = 'NvimLightGreen',
  hint = 'NvimLightBlue',
  warn = 'NvimLightYellow',
  error = 'NvimLightRed',
}

-- diagnostics
set_hl('DiagnosticSignError', { fg = diagnostic_colors_opts.error, bg = line_nr_bg })
set_hl('DiagnosticSignHint', { fg = diagnostic_colors_opts.hint, bg = line_nr_bg })
set_hl('DiagnosticSignInfo', { fg = diagnostic_colors_opts.info, bg = line_nr_bg })
set_hl('DiagnosticSignOk', { fg = diagnostic_colors_opts.info, bg = line_nr_bg })
set_hl('DiagnosticSignWarn', { fg = diagnostic_colors_opts.warn, bg = line_nr_bg })

set_hl('DiagnosticUnderlineError', { undercurl = true, sp = diagnostic_colors_opts.error })
set_hl('DiagnosticUnderlineHint', { undercurl = true, sp = diagnostic_colors_opts.hint })
set_hl('DiagnosticUnderlineInfo', { undercurl = true, sp = diagnostic_colors_opts.info })
set_hl('DiagnosticUnderlineWarn', { undercurl = true, sp = diagnostic_colors_opts.warn })

-- Which key
-- set_hl('WhichKey', { bg = '#0f1116' })
-- set_hl('WhichKeyNormal', { bg = '#0f1116' })
-- set_hl('WhichKeyDesc', { bg = '#0f1116', fg = 'NvimLightMagenta' })

-- default neovim highlight groups
-- set_hl('CursorLine', { bg = 'NvimDarkCyan' })
set_hl('Visual', { bg = 'NvimDarkBlue' })
set_hl('NormalFloat', { bg = 'NvimDarkGrey1' })
set_hl('Float', { fg = 'NvimLightGray2', bg = 'NvimDarkGrey2' })
set_hl('FloatBorder', { fg = 'White' })
set_hl('LineNr', { fg = 'Gray', bg = line_nr_bg })
set_hl('CursorlineNr', { fg = 'NvimLightGreen', bg = line_nr_bg, bold = true })
set_hl('Added', { fg = 'NvimLightGreen', bg = line_nr_bg })
set_hl('Removed', { fg = 'NvimLightRed', bg = line_nr_bg })
set_hl('Changed', { fg = 'NvimLightYellow', bg = line_nr_bg })
set_hl('LazyProgressTodo', { fg = '#282828', bg = nil })
set_hl('SignColumn', { bg = line_nr_bg })
