local line_nr_bg = ''

-- MiniFiles highlights
vim.api.nvim_create_autocmd('User', {
  pattern = 'MiniFilesWindowOpen',
  callback = function(args)
    set_hl("MiniFilesNormal", { bg = nil })
  end,
})


local function diffs_colors(dark)
  if dark then
    set_hl('DiffAdd', { fg = 'NvimLightGreen', bg = line_nr_bg })
    set_hl('DiffChange', { fg = 'NvimLightYellow', bg = line_nr_bg })
    set_hl('DiffDelete', { fg = 'NvimLightRed', bg = line_nr_bg })
    set_hl('DiffText', { fg = 'NvimLightBlue', bg = line_nr_bg })
  end
end

local function completion_menu_colors(dark)
  if dark then
    set_hl('NormalFloat', { bg = 'NvimDarkGrey1' })
  end
end

local function telescope_colors(dark)
  if dark then
    set_hl('NewCustomTelescope', {
      bg = '#0f1116',
    })

    -- local telescope_selection = { bg = "NvimLightGreen" }

    local TelescopePrompt = {
      TelescopeSelection = { fg = 'White', bg = '#3B3E44', bold = true },
      TelescopeSelectionCaret = { fg = 'Magenta', bg = '#3B3E44' },

      TelescopeNormal = { link = 'NewCustomTelescope' },
      TelescopeBorder = { fg = 'NvimDarkGrey3', bg = 'NvimDarkGrey3' },

      TelescopeResultsNormal = { bg = 'NvimDarkGrey3' },
      TelescopeResultsBorder = { fg = 'NvimDarkGrey3', bg = 'NvimDarkGrey3' },
      TelescopeResultTitle = { fg = 'NvimDarkGrey3', bg = 'NvimDarkGrey3' },

      TelescopePreviewNormal = { bg = '#0f1116' },
      TelescopePreviewBorder = { fg = '#0f1116', bg = '#0f1116' },
      TelescopePreviewTitle = { bg = '#0f1116' },

      TelescopePromptNormal = { fg = 'White', bg = 'NvimDarkGrey4' },
      TelescopePromptBorder = { fg = 'NvimDarkGrey4', bg = 'NvimDarkGrey4' },
      TelescopePromptTitle = { fg = 'NvimDarkGrey4', bg = 'NvimDarkGrey4' },
    }

    for hl, col in pairs(TelescopePrompt) do
      set_hl(hl, col)
    end
  end
end

local function treesitter_colors(dark)
  if dark then
    set_hl('@spell', { italic = false })
    set_hl('@function', { bold = true, fg = 'NvimLightBlue' })
    set_hl('Identifier', { bold = false, fg = 'NvimLightCyan' })
    set_hl('Statement', { bold = true, fg = 'NvimLightYellow' })
    set_hl('Type', { italic = false, fg = 'NvimLightCyan' })
    set_hl('@conditional', { italic = false, bold = true, fg = 'White' })
    -- set_hl( 'Constant', { bold = true, fg = "Magenta" })
    set_hl('@include', { bold = true, fg = 'LightMagenta' })
    set_hl('@text.diff.add.diff', { bold = true, bg = 'NvimLightGreen', fg = 'Black' })
    set_hl('@text.diff.delete.diff', { bold = true, bg = 'NvimLightRed', fg = 'Black' })
    -- set_hl( '@field', { bold = true, fg = "Orange" })

    -- set_hl( 'TreesitterContextLineNumber', { link = "LineNr" })
    set_hl('TreesitterContextLineNumber', { bg = 'NvimDarkGrey2', fg = 'NvimLightGrey3' })
    set_hl('TreesitterContextBottom', { sp = 'NvimDarkGrey3', underline = true }) -- Adds underline to TreesitterContextBottom
    set_hl('TreesitterContext', { bg = 'NvimDarkGrey1' })
  end
end

--- Set colors for diagnostics
---@param dark boolean
local function diagnostic_colors(dark)
  if dark then
    local diagnostic_colors_opts = {
      info = 'NvimLightGreen',
      hint = 'NvimLightBlue',
      warn = 'NvimLightYellow',
      error = 'NvimLightRed',
    }

    set_hl('DiagnosticSignError', { fg = diagnostic_colors_opts.error, bg = line_nr_bg })
    set_hl('DiagnosticSignHint', { fg = diagnostic_colors_opts.hint, bg = line_nr_bg })
    set_hl('DiagnosticSignInfo', { fg = diagnostic_colors_opts.info, bg = line_nr_bg })
    set_hl('DiagnosticSignOk', { fg = diagnostic_colors_opts.info, bg = line_nr_bg })
    set_hl('DiagnosticSignWarn', { fg = diagnostic_colors_opts.warn, bg = line_nr_bg })

    set_hl('DiagnosticUnderlineError', { undercurl = true, sp = diagnostic_colors_opts.error })
    set_hl('DiagnosticUnderlineHint', { undercurl = true, sp = diagnostic_colors_opts.hint })
    set_hl('DiagnosticUnderlineInfo', { undercurl = true, sp = diagnostic_colors_opts.info })
    set_hl('DiagnosticUnderlineWarn', { undercurl = true, sp = diagnostic_colors_opts.warn })
  end
end

local function whichkey_colors(dark)
  if dark then
    -- set_hl( "WhichKeyBorder", { bg = "#0f1116" })
    -- set_hl( "WhichKeyValue", { bg = "#0f1116" })
    -- set_hl( "WhichKeyTitle", { bg = "#0f1116" })

    set_hl('WhichKey', { bg = '#0f1116' })
    -- set_hl( "WhichKeyTitle", { bg = "#0f1116" })
    set_hl('WhichKeyNormal', { bg = '#0f1116' })
    set_hl('WhichKeyDesc', { bg = '#0f1116', fg = 'NvimLightMagenta' })
  end
end

local function dark_highlight()
  -- set_hl( 'Normal', {})
  -- set_hl( 'NormalNC', { bg = "NvimDarkGray1" })
  set_hl('Float', { fg = 'NvimLightGray2', bg = 'NvimDarkGrey2' })
  set_hl('FloatBorder', { fg = 'White' })
  set_hl('LineNr', { fg = 'Gray', bg = line_nr_bg })
  set_hl('CursorlineNr', { fg = 'NvimLightGreen', bg = line_nr_bg, bold = true })
  set_hl('Added', { fg = 'NvimLightGreen', bg = line_nr_bg })
  set_hl('Removed', { fg = 'NvimLightRed', bg = line_nr_bg })
  set_hl('Changed', { fg = 'NvimLightYellow', bg = line_nr_bg })
  set_hl('LazyProgressTodo', { fg = '#282828', bg = nil })
  set_hl('SignColumn', { bg = line_nr_bg })

  -- telescope_colors(true)
  diagnostic_colors(true)
  treesitter_colors(true)
  diffs_colors(true)
  completion_menu_colors(true)

  whichkey_colors(true)
end

local function light_highlight() end

if vim.g.colors_name == nil then
  if vim.opt.background._value == 'dark' then
    dark_highlight()
  else
    light_highlight()
  end
end
