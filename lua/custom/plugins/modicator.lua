return {
  'mawkler/modicator.nvim',
  event = 'VeryLazy',
  init = function()
    vim.o.termguicolors = true
    vim.o.cursorline = true
    vim.o.number = true
  end,
  opts = {
    -- Warn if any required option above is missing. May emit false positives
    -- if some other plugin modifies them, which in that case you can just
    -- ignore. Feel free to remove this line after you've gotten Modicator to
    -- work properly.
    show_warnings = true,
  },
}
