return {
  "norcalli/nvim-colorizer.lua",
  event = "VimEnter",
  init = function()
    vim.cmd([[set termguicolors]])
  end,
  config = function()
    require("colorizer").setup()
  end,
}
