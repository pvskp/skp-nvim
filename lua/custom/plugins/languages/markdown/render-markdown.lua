return {
  'MeanderingProgrammer/render-markdown.nvim',
  -- version = '*',
  name = 'render-markdown', -- Only needed if you have another plugin named markdown.nvim
  ft = 'markdown',
  dependencies = {
    'nvim-treesitter/nvim-treesitter', -- Mandatory
    'nvim-tree/nvim-web-devicons',
  },
  opts = {
    sign = {
      enabled = false,
    },
    heading = {
      icons = { '󰲡 ', '󰲣 ', '󰲥 ', '󰲧 ', '󰲩 ', '󰲫 ' },
      -- icons = { "" },
      border = true,
      border_prefix = false,
      -- position = 'inline',
      -- width = 'block',
      -- left_pad = 2,
      -- right_pad = 6,
    },
    code = {
      style = 'normal',
      position = 'left',
    },
    highlights = {
      code = 'ColorColumn',
    },
  },
  init = function()
    vim.api.nvim_set_hl(0, 'ColorColumn', { bg = '#191819' })
  end,
  config = function(_, opts)
    require('render-markdown').setup(opts)
  end,
}
