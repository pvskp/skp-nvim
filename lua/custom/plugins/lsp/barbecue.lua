return {
  'utilyre/barbecue.nvim',
  name = 'barbecue',
  event = { 'LspAttach' },
  -- ft = { "yaml", "json" },
  cmd = { 'Barbecue' },
  version = '*',
  dependencies = {
    'SmiteshP/nvim-navic',
    'nvim-tree/nvim-web-devicons', -- optional dependency
    'nvim-treesitter/nvim-treesitter-context',
  },
  config = function(_, opts)
    local barbecue = require('barbecue')
    local tsctx = Get_hl_through_links('TreesitterContext')
    opts = {
      exclude_filetypes = { 'netrw', 'toggleterm', 'ranger', 'terminal' },

      theme = {
        normal = { bg = tsctx.bg },
      },
    }
    barbecue.setup(opts)
  end,
}
