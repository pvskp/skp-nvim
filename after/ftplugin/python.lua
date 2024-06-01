local function split_string(input)
  local result = {}
  for line in string.gmatch(input, '([^\n]+)') do
    table.insert(result, line)
  end
  return result
end

vim.api.nvim_create_user_command('RunPythonScript', function()
  local obj = vim.system({ 'python3', vim.fn.expand '%', '2>&1' }, { text = true }):wait()
  local buf = vim.api.nvim_create_buf(false, true)
  vim.cmd 'vsplit'
  vim.api.nvim_set_current_buf(buf)
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, split_string(obj.stdout))
end, {})

vim.keymap.set('n', '<C-Space>', '<cmd>RunPythonScript<CR>', { noremap = true })
