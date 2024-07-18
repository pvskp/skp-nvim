local line_nr_bg = ""

local set_hl = vim.api.nvim_set_hl

local function diffs_colors(dark)
  if dark then
    set_hl(0, 'DiffAdd', { fg = "NvimLightGreen", bg = line_nr_bg })
    set_hl(0, 'DiffChange', { fg = "NvimLightYellow", bg = line_nr_bg })
    set_hl(0, 'DiffDelete', { fg = "NvimLightRed", bg = line_nr_bg })
    set_hl(0, 'DiffText', { fg = "NvimLightBlue", bg = line_nr_bg })
  end
end


local function completion_menu_colors(dark)
  if dark then
    set_hl(0, 'NormalFloat', { bg = "NvimDarkGrey1" })
  end
end

local function telescope_colors(dark)
  if dark then
    set_hl(0, 'NewCustomTelescope', {
      bg = "#0f1116"
    })

    -- local telescope_selection = { bg = "NvimLightGreen" }


    local TelescopePrompt = {
      TelescopeSelection = { fg = "White", bg = "#3B3E44", bold = true },
      TelescopeSelectionCaret = { fg = "Magenta", bg = "#3B3E44" },

      TelescopeNormal = { link = "NewCustomTelescope" },
      TelescopeBorder = { fg = "NvimDarkGrey3", bg = "NvimDarkGrey3" },

      TelescopeResultsNormal = { bg = "NvimDarkGrey3" },
      TelescopeResultsBorder = { fg = "NvimDarkGrey3", bg = "NvimDarkGrey3" },
      TelescopeResultTitle = { fg = "NvimDarkGrey3", bg = "NvimDarkGrey3" },

      TelescopePreviewNormal = { bg = "#0f1116" },
      TelescopePreviewBorder = { fg = "#0f1116", bg = "#0f1116" },
      TelescopePreviewTitle = { bg = "#0f1116" },

      TelescopePromptNormal = { fg = 'White', bg = 'NvimDarkGrey4', },
      TelescopePromptBorder = { fg = 'NvimDarkGrey4', bg = 'NvimDarkGrey4', },
      TelescopePromptTitle = { fg = 'NvimDarkGrey4', bg = 'NvimDarkGrey4', },
    }

    for hl, col in pairs(TelescopePrompt) do
      set_hl(0, hl, col)
    end
  end
end

local function treesitter_colors(dark)
  if dark then
    set_hl(0, '@spell', { italic = false })
    set_hl(0, '@function', { bold = true, fg = "NvimLightBlue" })
    set_hl(0, 'Identifier', { bold = false, fg = "NvimLightCyan" })
    set_hl(0, 'Statement', { bold = true, fg = "NvimLightYellow" })
    set_hl(0, 'Type', { italic = false, fg = "NvimLightCyan" })
    set_hl(0, '@conditional', { italic = false, bold = true, fg = "White" })
    set_hl(0, 'Constant', { bold = true, fg = "Magenta" })
    set_hl(0, '@include', { bold = true, fg = "Red" })
    set_hl(0, '@text.diff.add.diff', { bold = true, bg = "NvimLightGreen", fg = "Black" })
    set_hl(0, '@text.diff.delete.diff', { bold = true, bg = "NvimLightRed", fg = "Black" })
    -- set_hl(0, '@field', { bold = true, fg = "Orange" })


    -- set_hl(0, 'TreesitterContextLineNumber', { link = "LineNr" })
    set_hl(0, 'TreesitterContextLineNumber', { bg = "NvimDarkGrey2", fg = "NvimLightGrey3" })
    set_hl(0, 'TreesitterContextBottom', { sp = "NvimDarkGrey3", underline = true }) -- Adds underline to TreesitterContextBottom
    set_hl(0, 'TreesitterContext', { bg = "NvimDarkGrey1" })
  end
end

--- Set colors for diagnostics
---@param dark boolean
local function diagnostic_colors(dark)
  if dark then
    local diagnostic_colors_opts = {
      info = "NvimLightGreen",
      hint = "NvimLightBlue",
      warn = "NvimLightYellow",
      error = "NvimLightRed",
    }

    set_hl(0, 'DiagnosticSignError', { fg = diagnostic_colors_opts.error, bg = line_nr_bg })
    set_hl(0, 'DiagnosticSignHint', { fg = diagnostic_colors_opts.hint, bg = line_nr_bg })
    set_hl(0, 'DiagnosticSignInfo', { fg = diagnostic_colors_opts.info, bg = line_nr_bg })
    set_hl(0, 'DiagnosticSignOk', { fg = diagnostic_colors_opts.info, bg = line_nr_bg })
    set_hl(0, 'DiagnosticSignWarn', { fg = diagnostic_colors_opts.warn, bg = line_nr_bg })

    set_hl(0, 'DiagnosticUnderlineError', { undercurl = true, sp = diagnostic_colors_opts.error })
    set_hl(0, 'DiagnosticUnderlineHint', { undercurl = true, sp = diagnostic_colors_opts.hint })
    set_hl(0, 'DiagnosticUnderlineInfo', { undercurl = true, sp = diagnostic_colors_opts.info })
    set_hl(0, 'DiagnosticUnderlineWarn', { undercurl = true, sp = diagnostic_colors_opts.warn })
  end
end

local function whichkey_colors(dark)
  if dark then
    -- set_hl(0, "WhichKeyBorder", { bg = "#0f1116" })
    -- set_hl(0, "WhichKeyValue", { bg = "#0f1116" })
    -- set_hl(0, "WhichKeyTitle", { bg = "#0f1116" })

    set_hl(0, "WhichKey", { bg = "#0f1116" })
    -- set_hl(0, "WhichKeyTitle", { bg = "#0f1116" })
    set_hl(0, "WhichKeyNormal", { bg = "#0f1116" })
    set_hl(0, "WhichKeyDesc", { bg = "#0f1116", fg = "NvimLightMagenta" })
  end
end

local function dark_highlight()
  -- set_hl(0, 'Normal', {})
  set_hl(0, 'Float', { fg = "NvimLightGray2", bg = "NvimDarkGrey2" })
  -- set_hl(0, 'NormalNC', { bg = "NvimDarkGray1" })

  set_hl(0, 'FloatBorder', { fg = "White" })

  set_hl(0, 'LineNr', { fg = 'Gray', bg = line_nr_bg })
  set_hl(0, 'CursorlineNr', { fg = "NvimLightGreen", bg = line_nr_bg, bold = true })

  set_hl(0, 'Added', { fg = 'NvimLightGreen', bg = line_nr_bg })
  set_hl(0, 'Removed', { fg = 'NvimLightRed', bg = line_nr_bg })
  set_hl(0, 'Changed', { fg = 'NvimLightYellow', bg = line_nr_bg })

  set_hl(0, 'LazyProgressTodo', { fg = "#282828", bg = nil })
  set_hl(0, 'SignColumn', { bg = line_nr_bg })

  diagnostic_colors(true)
  telescope_colors(true)
  treesitter_colors(true)
  diffs_colors(true)
  completion_menu_colors(true)

  whichkey_colors(true)
end

local function light_highlight()
end

if vim.g.colors_name == nil then
  if vim.opt.background._value == "dark" then
    dark_highlight()
  else
    light_highlight()
  end
end
