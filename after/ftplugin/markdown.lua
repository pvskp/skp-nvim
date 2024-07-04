local opts = {
  spell = true,
  spelllang = "pt_br,en",
  shiftwidth = 2,
  tabstop = 2,
  expandtab = true,
  wrap = false,
  conceallevel = 2,
}

for k, v in pairs(opts) do
  vim.opt_local[k] = v
end
