return {
  'svrana/neosolarized.nvim',
  lazy = false,
  priority = 1000,
  dependencies = {
    'tjdevries/colorbuddy.nvim',
  },
  opts = {
    comment_italics = true,
    background_set = false,
  },
  config = function(_, opts)
    require('neosolarized').setup(opts)
  end,
}
