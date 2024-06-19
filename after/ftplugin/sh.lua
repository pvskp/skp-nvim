local function is_executable(filename)
  local perms = vim.fn.getfperm(filename)
  return perms:sub(3, 3) == 'x' or perms:sub(6, 6) == 'x' or perms:sub(9, 9) == 'x'
end

function _execute_shell_script() end

vim.keymap.set('n', '<C-Space>', function()
  local filename = vim.fn.expand '%'
  if not is_executable(filename) then
    vim.cmd('!chmod +x ' .. filename)
  end
  vim.cmd('!./' .. filename)
end, { noremap = true, silent = true })
