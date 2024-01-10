return {
	"tpope/vim-fugitive",
	lazy = false,
	config = function()
		vim.keymap.set("n", "<leader>g", "", {
			desc = "Git",
		})

		vim.keymap.set("n", "<leader>gs", ":Git<CR>", {
			silent = true,
			desc = "[G]it [S]tatus",
		})
		vim.keymap.set("n", "<leader>gp", ":Git push<CR>", {
			silent = true,
			desc = "[G]it [P]ush",
		})
	end,
}
