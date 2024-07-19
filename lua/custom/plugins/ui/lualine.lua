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

    if vim.g.colors_name == 'nord' then
      vim.api.nvim_set_hl(0, 'lualine_a_inactive', { fg = nord.white, bg = nord.light_gray })
    end
  end,
}
