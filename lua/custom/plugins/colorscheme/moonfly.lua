return {
  'bluz71/vim-moonfly-colors',
  name = 'moonfly',
  lazy = false,
  priority = 1000,
  config = function()
    local pallete = require('moonfly').palette

    vim.g.moonflyTransparent = true
    vim.cmd.colorscheme('moonfly')

    -- vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
    -- vim.api.nvim_set_hl(0, 'NormalNC', { bg = 'none' })
    vim.api.nvim_set_hl(0, 'CursorLineNr', { bg = pallete.black, fg = pallete.blue })
    vim.api.nvim_set_hl(0, 'TrueHighlighGroup', { link = 'MoonflyLime' })
    vim.api.nvim_set_hl(0, 'FalseHighlighGroup', { link = 'MoonflyRed' })
  end,
}
