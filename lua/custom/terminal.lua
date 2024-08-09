-- Set local settings for terminal buffers
vim.api.nvim_create_autocmd('TermOpen', {
  group = vim.api.nvim_create_augroup('custom-term-open', {}),
  callback = function()
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
    vim.opt_local.scrolloff = 0

    vim.bo.filetype = 'terminal'
  end,
})

vim.api.nvim_create_autocmd('BufEnter', {
  callback = function()
    if vim.bo.filetype == 'terminal' then
      vim.cmd 'startinsert'
    end
  end,
})

-- Open a terminal at the bottom of the screen with a fixed height.
vim.keymap.set('n', ',st', function()
  vim.cmd.new()
  vim.cmd.wincmd 'J'
  vim.api.nvim_win_set_height(0, 12)
  vim.wo.winfixheight = true
  vim.cmd.term()
  vim.cmd 'startinsert'
end)

-- Terminal mode mappings
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')
vim.keymap.set('t', '<M-j>', '<C-\\><C-n><C-w>j', { silent = true })
vim.keymap.set('t', '<M-k>', '<C-\\><C-n><C-w>k', { silent = true })
vim.keymap.set('t', '<M-l>', '<C-\\><C-n><C-w>l', { silent = true })
vim.keymap.set('t', '<M-h>', '<C-\\><C-n><C-w>h', { silent = true })
