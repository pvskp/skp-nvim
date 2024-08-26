vim.keymap.set('n', '<C-Space>', function()
  local filename = vim.fn.expand '%'
  vim.cmd('!firefox ' .. filename)
end)
