return {
  'echasnovski/mini.indentscope',
  lazy = false,
  version = '*',
  config = function()
    require('mini.indentscope').setup(
      {
        symbol = "│"
      }
    )
  end
}
