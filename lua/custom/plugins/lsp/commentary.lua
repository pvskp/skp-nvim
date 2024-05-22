return {
  'tpope/vim-commentary',
  lazy = false,
  init = function()
    vim.keymap.set('n', 'gc', '<Plug>CommentaryLine', { silent = true })
    vim.keymap.set('v', 'gc', '<Plug>Commentary', { silent = true })

    vim.keymap.set('n', '<leader>c', '<Plug>CommentaryLine', { silent = true })
    vim.keymap.set('v', '<leader>c', '<Plug>Commentary', { silent = true })
  end,
}
