vim.keymap.set('n', '<leader>tw', function()
  if vim.wo.wrap then
    vim.wo.wrap = false
    vim.notify('[Toggle] Wrap off')
    return
  end
  vim.wo.wrap = true
  vim.notify('[Toggle] Wrap on')
end, { desc = '[T]oggle line [W]rap' })
