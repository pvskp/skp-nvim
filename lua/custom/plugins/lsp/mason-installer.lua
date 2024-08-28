return {
  "WhoIsSethDaniel/mason-tool-installer.nvim",
  event = "VeryLazy",
  config = function()
    require('mason-tool-installer').setup {
      ensure_installed = {
        'goimports',
        'golangci-lint',
        'gopls',
        'pyright',
        'stylua',
        'prettier',
        'terraformls',
        'helm-ls',
        'json-lsp',
      },
    }
  end
}
