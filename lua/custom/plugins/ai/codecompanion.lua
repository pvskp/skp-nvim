---@module 'codecompanion'
---@module "lazy"
---@type LazyPluginSpec
return {
  'olimorris/codecompanion.nvim',
  lazy = false,
  version = '*',
  cmd = { 'CodeCompanionChat' },
  keys = {
    {
      '<leader>ae',
      ':CodeCompanion #buffer ',
      mode = { 'n', 'v' },
    },
  },
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
    'ravitemer/mcphub.nvim',
    'zbirenbaum/copilot.lua',
    'j-hui/fidget.nvim',
  },
  init = function()
    require('custom.plugins.ai.figet-codecompanion'):init()
  end,
  config = function()
    require('codecompanion').setup({
      display = {
        diff = { enabled = false },
      },
      interactions = {
        chat = { adapter = 'opencode' },
        inline = { adapter = 'copilot' },
        cmd = { adapter = 'opencode' },
      },
    })
  end,
}
