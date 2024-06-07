return {
  'SmiteshP/nvim-navbuddy',
  event = 'LspAttach',
  -- lazy = false,
  dependencies = {
    'SmiteshP/nvim-navic',
    'MunifTanjim/nui.nvim',
  },
  opts = {
    lsp = { auto_attach = true },
  },
}
