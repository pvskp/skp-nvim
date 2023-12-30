return {
	lazy = false,
	"ishan9299/nvim-solarized-lua",
	priority = 1000,
	config = function()
		vim.g.solarized_italics = 1
		vim.g.solarized_statusline = "low" -- low | flat | normal
	end,
}
