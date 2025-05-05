return {
  'Shatur/neovim-ayu',
  lazy = false,
  priority = 1000,
  config = function(_, _)
    local colors = require('ayu.colors')
    colors.generate(false)
    require('ayu').setup({
      -- mirage = true,
      options = {
        theme = 'ayu',
      },
      overrides = {
        Normal = { bg = 'None' },
        NormalFloat = { bg = 'none' },
        ColorColumn = { bg = 'None' },
        LineNr = { fg = colors.comment },
        CursorLineNr = { bg = colors.black, fg = colors.accent },
        SignColumn = { bg = 'None' },
        Folded = { bg = 'None' },
        FoldColumn = { bg = 'None' },
        TreesitterContext = { bg = colors.bg },
        CursorLine = { bg = 'None' },
        CursorColumn = { bg = 'None' },
        VertSplit = { bg = 'None' },
      },
    })
    vim.cmd('colorscheme ayu')
  end,
}
