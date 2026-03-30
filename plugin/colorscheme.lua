vim.pack.add({ Gh('nvim-mini/mini.nvim') })
vim.o.termguicolors = true
vim.cmd.colorscheme('catppuccin')

vim.api.nvim_set_hl(0, 'Title', { fg = Fg('Title'), bold = true })
vim.api.nvim_set_hl(0, 'FloatBorder', { fg = Bg('NormalFloat'), bg = Bg('NormalFloat') })

vim.api.nvim_set_hl(0, 'MiniFilesTitle', {
  fg = Fg('Title'),
  bg = Bg('NormalFloat'),
  bold = true
})

vim.api.nvim_set_hl(0, 'MiniFilesTitleFocused', {
  fg = Fg('NvimString'),
  bg = Bg('NormalFloat'),
  bold = true,
})
