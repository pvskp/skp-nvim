return {
	"ray-x/lsp_signature.nvim",
	event = "LspAttach",
	opts = {
		hint_prefix = "🐧 ", -- Panda for parameter, NOTE: for the terminal not support emoji, might crash
		handler_opts = {
			border = "double", -- double, rounded, single, shadow, none, or a table of borders
		},
	},
}
