return {
  'shaunsingh/nord.nvim',
  priority = 1000,
  lazy = false,
  init = function()
    vim.opt.cursorlineopt = 'both'
  end,
  config = function()
    require('nord').set()
    local colors = require('nord.named_colors')
    vim.api.nvim_set_hl(0, 'SnacksPickerDir', { fg = colors.glacier })
    vim.api.nvim_set_hl(0, 'WinbarNC', { bg = 'none' })
    vim.api.nvim_set_hl(0, '@string', { fg = colors.yellow, italic = true })
  end,
}
