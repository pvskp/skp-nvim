return {
	"rose-pine/neovim",
	name = "rose-pine",
	priority = 1000,
	lazy = false,
	opts = {

		--- @usage 'auto'|'main'|'moon'|'dawn'
		variant = "main",
		--- @usage 'main'|'moon'|'dawn'
		dark_variant = "main",
		bold_vert_split = false,
		dim_nc_background = false,
		-- disable_background = true,
		disable_float_background = false,
		disable_italics = false,

		--- @usage string hex value or named color from rosepinetheme.com/palette
	},
	config = function(_, opts)
		require("rose-pine").setup(opts)
		vim.cmd([[colorscheme rose-pine]])
	end,
}
