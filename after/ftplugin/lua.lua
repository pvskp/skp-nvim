vim.keymap.set('n', '<leader>x', function()
  vim.cmd('source %')
  vim.notify('sourced *' .. vim.fn.expand('%') .. '*', vim.log.levels.WARN)
end, { noremap = true })
