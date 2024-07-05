return {
  'MeanderingProgrammer/markdown.nvim',
  name = 'render-markdown', -- Only needed if you have another plugin named markdown.nvim
  ft = "markdown",
  dependencies = {
    'nvim-treesitter/nvim-treesitter', -- Mandatory
    'nvim-tree/nvim-web-devicons',     -- Optional but recommended
  },
  opts = {},
  config = function(_, opts)
    require('render-markdown').setup(opts)
  end,
}
