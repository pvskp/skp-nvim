return {
  {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    event = 'VimEnter',
    dependencies = {
      {
        'echasnovski/mini.indentscope',
        opts = {
          -- symbol = "▏",
          symbol = '│',
          options = { try_as_border = false },
        },
      },
    },
    opts = {
      indent = {
        char = '│',
        tab_char = '│',
      },
      scope = { enabled = false },
    },
    config = function(_, opts)
      require('ibl').setup(opts)
      require 'mini.indentscope'

      -- Disables indent-blankline in alpha
      vim.api.nvim_create_autocmd("Filetype", {
        pattern = "alpha",
        callback = function()
          vim.b.miniindentscope_disable = true
        end
      })
    end,
  },
}
