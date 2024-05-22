function TogglePonPoff()
  local row, col = unpack(vim.api.nvim_win_get_cursor(0))
  local line = vim.api.nvim_get_current_line()

  if line:find 'poff' then
    line = line:gsub('poff', 'pon')
  elseif line:find 'pon' then
    line = line:gsub('pon', 'poff')
  else
    return
  end

  vim.api.nvim_set_current_line(line)

  vim.api.nvim_win_set_cursor(0, { row, col })
end

function TogglePonPoffSelection()
  local start_line = vim.fn.line "'<"
  local end_line = vim.fn.line "'>"

  local lines = vim.api.nvim_buf_get_lines(0, start_line - 1, end_line, false)

  for i, line in ipairs(lines) do
    if line:find 'poff' then
      lines[i] = line:gsub('poff', 'pon')
    elseif line:find 'pon' then
      lines[i] = line:gsub('pon', 'poff')
    end
  end

  vim.api.nvim_buf_set_lines(0, start_line - 1, end_line, false, lines)
end
