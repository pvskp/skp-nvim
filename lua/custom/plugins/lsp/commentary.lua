return {
	"tpope/vim-commentary",
	lazy = false,
	keys = {
		{ "<leader>c", "<Plug>CommentaryLine", { silent = true }, mode = "n" },
		{ "<leader>c", "<Plug>Commentary", { silent = true }, mode = "v" },
	},
}
