return {
  "lukas-reineke/indent-blankline.nvim",
  -- lazy = false,
  ft = {
    "typescriptreact",
    "javascriptreact",
    "html",
  },
  main = "ibl",
  opts = {
    scope = {
      enabled = false,
    },
    indent = {
      char = "│",
    },
  },
}
