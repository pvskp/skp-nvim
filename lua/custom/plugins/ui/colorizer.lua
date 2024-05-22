return {
  'norcalli/nvim-colorizer.lua',
  lazy = false,
  init = function()
    vim.cmd [[set termguicolors]]
  end,
  config = function()
    require('colorizer').setup()
  end,
}
