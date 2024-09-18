return {
  "utilyre/barbecue.nvim",
  name = "barbecue",
  ft = { "yaml", "json" },
  cmd = { "Barbecue" },
  version = "*",
  dependencies = {
    "SmiteshP/nvim-navic",
    "nvim-tree/nvim-web-devicons", -- optional dependency
  },
  opts = {
    theme = {
      -- normal = { bg = TokyoNight.bg_dark }
    }
  },
  config = function(_, opts)
    require("barbecue").setup(opts)
  end
}
