return {
  "rebelot/kanagawa.nvim",
  lazy = false,
  priority=1000,
  config = function (_, opts)
    require("kanagawa").setup(opts)
    vim.cmd.colorscheme("kanagawa")
  end
}
