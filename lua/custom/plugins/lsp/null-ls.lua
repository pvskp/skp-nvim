return {
  "jose-elias-alvarez/null-ls.nvim",
  config = function()
    local null_ls = require("null-ls")
    local formating = null_ls.builtins.formatting
    null_ls.setup({
      sources = {
        formating.stylua,
        formating.beautysh,
        null_ls.builtins.diagnostics.eslint,
        null_ls.builtins.completion.spell,
      },
    })
  end
}
