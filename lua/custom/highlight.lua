vim.cmd("highlight! NormalFloat guibg=NONE")
vim.cmd("highlight! FloatBorder guibg=NONE")

-- Adiciona o padrão de realce para "on"
vim.api.nvim_exec(
	[[
hi onPattern guifg=#9FF592
call matchadd('onPattern', '\<pon\>')
]],
	false
)

-- Adiciona o padrão de realce para "off"
vim.api.nvim_exec(
	[[
hi offPattern guifg=#F54534
call matchadd('offPattern', '\<poff\>')
]],
	false
)
