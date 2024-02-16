vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	pattern = "*.py",
	callback = function()
		vim.fn.system("autoimport " .. vim.fn.expand("%"))
	end,
})
