return {
  'danymat/neogen',
  event = 'LspAttach',
  keys = {
    { '<leader>t', '<cmd>Neogen<CR>' },
  },
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
  },
  config = true,
}
