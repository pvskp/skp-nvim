vim.cmd 'highlight! NormalFloat guibg=NONE'
vim.cmd 'highlight! FloatBorder guibg=NONE'

-- Adiciona o padrão de realce para "on"
vim.api.nvim_exec(
  [[
hi onPattern guifg=green
call matchadd('onPattern', '\<pon\>')
]],
  false
)

-- Adiciona o padrão de realce para "off"
vim.api.nvim_exec(
  [[
hi offPattern guifg=red
call matchadd('offPattern', '\<poff\>')
]],
  false
)

-- vim.cmd([[highlight Whitespace guifg=Blue ctermfg=blue]])
