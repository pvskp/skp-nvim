return {
	"tpope/vim-fugitive",
	lazy = false,
	config = function()
		local opts = { silent = true }
		vim.keymap.set("n", "<leader>gs", ":Git<CR>", opts)
		vim.keymap.set("n", "<leader>p", ":Git push<CR>", opts)
	end,
}
