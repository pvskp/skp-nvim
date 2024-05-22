return {
  'notomo/cmdbuf.nvim',
  lazy = false,
  config = function()
    vim.keymap.set('n', 'q:', function()
      require('cmdbuf').split_open(vim.o.cmdwinheight)
    end)
    vim.keymap.set('c', '<C-f>', function()
      require('cmdbuf').split_open(
        vim.o.cmdwinheight,
        { line = vim.fn.getcmdline(), column = vim.fn.getcmdpos() }
      )
      vim.api.nvim_feedkeys(vim.keycode '<C-c>', 'n', true)
    end)
  end,
}
