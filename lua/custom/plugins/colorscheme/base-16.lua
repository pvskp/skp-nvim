return {
	"RRethy/nvim-base16",
	lazy = false,
	config = function()
		require("base16-colorscheme").with_config({
			telescope = false,
			indentblankline = true,
			notify = true,
			ts_rainbow = true,
			cmp = true,
			illuminate = true,
		})
	end,
}
