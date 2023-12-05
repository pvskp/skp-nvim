-- Term auto-insert
vim.api.nvim_create_autocmd({ "BufWinEnter", "TermOpen", "WinEnter" }, {
    pattern = "term://*",
    command = "startinsert",
})
