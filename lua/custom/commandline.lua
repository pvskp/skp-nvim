vim.opt.wildmenu = true -- Enable command-line completion menu
vim.opt.wildignorecase = true -- Ignore case in command-line completion
vim.opt.wildmode = 'longest:full,full' -- Command-line completion mode
vim.opt.wildoptions = 'pum' -- Use popup menu for command-line completion
vim.cmd 'set wildchar=<Tab>'

vim.keymap.set('c', '<C-x>', '<C-y>')
