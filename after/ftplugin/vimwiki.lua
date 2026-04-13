vim.api.nvim_set_hl(0, 'CustomQuote', { fg = '#888888', italic = true })
vim.fn.matchadd("CustomQuote", "^\\s*>.*")
