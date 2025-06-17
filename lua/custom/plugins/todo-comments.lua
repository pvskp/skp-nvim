return {
  'folke/todo-comments.nvim',
  dependencies = { 'nvim-lua/plenary.nvim' },
  event = 'UIEnter',
  -- lazy = false,
  opts = {
    signs = false,
    colors = {
      error = { 'DiagnosticError', 'ErrorMsg' },
      warning = { 'DiagnosticWarn', 'WarningMsg' },
      info = { 'DiagnosticInfo' },
      hint = { 'DiagnosticHint' },
      default = { 'Identifier' },
      test = { 'Identifier' },
    },
  },
}
