vim.keymap.set('n', '<C-Space>', function()
  vim.cmd 'source %'
  vim.notify('sourced *' .. vim.fn.expand '%' .. '*', vim.log.levels.WARN)
end, { noremap = true })
