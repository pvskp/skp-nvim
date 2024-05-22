return {
  'sainnhe/gruvbox-material',
  priority = 1000,
  lazy = false,
  config = function()
    vim.g.everforest_background = 'hard' -- 'hard', 'medium', 'soft'
    vim.g.everforest_enable_italic = 1 -- 1 or 0(default)
    vim.g.everforest_transparent_background = 0 -- If you want more ui components to be transparent set this option to `2` [0,1,2].
    vim.g.everforest_dim_inactive_windows = 1 -- 1 or 0(default)
    vim.g.everforest_ui_contrast = 'high' -- 'low', 'high'
    vim.cmd [[colorscheme gruvbox-material]]
  end,
}
