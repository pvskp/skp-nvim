-- --- Splits a string into lines and append it to a table
-- ---@param input string The string to split
-- ---@return table
-- local function split_string(input)
--   local result = {}
--   for line in string.gmatch(input, '([^\n]+)') do
--     table.insert(result, line)
--   end
--   return result
-- end

--- Get the window number of a buffer
---@param bufnr number Buffer number
---@return number
local function get_buf_window(bufnr)
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    local win_buf = vim.api.nvim_win_get_buf(win)
    if win_buf == bufnr then
      return win
    end
  end
  return 0
end

-- @type nil|number
local output_buffer = nil

--- Runs the current python script and throw the output in a new buffer
local function run_python_script()
  local curr_window = get_buf_window(vim.api.nvim_get_current_buf())
  if output_buffer == nil then
    output_buffer = vim.api.nvim_create_buf(false, true)
  else
    vim.api.nvim_buf_delete(output_buffer, { force = true })
    output_buffer = vim.api.nvim_create_buf(false, true)
  end

  vim.cmd 'vsplit'
  vim.api.nvim_set_current_buf(output_buffer)
  vim.api.nvim_set_current_win(curr_window)
  vim.api.nvim_buf_set_lines(output_buffer, 0, -1, false, {
    'Running script...',
  })

  vim.fn.jobstart({ 'python3', vim.fn.expand '%', '2>&1' }, {
    stdout_buffered = true,
    stderr_buffered = true,
    on_stdout = function(_, data)
      vim.api.nvim_buf_set_lines(output_buffer, 0, -1, false, data)
    end,
    -- on_stderr = function(_, data, _)
    --   table.insert(data, 1, "**Error running script**")
    --   vim.api.nvim_buf_set_lines(output_buffer, 0, -1, false, data)
    -- end,
  })
end

vim.api.nvim_create_user_command('RunPythonScript', run_python_script, {})

vim.api.nvim_buf_set_keymap(0, "n", "<C-Space>", "<cmd>RunPythonScript<CR>", { noremap = true })
-- vim.keymap.set('n', '<C-Space>', '<cmd>RunPythonScript<CR>', { noremap = true })
