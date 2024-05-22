return {
  'fatih/vim-go',
  ft = 'go',
  dependencies = {
    'olexsmir/gopher.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-treesitter/nvim-treesitter',
    },
    opts = {
      commands = {
        go = 'go',
        gomodifytags = 'gomodifytags',
        gotests = '~/go/bin/gotests', -- also you can set custom command path
        impl = 'impl',
        iferr = 'iferr',
      },
    },
  },
  config = function()
    --create autocommand that disables numbers on filetype "godoc"
    vim.api.nvim_create_autocmd('FileType', {
      pattern = { 'godoc' },
      callback = function()
        vim.cmd 'setlocal nonumber'
        vim.cmd 'setlocal norelativenumber'
      end,
    })

    require 'gopher'
  end,
}
