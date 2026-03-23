require("utils")

vim.pack.add {
  Gh('neovim/nvim-lspconfig'),
  Gh('folke/lazydev.nvim'),
  { src = Gh('mason-org/mason.nvim'), version = vim.version.range("*") }
}

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function()
    vim.pack.add({
      Gh('folke/trouble.nvim'),
    })
    require('trouble').setup()
  end
})

require("lazydev").setup()

require("mason").setup()

vim.diagnostic.config({
  virtual_text = true,
  underline = true,
  signs = false,
  -- signs = {
  --   text = {
  --     [vim.diagnostic.severity.ERROR] = ' ',
  --     [vim.diagnostic.severity.WARN] = ' ',
  --     [vim.diagnostic.severity.INFO] = ' ',
  --     [vim.diagnostic.severity.HINT] = ' ',
  --   }
  -- }
})

vim.lsp.enable({
  "lua_ls",
  "gopls",
})
