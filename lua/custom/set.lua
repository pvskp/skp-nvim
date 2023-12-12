vim.opt.number = true
vim.opt.relativenumber = true
-- vim.opt.cursorline = true
vim.opt.path = ".,,**"
vim.opt.wildmenu = true
-- vim.opt.autochdir = true
vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.scrolloff = 99999

-- For some reason, this works better than `vim.opt.formatoptions:remove({ 'c', 'r', 'o' })`
-- vim.opt.formatoptions:remove({ 'c', 'r', 'o' })
vim.cmd([[autocmd FileType * set formatoptions-=ro]])

-- Configure tabs
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2

vim.opt.swapfile = false

-- Sync clipboard with system clipboard
vim.opt.clipboard = "unnamedplus"

-- Search settings
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = false

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeoutlen = 300

-- Save undo history
vim.o.undofile = true

-- Set colorscheme
vim.o.background = "dark" -- or "light" for light mode

-- Highlight on yank
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})
