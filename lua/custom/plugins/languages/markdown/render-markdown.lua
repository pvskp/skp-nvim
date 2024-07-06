return {
  'MeanderingProgrammer/markdown.nvim',
  name = 'render-markdown', -- Only needed if you have another plugin named markdown.nvim
  ft = "markdown",
  dependencies = {
    'nvim-treesitter/nvim-treesitter', -- Mandatory
    'nvim-tree/nvim-web-devicons',     -- Optional but recommended
  },
  opts = {
    highlights = {
      code = 'ColorColumn',
    }
  },
  init = function()
    vim.api.nvim_set_hl(0, 'ColorColumn', { bg = "#191819" })
  end,
  config = function(_, opts)
    require('render-markdown').setup(opts)
  end,
}
