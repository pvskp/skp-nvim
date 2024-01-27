return {
	"stevearc/oil.nvim",
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons", -- Optional dependencies
	},

	keys = {
		{ "<C-e>", "<CMD>lua require('oil').toggle_float()<CR>", desc = "Open parent directory" },
	},

	init = function()
		-- disables numbers to filetype "oil"
		local opts = {
			silent = true,
			noremap = true,
		}

		local select = "<CMD>lua require('oil.actions').select.callback()<CR>"
		local parent = "<CMD>lua require('oil.actions').parent.callback()<CR>"

		vim.api.nvim_create_autocmd("FileType", {
			pattern = "oil",
			callback = function()
				vim.cmd("setlocal norelativenumber")
				vim.cmd("setlocal nonumber")
				vim.api.nvim_buf_set_keymap(0, "n", "<S-l>", select, opts)
				vim.api.nvim_buf_set_keymap(0, "n", "<S-h>", parent, opts)
			end,
		})
	end,

	opts = {
		use_default_keymaps = false,
		float = {
			padding = 8,
			max_width = 0,
			max_height = 0,
			border = "single",
			win_options = {
				winblend = 0,
			},
		},
	},
}
