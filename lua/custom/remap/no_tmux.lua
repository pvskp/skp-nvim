--- This one tries to replicate the same behavior I have in Tmux

vim.keymap.set('n', '<M-a>c', function()
  vim.cmd('tabnew')
  vim.cmd('term')
end, { desc = 'Open terminal on new tab' })

require('custom.window')
