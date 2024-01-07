return {
	"tpope/vim-fugitive",
	lazy = false,
	config = function()
		vim.keymap.set("n", "<leader>gs", ":Git<CR>", { silent = true })
	end,
}
