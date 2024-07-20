return {
  'echasnovski/mini.ai',
  event = "VimEnter",
  version = '*',
  opts = {
    -- It still works without disabling these, but good form to indicate an override is taking place
    mappings = {
      around_next = '',
      inside_next = '',
      around_last = '',
      inside_last = '',
    },

    -- How to search for object (first inside current line, then inside
    -- neighborhood). One of 'cover', 'cover_or_next', 'cover_or_prev',
    -- 'cover_or_nearest', 'next', 'previous', 'nearest'.
    search_method = 'cover',

  },
  config = function(_, opts)
    require('mini.ai').setup(opts)

    local keymap_opts = { noremap = true, silent = true }
    local tor = require("custom.plugins.mini.textobject.text_object_repeat")

    local movements = { "in", "an", "il", "al" }
    local characters = { "(", "[", "{", "<", ")", "]", "}", ">", "b", "\"", "'", "q", "?", "t", "f", "a" }

    for _, movement in ipairs(movements) do
      for _, char in ipairs(characters) do
        local keymap = movement .. char
        vim.keymap.set('v', keymap, function() tor.execute_and_remember(keymap) end, keymap_opts)
      end
    end

    vim.keymap.set('v', 'n', tor.repeat_last_text_object, keymap_opts)
    vim.keymap.set('v', 'N', tor.inverse_repeat_last_text_object, keymap_opts)
  end
}
