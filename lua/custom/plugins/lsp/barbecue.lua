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
    local tsctx = vim.api.nvim_get_hl(0, { name = "TreesitterContext" })

    opts = {
      theme = {
        normal = { bg = tsctx.bg }
      },
      symbols = {
        modified = "●",
        ellipsis = "…",
        separator = ">",
      },
    }
    require("barbecue").setup(opts)
  end
}
