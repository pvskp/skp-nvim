return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.5",
	lazy = false,
	init = function()
		local builtin = require("telescope.builtin")
		vim.keymap.set("n", "<leader>f", builtin.find_files, {})
		vim.keymap.set("n", "<leader>g", builtin.live_grep, {})
		vim.keymap.set("n", "<leader>b", builtin.buffers, {})
		vim.keymap.set("n", "<leader>h", builtin.help_tags, {})
		vim.keymap.set("n", "<leader>/", ":Telescope current_buffer_fuzzy_find<CR>", { silent = true })
	end,
	dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope-ui-select.nvim" },
	config = function()
		require("telescope").setup({
			pickers = {
				colorscheme = {
					enable_preview = true,
				},
			},
			extensions = {},
		})
		require("telescope").load_extension("ui-select")
	end,
}
