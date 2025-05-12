-- stylua: ignore start
vim.opt.foldenable = true     -- enables folding
vim.opt.foldmethod = 'marker' -- uses {{{,}}} to declare folding
vim.opt.foldlevel = 0         -- starts with all folds closed
vim.opt.foldlevelstart = 0    -- starts with all folds closed
-- stylua: ignore end

vim.keymap.set('n', 'H', 'zc', { desc = '[i3config] Closes fold' })
vim.keymap.set('n', 'L', 'zo', { desc = '[i3config] Opens fold' })
