local function is_executable(filename)
  local perms = vim.fn.getfperm(filename)
  return perms:sub(3, 3) == 'x' or perms:sub(6, 6) == 'x' or perms:sub(9, 9) == 'x'
end

function _execute_shell_script() end

vim.keymap.set('n', '<C-Space>', function()
  local filename = vim.fn.expand('%')
  local filedir = vim.fn.expand('%:p:h')

  if vim.fn.filereadable(filename) == 0 then
    vim.notify("File not found: " .. filename, vim.log.levels.ERROR)
    return
  end

  if vim.fn.isdirectory(filedir) == 0 then
    vim.notify("Directory not found: " .. filedir, vim.log.levels.ERROR)
    return
  end

  if not is_executable(filename) then
    vim.cmd('!chmod +x ' .. filename)
  end

  local output = vim.fn.system({ './' .. filename })

  if vim.v.shell_error ~= 0 then
    vim.notify("Error executing script: " .. output, vim.log.levels.ERROR)
  else
    vim.notify(output)
  end
end, { noremap = true })
