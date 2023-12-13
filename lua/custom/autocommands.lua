-- Term auto-insert
vim.api.nvim_create_autocmd({ "BufWinEnter", "TermOpen", "WinEnter" }, {
  pattern = "term://*",
  command = "startinsert",
})

-- vim.api.nvim_create_augroup("AutoIndentOnSave", { clear = true })
-- vim.api.nvim_create_autocmd("BufWritePre", {
  --   group = "AutoIndentOnSave",
  --   pattern = "*",
  --   callback = function()
    --     -- Salvar a posição atual do cursor
    --     local curpos = vim.api.nvim_win_get_cursor(0)

    --     -- Executar a indentação
    --     vim.cmd("normal! gg=G")

    --     -- Restaurar a posição do cursor
    --     vim.api.nvim_win_set_cursor(0, curpos)
    --   end
    -- })
