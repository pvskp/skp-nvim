---@module 'codecompanion'
return {
  'olimorris/codecompanion.nvim',
  lazy = false,
  cmd = { 'CodeCompanionChat' },
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
    'ravitemer/mcphub.nvim',
  },
  config = function()
    require('codecompanion').setup({
      adapters = {
        coppilot = function()
          return require('codecompanion.adapters').extend('copilot', {
            name = 'copilot-claude',
            schema = {
              model = {
                default = 'claude-3-7-sonnet',
              },
            },
          })
        end,
        strategies = {
          chat = {
            adapter = 'copilot-claude',
          },
          inline = {
            adapter = 'copilot-claude',
          },
        },
      },
      extensions = {
        mcphub = {
          callback = 'mcphub.extensions.codecompanion',
          opts = {
            make_vars = true,
            make_slash_commands = true,
            show_result_in_chat = false,
          },
        },
      },
    })
  end,
}
