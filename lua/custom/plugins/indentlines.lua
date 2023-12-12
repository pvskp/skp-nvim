return {
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {
      indent = {
        char = "│",
        tab_char = "│",
      }
    }
  },
  {
    "echasnovski/mini.indentscope",
    config = function()
      require('mini.indentscope').setup({
        -- symbol = "▏",
        symbol = "│",
        options = { try_as_border = true },
      })
    end
  },
}
