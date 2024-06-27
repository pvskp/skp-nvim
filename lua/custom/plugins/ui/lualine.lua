return {
  'nvim-lualine/lualine.nvim',
  event = 'VimEnter',
  init = function()
    vim.opt.showmode = false
  end,

  config = function()
    local opts = require 'custom.plugins.ui.lualine.themes.supax'
    require('lualine').setup(opts)
  end,
}
