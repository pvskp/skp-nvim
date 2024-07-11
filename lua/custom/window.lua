--- Resize Neovim split when the system window is resized
vim.api.nvim_create_autocmd('VimResized', {
  callback = function()
    local ok, maximized = pcall(vim.api.nvim_buf_get_var, 0, 'maximized')
    if not ok or not maximized then
      vim.cmd('vertical wincmd =')
      vim.cmd('horizontal wincmd =')
    end
  end
})


vim.keymap.set('n', '<M-j>', '<C-w>j')
vim.keymap.set('n', '<M-k>', '<C-w>k')
vim.keymap.set('n', '<M-l>', '<C-w>l')
vim.keymap.set('n', '<M-h>', '<C-w>h')

vim.keymap.set('n', '<C-w>e', '<C-w>=')

local toggle_maximized = function()
  local ok, maximized = pcall(vim.api.nvim_buf_get_var, 0, 'maximized')
  if not ok or not maximized then
    vim.api.nvim_buf_set_var(0, 'maximized', true)
    vim.cmd.wincmd '='
  else
    vim.cmd.wincmd '|'
    vim.cmd.wincmd '_'
    vim.api.nvim_buf_set_var(0, 'maximized', false)
  end
end

vim.keymap.set('n', '<C-w>m', toggle_maximized)
vim.keymap.set('n', '<M-m>', toggle_maximized)

-- Window and buffer close
-- map('n', 'Q', '<c-w>q', { silent = true })
vim.keymap.set('n', 'Q', function()
  local buff_info = vim.fn.getbufinfo({ buflisted = 1 })
  if #buff_info > 1 then
    vim.api.nvim_buf_delete(0, { force = true, unload = false })
    return
  end
  vim.cmd('quit')
end, { silent = true })
