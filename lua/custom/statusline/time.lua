local M = {}

local dynamic_time = os.date("%H:%M:%S")


function M.get_time()
  return dynamic_time
end

function M.setup()
  local timer = vim.uv.new_timer()
  timer:start(0, 1000, function()
    dynamic_time = os.date("%H:%M:%S")
    vim.defer_fn(function()
      vim.cmd("redrawstatus")
    end, 0)
  end)
end

return M
