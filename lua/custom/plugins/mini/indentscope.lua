return {
  'echasnovski/mini.indentscope',
  -- ft = {
  --   "typescriptreact",
  --   "javascriptreact",
  --   "html",
  -- },
  version = '*',
  config = function()
    require('mini.indentscope').setup(
      {
        symbol = "│"
      }
    )
  end
}
