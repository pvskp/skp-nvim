local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
	group = highlight_group,
	pattern = "*",
	callback = function()
		local event = vim.v.event
		if event.operator == "y" and event.regtype ~= "" then
			vim.highlight.on_yank({ higroup = "IncSearch", timeout = 300, on_visual = false })
		end
	end,
})

local tfvars_hi = vim.api.nvim_create_augroup("TFVarsHighlight", { clear = true })
vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
	group = tfvars_hi,
	pattern = "*.tfvars",
	command = "set filetype=terraform",
})

-- Fix cursor
local cursor_reset = vim.api.nvim_create_augroup("CursorReset", { clear = true })
vim.api.nvim_create_autocmd("VimLeave", {
	group = cursor_reset,
	pattern = "*",
	command = "set guicursor=a:ver90",
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

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	pattern = "kitty.conf",
	command = "silent !pkill -USR1 kitty",
})

-- Initiates the LSP for ansible, if available
local ansible_filetype_group = vim.api.nvim_create_augroup("FiletypeAnsible", { clear = true })
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	group = ansible_filetype_group,
	pattern = "*.ansible.yaml",
	callback = function()
		pcall(vim.lsp.start, { name = "ansiblels", cmd = { "ansible-language-server", "--stdio" } })
	end,
})
