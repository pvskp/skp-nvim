vim.cmd 'highlight! NormalFloat guibg=NONE'
vim.cmd 'highlight! FloatBorder guibg=NONE'

vim.cmd 'highlight! link MiniFilesBorder TelescopeResultsBorder'
vim.cmd 'highlight! link LazyGitBorder TelescopeResultsBorder'

vim.cmd 'highlight TelescopeNormal guibg=NONE'
vim.cmd 'highlight TelescopeBorder guibg=NONE'
vim.cmd 'highlight TelescopeTitle guibg=NONE'
vim.cmd 'highlight TelescopePromptBorder guibg=NONE'
vim.cmd 'highlight TelescopePromptTitle guibg=NONE'
-- vim.cmd 'highlight! link LazyGitFloat TelescopeResultsBorder'

vim.cmd 'highlight! MiniFilesDirectory guibg=NONE'
vim.cmd 'highlight! MiniFilesNormal guibg=NONE'
vim.cmd 'highlight! link MiniFilesBorder TelescopeResultsBorder'

vim.api.nvim_set_hl(0, 'TelescopeSelectionCaret', {
  fg = Symbols.telescope.selection_caret.color,
})

vim.api.nvim_set_hl(0, 'TelescopePromptPrefix', {
  fg = Symbols.telescope.prompt_prefix.color,
})
