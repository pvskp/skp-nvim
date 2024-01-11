return {
	"Mofiqul/vscode.nvim",
	lazy = false,
	priority = 1000,
	opts = {
		-- Alternatively set style in setup
		-- style = 'light'

		-- Enable transparent background
		transparent = true,

		-- Enable italic comment
		italic_comments = true,

		-- Disable nvim-tree background color
		disable_nvimtree_bg = true,
	},
	config = function(_, opts)
		local code = require("vscode")
		code.setup(opts)
		code.load()
	end,
}
