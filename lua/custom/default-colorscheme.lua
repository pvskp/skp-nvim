local line_nr_bg = "NvimDarkGray3"

local function set_telescope_colors(dark)
  if dark then
    vim.api.nvim_set_hl(0, 'NewCustomTelescope', {
      bg = "#0f1116"
    })

    local telescope_selection = { bg = "NvimLightGreen" }

    vim.api.nvim_set_hl(0, 'TelescopeSelection', { fg = "White", bg = "NvimDarkMagenta", bold = true })
    vim.api.nvim_set_hl(0, 'TelescopeSelectionCaret', { fg = "Orange", bg = "NvimDarkMagenta" })

    vim.api.nvim_set_hl(0, 'TelescopeNormal', { link = "NewCustomTelescope" })
    vim.api.nvim_set_hl(0, 'TelescopeBorder', { link = "NewCustomTelescope" })
    -- vim.api.nvim_set_hl(0, 'TelescopePromptBorder', { underline = true, sp = "White" })
    vim.api.nvim_set_hl(0, 'TelescopePromptBorder', { link = "NewCustomTelescope" })
    vim.api.nvim_set_hl(0, 'TelescopePreviewBorder', { link = "NewCustomTelescope" })
    vim.api.nvim_set_hl(0, 'TelescopeResultsBorder', { link = "NewCustomTelescope" })
  end
end

local function set_treesitter_colors(dark)
  if dark then
    vim.api.nvim_set_hl(0, '@spell', { italic = true })
    vim.api.nvim_set_hl(0, '@function', { bold = true, fg = "NvimLightBlue" })
    vim.api.nvim_set_hl(0, 'Identifier', { bold = false, fg = "NvimLightCyan" })
    vim.api.nvim_set_hl(0, 'Statement', { bold = true, fg = "NvimLightYellow" })
    vim.api.nvim_set_hl(0, 'Type', { italic = true, fg = "NvimLightCyan" })


    -- vim.api.nvim_set_hl(0, 'TreesitterContextLineNumber', { link = "LineNr" })
    vim.api.nvim_set_hl(0, 'TreesitterContextLineNumber', { bg = "NvimDarkGrey2", fg = "NvimLightGrey3" })
    vim.api.nvim_set_hl(0, 'TreesitterContextBottom', { sp = "NvimDarkGrey3", underline = true }) -- Adds underline to TreesitterContextBottom
    vim.api.nvim_set_hl(0, 'TreesitterContext', { bg = "NvimDarkGrey1" })
  end
end

--- Set colors for diagnostics
---@param dark boolean
local function set_diagnostic_colors(dark)
  if dark then
    local diagnostic_colors = {
      info = "NvimLightGreen",
      hint = "NvimLightBlue",
      warn = "NvimLightYellow",
      error = "NvimLightRed",
    }

    vim.api.nvim_set_hl(0, 'DiagnosticSignError', { fg = diagnostic_colors.error, bg = line_nr_bg })
    vim.api.nvim_set_hl(0, 'DiagnosticSignHint', { fg = diagnostic_colors.hint, bg = line_nr_bg })
    vim.api.nvim_set_hl(0, 'DiagnosticSignInfo', { fg = diagnostic_colors.info, bg = line_nr_bg })
    vim.api.nvim_set_hl(0, 'DiagnosticSignOk', { fg = diagnostic_colors.info, bg = line_nr_bg })
    vim.api.nvim_set_hl(0, 'DiagnosticSignWarn', { fg = diagnostic_colors.warn, bg = line_nr_bg })

    vim.api.nvim_set_hl(0, 'DiagnosticUnderlineError', { undercurl = true, sp = diagnostic_colors.error })
    vim.api.nvim_set_hl(0, 'DiagnosticUnderlineHint', { undercurl = true, sp = diagnostic_colors.hint })
    vim.api.nvim_set_hl(0, 'DiagnosticUnderlineInfo', { undercurl = true, sp = diagnostic_colors.info })
    vim.api.nvim_set_hl(0, 'DiagnosticUnderlineWarn', { undercurl = true, sp = diagnostic_colors.warn })
  end
end

local function set_whichkey(dark)
  if dark then
    vim.api.nvim_set_hl(0, "WhichKeyFloat", { bg = "#0f1116" })
    vim.api.nvim_set_hl(0, "WhichKey", { bg = "#0f1116" })
    vim.api.nvim_set_hl(0, "WhichKeyDesc", { bg = "#0f1116", fg = "NvimLightMagenta" })
  end
end

local function dark_highlight()
  -- vim.api.nvim_set_hl(0, 'Normal', { bg = "#1a1a1a" })
  vim.api.nvim_set_hl(0, 'Float', { fg = "NvimLightGray2", bg = "NvimDarkGrey2" })

  vim.api.nvim_set_hl(0, 'Normal', { fg = "White" })
  vim.api.nvim_set_hl(0, 'NormalFloat', { fg = "White" })
  vim.api.nvim_set_hl(0, 'FloatBorder', { fg = "White" })

  vim.api.nvim_set_hl(0, 'LineNr', { fg = 'Gray', bg = line_nr_bg })
  vim.api.nvim_set_hl(0, 'CursorlineNr', { fg = "NvimLightCyan", bg = line_nr_bg, bold = true })


  vim.api.nvim_set_hl(0, 'Added', { fg = 'NvimLightGreen', bg = line_nr_bg })
  vim.api.nvim_set_hl(0, 'Removed', { fg = 'NvimLightRed', bg = line_nr_bg })
  vim.api.nvim_set_hl(0, 'Changed', { fg = 'NvimLightYellow', bg = line_nr_bg })


  set_diagnostic_colors(true)
  set_telescope_colors(true)
  set_treesitter_colors(true)

  -- vim.api.nvim_set_hl(0, 'WhichKeyFloat', { link = "NewCustomTelescope" })
  set_whichkey(true)
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
