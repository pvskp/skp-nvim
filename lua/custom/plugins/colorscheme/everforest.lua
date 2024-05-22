return {
  'neanias/everforest-nvim',
  lazy = false,
  priority = 1000,
  opts = {
    background = 'hard',
    transparent_background_level = 0,
    italics = false,
    disable_italic_comments = false,
    sign_column_background = 'none',
    ui_contrast = 'high',
    dim_inactive_windows = true,
    diagnostic_text_highlight = false,
    diagnostic_virtual_text = 'coloured',
    diagnostic_line_highlight = false,
    spell_foreground = false,
    show_eob = true,
    float_style = 'bright',
  },
  config = function(_, opts)
    -- vim.cmd([[set background=light]])
    require('everforest').setup(opts)
    vim.cmd [[colorscheme everforest]]
  end,
}
