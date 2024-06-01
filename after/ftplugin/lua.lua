vim.keymap.set('n', '<C-Space>', function()
  vim.cmd 'source %'
  print('sourced *' .. vim.fn.expand '%' .. '*')
end, { noremap = true })
