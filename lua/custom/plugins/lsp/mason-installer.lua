return {
  "WhoIsSethDaniel/mason-tool-installer.nvim",
  -- event = "VeryLazy",
  lazy = false,
  config = function()
    require('mason-tool-installer').setup {
      ensure_installed = {
        -- Golang
        'goimports',
        'gopls',
        -- Python
        'pyright',
        -- lua
        'lua_ls',
        'stylua',
        -- devops
        'terraformls',
        'helm-ls',
        -- others
        'prettier',
        'json-lsp',
      },
    }
  end
}
