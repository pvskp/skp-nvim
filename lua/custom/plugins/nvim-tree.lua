vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true

return {
	"nvim-tree/nvim-tree.lua",
	lazy = false,
	keys = {
		{ "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "Toggle File Explorer" },
	},
	opts = {
		view = {
			side = "left",
		},
	},
}
