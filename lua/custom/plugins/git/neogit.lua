return {
  'NeogitOrg/neogit',
  version = "1.0.0",
  cmd = 'Neogit',
  keys = {
    { '<leader>gn', '<cmd>Neogit<CR>', desc = 'Neogit' },
  },
  dependencies = {
    'nvim-lua/plenary.nvim',  -- required
    'sindrets/diffview.nvim', -- optional - Diff integration
  },
  config = true,
}
