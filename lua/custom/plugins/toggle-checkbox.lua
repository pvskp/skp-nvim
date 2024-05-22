return {
  'opdavies/toggle-checkbox.nvim',
  ft = 'Markdown',
  keys = {
    {
      '<leader><leader>',
      ":lua require('toggle-checkbox').toggle()<CR>",
      { desc = 'Toggle checkbox', silent = true },
      mode = 'n',
    },
  },
}
