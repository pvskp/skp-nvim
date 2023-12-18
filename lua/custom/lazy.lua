local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  { import = "custom.plugins" },
  { import = "custom.plugins.colorscheme" },
  { import = "custom.plugins.lsp" },
}, {
  defaults = {
    lazy = true,
  },
  ui = {
    border = "double",
  },
  dev = {
    path = "~/Documents/repos/nvim-plugins/"
  }
})
