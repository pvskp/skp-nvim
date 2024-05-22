return {
  'm4xshen/hardtime.nvim',
  lazy = false,
  dependencies = { 'MunifTanjim/nui.nvim', 'nvim-lua/plenary.nvim' },
  opts = {
    disabled_filetypes = {
      'qf',
      'netrw',
      'NvimTree',
      'lazy',
      'mason',
      'oil',
      'minifiles',
      'help',
      'vim',
      'Outline',
    },
  },
}
