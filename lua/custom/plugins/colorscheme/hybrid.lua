return {
  'HoNamDuong/hybrid.nvim',
  lazy = false,
  priority = 1000,
  opts = {
    terminal_colors = true,
    undercurl = false,
    underline = false,
    bold = true,
    italic = {
      strings = false,
      emphasis = true,
      comments = true,
      folds = true,
    },
    strikethrough = true,
    inverse = true,
    transparent = false,
    overrides = function(highlights, colors) end,
  },
  config = function(_, opts)
    require('hybrid').setup(opts)
    vim.cmd.colorscheme 'hybrid'
    vim.cmd 'highlight TelescopeNormal guibg=NONE'
    vim.cmd 'highlight TelescopeBorder guibg=NONE'
    vim.cmd 'highlight TelescopeTitle guibg=NONE'
  end,
}
