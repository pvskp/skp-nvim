return {
  'mcchrish/zenbones.nvim',
  lazy = false,
  priority = 1000,
  config = function()
    vim.g.zenbones_compat = 1 -- needed as I don't want to install lush
    vim.cmd [[colorscheme zenbones]]
  end,
}
