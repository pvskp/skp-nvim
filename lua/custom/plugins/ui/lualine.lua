return {
  'nvim-lualine/lualine.nvim',
  event = 'VimEnter',
  init = function()
    vim.opt.showmode = false
  end,

  -- lazy = false,
  config = function()
    -- local opts = require 'custom.plugins.ui.lualine.themes.organic'
    -- local opts = require 'custom.plugins.ui.lualine.themes.supa'
    local opts = require 'custom.plugins.ui.lualine.themes.supax'
    -- local opts = require 'lualine.themes.supa'
    -- local opts = {}
    require('lualine').setup(opts)
  end,
}
