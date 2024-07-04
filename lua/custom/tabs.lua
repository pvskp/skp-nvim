local opts = { silent = true, noremap = false }

opts.desc = "Creates a new tab"
vim.keymap.set("n", "<C-a>n", "<cmd>tabnew<CR>", opts)

opts.desc = "Closes current tab"
vim.keymap.set("n", "<C-a>q", "<cmd>tabclose<CR>", opts)

opts.desc = "Go to next tab"
vim.keymap.set("n", "<C-a>l", "<cmd>tabnext<CR>", opts)

opts.desc = "Go to previous tab"
vim.keymap.set("n", "<C-a>h", "<cmd>tabprev<CR>", opts)
