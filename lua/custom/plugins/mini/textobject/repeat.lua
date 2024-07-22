local M = {}
local ai = require('mini.ai')

M.last_action = ''

M.unpack_pattern = function(pattern)
  local inner_or_outer = string.sub(pattern, 1, 1)
  local match_char     = string.sub(pattern, 2, 2)
  return inner_or_outer, match_char
end

M.execute = function(keymap)
  M.last_action = keymap
  local inner_or_outer, match_char = M.unpack_pattern(keymap)
  ai.select_textobject(
    inner_or_outer,
    match_char,
    { vis_mode = "v" }
  )
end

M.execute_next = function(keymap)
  M.last_action = keymap
  local inner_or_outer, match_char = M.unpack_pattern(keymap)
  ai.select_textobject(
    inner_or_outer,
    match_char,
    { vis_mode = "v", search_method = "next" }
  )
end

M.execute_prev = function(keymap)
  M.last_action = keymap
  local inner_or_outer, match_char = M.unpack_pattern(keymap)
  ai.select_textobject(
    inner_or_outer,
    match_char,
    { vis_mode = "v", search_method = "prev" }
  )
end


M.next_object = function()
  if M.last_action ~= "" then
    M.execute_next(M.last_action)
  end
end


M.prev_object = function()
  if M.last_action ~= "" then
    M.execute_prev(M.last_action)
  end
end

return M
