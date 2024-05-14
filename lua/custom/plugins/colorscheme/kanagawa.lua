return {
  'rebelot/kanagawa.nvim',
  lazy = false,
  priority = 1000,
  opts = {
    compile = false, -- enable compiling the colorscheme
    undercurl = true, -- enable undercurls
    commentStyle = { italic = true },
    functionStyle = {},
    keywordStyle = { bold = true, italic = false },
    statementStyle = { bold = true },
    typeStyle = {},
    transparent = false, -- do not set background color
    dimInactive = true, -- dim inactive window `:h hl-NormalNC`
    terminalColors = true, -- define vim.g.terminal_color_{0,17}
    theme = 'wave', -- Load "wave" theme when 'background' option is not set
    background = { -- map the value of 'background' option to a theme
      dark = 'wave', -- try "dragon" !
      -- dark = 'dragon', -- try "dragon" !
      light = 'lotus',
    },
  },
  config = function(_, opts)
    require('kanagawa').setup(opts)
    vim.cmd [[colorscheme kanagawa]]
  end,
}
