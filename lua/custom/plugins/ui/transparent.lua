return {
  'xiyaowong/transparent.nvim',
  lazy = false,
  opts = {               -- Optional, you don't have to run setup.
    extra_groups = {},   -- table: additional groups that should be cleared
    exclude_groups = {}, -- table: groups you don't want to clear
  },
  config = function(_, opts)
    require('transparent').setup(opts)
    vim.cmd 'TransparentEnable'
  end,
}
