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
    "nvim-treesitter/nvim-treesitter-context",
  },
  config = function(_, opts)
    local tsctx = Get_hl_through_links("TreesitterContext")
    opts = {
      theme = {
        normal = { bg = tsctx.bg }
      },
    }
    require("barbecue").setup(opts)
  end
}
