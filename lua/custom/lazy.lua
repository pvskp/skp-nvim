local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup {
  spec = LAZY_PLUGIN_SPEC,
  defaults = {
    lazy = true,
  },
  install = {
    colorscheme = {
      'default',
      'tokyonight-night',
      'catppuccin',
      'adwaita',
      'habamax',
    },
  },
  ui = {
    border = Borders.simple,
  },
  checker = {
    enabled = true,
    notify = false,
  },
  change_detection = {
    enabled = true,
    notify = false,
  },
  dev = {
    path = '~/Documents/repos/nvim-plugins/',
  },
}
