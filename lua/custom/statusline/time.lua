local M = {}

local date_format = "%H:%M:%S"

local dynamic_time = os.date(date_format)

function M.get_time()
  return dynamic_time
end

function M.setup()
---@diagnostic disable-next-line: undefined-field
  local timer = vim.uv.new_timer()
  timer:start(0, 1000, function()
    dynamic_time = os.date(date_format)
    vim.defer_fn(function()
      vim.cmd("redrawstatus")
    end, 0)
  end)
end

return M
