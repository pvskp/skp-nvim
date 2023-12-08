vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.scrolloff = 99999

-- For some reason, this works better than `vim.opt.formatoptions:remove({ 'c', 'r', 'o' })`
vim.cmd [[set formatoptions-=cro]]

-- Configure tabs
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

vim.opt.swapfile = false

-- Sync clipboard with system clipboard
vim.opt.clipboard = "unnamedplus"

-- Search settings
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = false

-- Save undo history
vim.o.undofile = true

vim.o.background = "dark" -- or "light" for light mode
vim.cmd([[colorscheme everforest]])
-- vim.cmd([[colorscheme flexoki-dark]])

local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})
