return {
  'mawkler/modicator.nvim',
  event = 'VeryLazy',
  init = function()
    vim.o.termguicolors = true
    vim.o.cursorline = true
    vim.o.number = true
  end,
  opts = {
    show_warnings = true,
    integration = {
      lualine = {
        enabled = true,
        -- Letter of lualine section to use (if `nil`, gets detected automatically)
        mode_section = 'lualine_x',
        -- Whether to use lualine's mode highlight's foreground or background
        highlight = 'bg',
      },
    },
  },
}
