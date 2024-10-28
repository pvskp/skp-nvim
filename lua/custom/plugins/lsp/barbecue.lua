return {
  "utilyre/barbecue.nvim",
  name = "barbecue",
  event = { "LspAttach" },
  -- ft = { "yaml", "json" },
  cmd = { "Barbecue" },
  version = "*",
  dependencies = {
    "SmiteshP/nvim-navic",
    "nvim-tree/nvim-web-devicons", -- optional dependency
  },
  opts = {
    theme = {
      -- normal = { bg = "#26233A" }
    },
    symbols = {
      modified = "●",
      ellipsis = "…",
      separator = "󰔰",
    },
  },
  config = function(_, opts)
    require("barbecue").setup(opts)
  end
}
