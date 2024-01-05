-- Highlight on yank
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
	group = highlight_group,
	pattern = "*",
})

vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
	callback = function()
		vim.cmd("set formatoptions-=cro")
	end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = {
		"netrw",
		"Jaq",
		"qf",
		"git",
		"help",
		"man",
		"lspinfo",
		"oil",
		"spectre_panel",
		"lir",
		"DressingSelect",
		"tsplayground",
		"",
	},
	callback = function()
		vim.cmd([[
      nnoremap <silent> <buffer> q :bd<CR>
      set nobuflisted
    ]])
	end,
})

-- Reset my cursor
-- local shape_group = vim.api.nvim_create_augroup("Shape", { clear = true })
-- vim.api.nvim_create_autocmd("VimLeave", {
-- 	group = shape_group,
-- 	command = "set guicursor=a:ver90,a:blinkon100",
-- })

-- Initiates the LSP for ansible, if available
local ansible_filetype_group = vim.api.nvim_create_augroup("FiletypeAnsible", { clear = true })
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	group = ansible_filetype_group,
	pattern = "*.ansible.yaml",
	callback = function()
		pcall(vim.lsp.start, { name = "ansiblels", cmd = { "ansible-language-server", "--stdio" } })
	end,
})
