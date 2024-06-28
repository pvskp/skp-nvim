return {
  'Mofiqul/adwaita.nvim',
  lazy = false,
  priority = 1000,

  -- configure and set on startup
  config = function()
    vim.g.adwaita_darker = true             -- for darker version
    vim.g.adwaita_disable_cursorline = true -- to disable cursorline
    vim.g.adwaita_transparent = false       -- makes the background transparent
    vim.cmd 'colorscheme adwaita'

    -- local numberline_bg = "#282828"
    local numberline_bg = ""

    if vim.g.adwaita_darker then
      for _, v in ipairs { 'MiniFilesDirectory', 'MiniFilesNormal', 'MiniFilesTitle' } do
        vim.api.nvim_set_hl(0, v, {
          link = "NormalFloat"
        })
      end

      vim.api.nvim_set_hl(0, 'MiniFilesTitleFocused', {
        bg = "#282828",
        fg = "#33b2a4"
      })

      vim.api.nvim_set_hl(0, 'CursorlineNr', { fg = "#33b2a4", bg = numberline_bg }) -- Green number on CursorLine
    end

    vim.api.nvim_set_hl(0, 'LineNr', { fg = '#5e5c64', bg = numberline_bg })

    vim.api.nvim_set_hl(0, 'Added', { fg = 'Green', bg = numberline_bg })
    vim.api.nvim_set_hl(0, 'Removed', { fg = 'Red', bg = numberline_bg })
    vim.api.nvim_set_hl(0, 'Changed', { fg = 'Orange', bg = numberline_bg })


    vim.api.nvim_set_hl(0, 'DiagnosticUnderlineError', { undercurl = true, sp = 'Red' })
    vim.api.nvim_set_hl(0, 'DiagnosticUnderlineWarn', { undercurl = true, sp = 'Orange' })
    vim.api.nvim_set_hl(0, 'DiagnosticUnderlineInfo', { undercurl = true, sp = 'Blue' })
    vim.api.nvim_set_hl(0, 'DiagnosticUnderlineHint', { undercurl = true, sp = 'Green' })

    vim.api.nvim_set_hl(0, 'TreesitterContextLineNumber', { link = "NormalFloat" })
    vim.api.nvim_set_hl(0, 'TreesitterContextBottom', { sp = "NvimDarkGrey4", underline = true }) -- Adds underline to TreesitterContextBottom
  end,
}
