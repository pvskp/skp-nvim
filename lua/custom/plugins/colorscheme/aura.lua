return {
  'techtuner/aura-neovim',
  lazy = false,
  priority = 1000,
  config = function()
    vim.cmd [[colorscheme aura ]]
    vim.cmd [[set termguicolors]]
  end,
}
