return {
  'NeogitOrg/neogit',
  cmd = 'Neogit',
  keys = {},
  dependencies = {
    'nvim-lua/plenary.nvim', -- required
    'sindrets/diffview.nvim', -- optional - Diff integration
  },
  init = function()
    vim.keymap.set('n', '<leader>x', ':Neogit<CR>', {
      noremap = true,
      silent = true,
      desc = ' Neogit',
    })
  end,
  config = true,
}
