return {
  'echasnovski/mini.nvim',
  lazy = false,
  version = false,
  opts = {
    cursor = {
      enable = true,
    },
    scroll = {
      enable = false,
    },
    resize = {
      enable = true,
    },

    open = {
      enable = true,
    },

    close = {
      enable = true,
    },
  },
  config = function(_, opts)
    require('mini.animate').setup(opts)
  end,
}
