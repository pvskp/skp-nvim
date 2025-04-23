return {
  'rebelot/kanagawa.nvim',
  lazy = false,
  priority = 1000,
  ---@module "kanagawa"
  ---@type KanagawaConfig
  opts = {
    overrides = function(colors)
      return {
        Normal = { bg = 'none' },
      }
    end,
  },
  config = function(_, opts)
    require('kanagawa').setup(opts)
    vim.cmd.colorscheme('kanagawa')
  end,
}
