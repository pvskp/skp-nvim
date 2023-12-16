return {
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		event = "VimEnter",
		dependencies = {
			{
				"echasnovski/mini.indentscope",
				opts = {
					-- symbol = "▏",
					symbol = "│",
					options = { try_as_border = false },
				},
			},
		},
		opts = {
			indent = {
				char = "│",
				tab_char = "│",
			},
			scope = { enabled = false },
		},
		config = function()
			require("mini.indentscope")
		end,
	},
}
