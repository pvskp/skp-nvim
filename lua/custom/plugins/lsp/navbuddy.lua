return {
  'SmiteshP/nvim-navbuddy',
  event = 'LspAttach',
  -- lazy = false,
  keys = {
    { '<leader>n', ':Navbuddy<CR>', desc = 'Navbuddy', silent = true },
  },
  dependencies = {
    'SmiteshP/nvim-navic',
    'MunifTanjim/nui.nvim',
  },
  opts = {
    lsp = { auto_attach = true },
  },
}
