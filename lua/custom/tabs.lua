local opts = { silent = true, noremap = false }

opts.desc = "Creates a new tab"
vim.keymap.set("n", "<C-t>n", "<cmd>tabnew<CR>", opts)

opts.desc = "Closes current tab"
vim.keymap.set("n", "<C-t>q", "<cmd>tabclose<CR>", opts)

opts.desc = "Go to next tab"
vim.keymap.set("n", "<C-t>l", "<cmd>tabnext<CR>", opts)

opts.desc = "Go to previous tab"
vim.keymap.set("n", "<C-t>h", "<cmd>tabprev<CR>", opts)
