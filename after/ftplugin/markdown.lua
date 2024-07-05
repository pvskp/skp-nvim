for k, v in pairs({
  spell = true,
  spelllang = "pt_br,en",
  shiftwidth = 2,
  tabstop = 2,
  expandtab = true,
  wrap = false,
  conceallevel = 2,
}) do
  vim.opt_local[k] = v
end

local opts = { silent = true, noremap = true }

opts.desc = "Align table"
vim.keymap.set("v", "<leader>f", ":! tr -s ' ' | column -t -s '|' -o '|'<CR>", opts)
