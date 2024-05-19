return {
  'Shatur/neovim-ayu',
  lazy = false,
  priority = 1000,
  opts = {
    -- mirage = true,
    options = {
      theme = 'ayu',
    },
  },
  config = function(_, opts)
    require('ayu').setup(opts)
    vim.cmd 'colorscheme ayu'
  end,
}
