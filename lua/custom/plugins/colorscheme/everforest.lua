return {
	"neanias/everforest-nvim",
	lazy = false,
	priority = 1000,
	opts = {
		background = "medium",
		transparent_background_level = 0,
		italics = true,
		disable_italic_comments = false,
		sign_column_background = "none",
		ui_contrast = "low",
		dim_inactive_windows = false,
		diagnostic_text_highlight = false,
		diagnostic_virtual_text = "coloured",
		diagnostic_line_highlight = false,
		spell_foreground = false,
		show_eob = true,
		float_style = "bright",
	},
	config = function(_, opts)
		vim.cmd([[colorscheme everforest]])
		require("everforest").setup(opts)
	end,
}
