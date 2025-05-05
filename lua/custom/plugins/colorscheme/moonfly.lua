return {
  'bluz71/vim-moonfly-colors',
  name = 'moonfly',
  lazy = false,
  priority = 1000,
  config = function()
    vim.cmd.colorscheme('moonfly')
    vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
    vim.api.nvim_set_hl(0, 'NormalNC', { bg = 'none' })
    vim.api.nvim_set_hl(0, 'CursorLineNr', { bg = 'none', fg = '#80a0ff' })
    vim.api.nvim_set_hl(0, 'TrueHighlighGroup', { link = 'MoonflyLime' })
    vim.api.nvim_set_hl(0, 'FalseHighlighGroup', { link = 'MoonflyRed' })
  end,
}
