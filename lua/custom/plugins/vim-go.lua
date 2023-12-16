return {
	"fatih/vim-go",
	event = "LspAttach",
	dependencies = {
		"olexsmir/gopher.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
		opts = {
			commands = {
				go = "go",
				gomodifytags = "gomodifytags",
				gotests = "~/go/bin/gotests", -- also you can set custom command path
				impl = "impl",
				iferr = "iferr",
			},
		},
	},
	config = function()
		require("gopher")
	end,
}
