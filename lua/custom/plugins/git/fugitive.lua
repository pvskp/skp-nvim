return {
	"tpope/vim-fugitive",
	lazy = false,
	config = function()
		vim.keymap.set("n", "<leader>s", ":Git<CR>", {
			silent = true,
			desc = "[G]it [S]tatus",
		})
		vim.keymap.set("n", "<leader>p", ":Git push<CR>", {
			silent = true,
			desc = "[G]it [P]ush",
		})
	end,
}
