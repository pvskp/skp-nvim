return {
  'norcalli/nvim-colorizer.lua',
  event = 'VeryLazy',
  -- lazy = false,
  init = function()
    vim.cmd [[set termguicolors]]
  end,
  config = function()
    local colorizer = require 'colorizer'
    colorizer.setup()
  end,
}
