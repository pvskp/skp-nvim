return {
  'echasnovski/mini.ai',
  event = 'VimEnter',
  version = '*',
  opts = {
    -- It still works without disabling these, but good form to indicate an override is taking place
    -- mappings = {
    --   around_next = '',
    --   inside_next = '',
    --   around_last = '',
    --   inside_last = '',
    -- },

    -- How to search for object (first inside current line, then inside
    -- neighborhood). One of 'cover', 'cover_or_next', 'cover_or_prev',
    -- 'cover_or_nearest', 'next', 'previous', 'nearest'.
    search_method = 'cover_or_next',
  },

  config = function(_, opts)
    require('mini.ai').setup(opts)

    local keymap_opts = { noremap = false, silent = true }
    local tor = require 'custom.plugins.mini.textobject.repeat'

    local movements = { 'i', 'a' }
    local characters =
      { '(', '[', '{', '<', ')', ']', '}', '>', 'b', '"', "'", 'q', '?', 't', 'f', 'a' }

    for _, movement in ipairs(movements) do
      for _, char in ipairs(characters) do
        local keymap = movement .. char
        vim.keymap.set('v', keymap, function()
          tor.execute(movement .. char)
        end, keymap_opts)
      end
    end

    vim.keymap.set('v', 'n', tor.next_object, keymap_opts)
    vim.keymap.set('v', 'N', tor.prev_object, keymap_opts)
  end,
}
