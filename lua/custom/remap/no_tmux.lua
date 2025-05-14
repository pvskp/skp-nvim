--- This one tries to replicate the same behavior I have in Tmux

vim.keymap.set('n', '<M-a>c', function()
  vim.cmd('tabnew')
  vim.cmd('term')
end, { desc = 'Open terminal on new tab' })

vim.keymap.set('n', '<M-1>', '1gt', { desc = 'Go to tab 1' })
vim.keymap.set('n', '<M-2>', '2gt', { desc = 'Go to tab 2' })
vim.keymap.set('n', '<M-3>', '3gt', { desc = 'Go to tab 3' })
vim.keymap.set('n', '<M-4>', '4gt', { desc = 'Go to tab 4' })
vim.keymap.set('n', '<M-5>', '5gt', { desc = 'Go to tab 5' })
vim.keymap.set('n', '<M-6>', '6gt', { desc = 'Go to tab 6' })
vim.keymap.set('n', '<M-7>', '7gt', { desc = 'Go to tab 7' })
vim.keymap.set('n', '<M-8>', '8gt', { desc = 'Go to tab 8' })
vim.keymap.set('n', '<M-9>', '9gt', { desc = 'Go to tab 9' })
