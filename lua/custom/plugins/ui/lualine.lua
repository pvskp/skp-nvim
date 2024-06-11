return {
  'nvim-lualine/lualine.nvim',
  event = 'VimEnter',
  -- lazy = false,
  config = function()
    -- local opts = require 'custom.plugins.ui.lualine.themes.organic'
    local opts = require 'custom.plugins.ui.lualine.themes.supa'
    -- local opts = require 'lualine.themes.supa'
    -- local opts = {}
    require('lualine').setup(opts)
  end,
}
