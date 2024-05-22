return {
  'akinsho/bufferline.nvim',
  lazy = false,
  keys = {
    { '<leader><Tab>', '<cmd>BufferLinePick<CR>', desc = 'BufferLinePick' },
  },
  config = function()
    local bufferline = require 'bufferline'
    bufferline.setup {
      options = {
        mode = 'buffers', -- set to "tabs" to only show tabpages instead
        numbers = 'none', -- "none" | "ordinal" | "buffer_id" | "both" | function({ ordinal, id, lower, raise }): string,
        style_preset = {
          bufferline.style_preset.no_italic,
        },
        close_command = 'bdelete! %d', -- can be a string | function, | false see "Mouse actions"
        right_mouse_command = 'bdelete! %d', -- can be a string | function | false, see "Mouse actions"
        left_mouse_command = 'buffer %d', -- can be a string | function, | false see "Mouse actions"
        middle_mouse_command = nil, -- can be a string | function, | false see "Mouse actions"
        indicator = {
          -- icon = "▎", -- this should be omitted if indicator style is not 'icon'
          -- style = "none",
          style = 'none',
        },
        buffer_close_icon = '󰅖',
        modified_icon = '●',
        close_icon = '',
        left_trunc_marker = '',
        right_trunc_marker = '',
        max_name_length = 12,
        max_prefix_length = 12, -- prefix used when a buffer is de-duplicated
        truncate_names = true, -- whether or not tab names should be truncated
        tab_size = 12,
        -- diagnostics = "nvim_lsp",
        color_icons = true, -- whether or not to add the filetype icon highlights
        show_buffer_icons = USE_DEVICONS, -- disable filetype icons for buffers
        show_buffer_close_icons = true,
        show_close_icon = true,
        show_tab_indicators = true,
        show_duplicate_prefix = true, -- whether to show duplicate buffer prefix
        persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
        move_wraps_at_ends = false, -- whether or not the move command "wraps" at the first or last position
        separator_style = 'thin', --| "slope" | "thick" | "thin" | { 'any', 'any' },
        always_show_bufferline = false,
      },
    }
  end,
}
