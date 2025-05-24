for k, v in pairs({
  -- spell = true,
  -- spelllang = 'pt_br,en',
  shiftwidth = 2,
  tabstop = 2,
  expandtab = true,
  wrap = false,
  -- concealcursor = 'ncv', -- hide original markdown chars
  -- conceallevel = 3, -- hide original markdown chars
  -- textwidth = 80,
}) do
  vim.opt_local[k] = v
end

vim.keymap.set(
  'v',
  '<leader>f',
  ':! tr -s \' \' | column -t -s \'|\' -o \'|\'<CR>',
  { desc = '[Markdown] format table' }
)

vim.keymap.set('n', '<C-space>', function()
  local current_line_text = vim.api.nvim_get_current_line()
  local pattern_empty = '%- %[ %]'
  local pattern_filled = '%- %[x%]'
  if string.find(current_line_text, pattern_empty) ~= nil then
    vim.cmd('s/\\[ \\]/\\[x\\]')
  elseif string.find(current_line_text, pattern_filled) then
    vim.cmd('s/\\[x\\]/\\[ \\]')
  end
end, { desc = '[markdown] Toggle checkbox' })
