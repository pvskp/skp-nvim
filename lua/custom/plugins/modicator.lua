return {
  'mawkler/modicator.nvim',
  event = 'VeryLazy',
  init = function()
    vim.o.termguicolors = true
    vim.o.cursorline = true
    vim.o.number = true
  end,
  opts = {
    show_warnings = true,
  },
}
