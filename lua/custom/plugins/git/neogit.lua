return {
  'NeogitOrg/neogit',
  cmd = 'Neogit',
  dependencies = {
    'nvim-lua/plenary.nvim', -- required
    'sindrets/diffview.nvim', -- optional - Diff integration
  },
  init = function()
    vim.keymap.set('n', '<leader>gs', ':Neogit<CR>', {
      noremap = true,
      silent = true,
      desc = '[G]it [S]tatus',
    })
  end,
  config = true,
}
