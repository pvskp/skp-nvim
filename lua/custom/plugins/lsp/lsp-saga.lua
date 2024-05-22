return {
  'nvimdev/lspsaga.nvim',
  event = 'LspAttach',
  dependencies = {
    'nvim-treesitter/nvim-treesitter', -- optional
  },
  config = function()
    require('lspsaga').setup {
      outline = {
        win_position = 'right',
      },
    }

    vim.cmd 'Lspsaga outline'
  end,
}
