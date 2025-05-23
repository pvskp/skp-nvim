return {
  'kelly-lin/ranger.nvim',
  lazy = false,
  keys = {
    {
      '<leader>e',
      function()
        require('ranger-nvim').open(true)
      end,
    },
  },
  init = function()
    vim.api.nvim_create_autocmd('FileType', {
      pattern = 'ranger',
      group = vim.api.nvim_create_augroup('ranger-toggle', {}),
      callback = function(args)
        vim.keymap.set('t', '<leader>e', ':q!', { buffer = args.buf })
      end,
    })
  end,
  opts = {
    replace_netrw = true,
    ui = {
      border = 'single',
      height = 0.8,
      width = 0.8,
      x = 0.5,
      y = 0.5,
    },
  },
}
