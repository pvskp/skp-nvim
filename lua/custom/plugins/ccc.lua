return {
  'uga-rosa/ccc.nvim',
  cmd = { 'CccPick', 'CccConvert', 'CccHighlighterToggle' },
  opts = {
    -- Your preferred settings
    -- Example: enable highlighter
    win_opts = {
      border = Borders.simple,
    },
    highlighter = {
      auto_enable = true,
      lsp = true,
    },
  },
  config = function(_, opts)
    require('ccc').setup(opts)
  end,
}
