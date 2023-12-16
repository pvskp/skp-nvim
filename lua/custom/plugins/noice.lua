-- return {}
return {
	"folke/noice.nvim",
	event = "VeryLazy",
	opts = {
		views = {
			mini = {
				win_options = {
					winblend = 0,
				},
			},
		},
		lsp = {
			signature = {
				enabled = false,
			},
		},
		preset = {
			lsp_doc_border = true,
		},
	},
	dependencies = {
		"MunifTanjim/nui.nvim",
	},
}
