-- =====================
-- General Settings
-- =====================
vim.o.compatible = false
vim.o.title = true
vim.o.titlestring = 'filename'
vim.o.background = 'dark'
vim.o.cmdheight = 1
vim.o.laststatus = 3
vim.o.winborder = 'solid'
vim.opt.formatoptions = { o = false }

-- =====================
-- Search
-- =====================
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.hlsearch = false
vim.o.inccommand = 'split'

-- =====================
-- Appearance
-- =====================
vim.o.list = true
vim.opt.listchars = {
  tab = '   ',
  extends = '▸',
  lead = ' ',
}

-- =====================
-- Display
-- =====================
vim.o.number = true
vim.o.relativenumber = false
vim.o.numberwidth = 2
vim.o.cursorline = true
vim.o.cursorlineopt = 'number'
vim.o.cursorcolumn = false
vim.o.signcolumn = 'yes'
vim.o.wrap = false
vim.o.linebreak = true
vim.o.showbreak = '-'
vim.o.scrolloff = 99999
vim.o.pumblend = 0
vim.opt.fillchars = { vert = '│', eob = ' ' }

-- =====================
-- Tabulation and Indentation
-- =====================
vim.o.expandtab = true
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.smartindent = true
vim.o.autoindent = true

-- =====================
-- Splits
-- =====================
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.equalalways = true

-- =====================
-- Wildmenu
-- =====================
vim.o.wildmenu = true
vim.o.wildignorecase = true

-- =====================
-- Folds
-- =====================
vim.o.foldmethod = 'indent'
vim.o.foldlevelstart = 99
vim.o.foldlevel = 99
vim.o.foldenable = false

-- =====================
-- Files and Backups
-- =====================
vim.o.swapfile = false
vim.o.undofile = true

-- =====================
-- Performance
-- =====================
vim.o.timeoutlen = 300
vim.o.updatetime = 250

-- =====================
-- Miscellaneous
-- =====================
vim.o.virtualedit = 'none'
vim.o.clipboard = 'unnamedplus'
vim.o.autochdir = false
vim.o.showmode = true
vim.o.tabclose = 'left'

vim.filetype.add({
  extension = {
    tf = 'terraform',
  },
})

---@diagnostic disable-next-line: duplicate-set-field
vim.deprecate = function() end
