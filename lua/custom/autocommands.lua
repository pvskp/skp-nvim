-- Term auto-insert
vim.api.nvim_create_autocmd({ "BufWinEnter", "TermOpen", "WinEnter" }, {
  pattern = "term://*",
  command = "startinsert",
})

vim.api.nvim_create_augroup("AutoIndentOnSave", { clear = true })
vim.api.nvim_create_autocmd("BufWritePre", {
  group = "AutoIndentOnSave",
  pattern = "*",
  callback = function()
    vim.lsp.buf.format()
  end
})
