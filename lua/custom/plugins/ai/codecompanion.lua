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
      '<leader>aa',
      '<cmd>CodeCompanionChat toggle<CR>',
    },
    {
      '<leader>ae',
      '<cmd>CodeCompanionActions<CR>',
      mode = { 'n', 'v' },
    },
  },
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
    { 'echasnovski/mini.diff', version = '*' },
    'ravitemer/mcphub.nvim',
  },
  config = function()
    require('codecompanion').setup({
      strategies = {
        chat = {
          adapter = {
            name = 'copilot',
            model = 'claude-3.7-sonnet',
          },
        },
      },
      display = {
        action_palette = {
          provider = 'snacks',
        },
        diff = {
          provider = 'mini_diff',
        },
        chat = {
          window = {
            layout = 'horizontal', -- float|vertical|horizontal|buffer
            position = 'bottom',
            height = 0.5,
            width = 0.45,
          },
        },
      },
      extensions = {
        mcphub = {
          callback = 'mcphub.extensions.codecompanion',
          opts = {
            make_vars = true,
            make_slash_commands = true,
            show_result_in_chat = true,
          },
        },
      },
    })
  end,
}
