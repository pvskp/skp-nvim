return {
  'Dynge/gitmoji.nvim',
  dependencies = {
    'hrsh7th/nvim-cmp',
  },
  opts = { -- the values below are the defaults
    filetypes = { 'gitcommit' },
    completion = {
      append_space = false,
      complete_as = 'emoji',
    },
  },
  ft = { 'gitcommit', 'NeogitCommitMessage' },
}
