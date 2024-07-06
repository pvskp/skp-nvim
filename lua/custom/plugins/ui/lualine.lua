return {
  'nvim-lualine/lualine.nvim',
  event = 'VimEnter',
  init = function()
    vim.opt.showmode = false
  end,

  config = function()
    local opts = require 'custom.plugins.ui.lualine.themes.supax'
    if vim.g.colors_name == nil then
      local default_theme = require 'custom.plugins.ui.lualine.themes.colors.default'
      opts.options.theme = default_theme
      require('lualine').setup(opts)
      return
    end
    require('lualine').setup(opts)
  end,
}
