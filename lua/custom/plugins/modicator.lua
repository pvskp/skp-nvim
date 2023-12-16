-- return {}
return {
	"mawkler/modicator.nvim",
	event = "VeryLazy", -- This fix a bug when neovim it's started
	init = function()
		-- These are required for Modicator to work
		vim.o.cursorline = true
		vim.o.number = true
		vim.o.termguicolors = true
	end,
	opts = {
		-- Show warning if any required option is missing
		show_warnings = false,
		highlights = {
			-- Default options for bold/italic
			defaults = {
				bold = true,
				italic = false,
			},
		},
		integration = {
			lualine = {
				enabled = true,
				mode_section = nil,
				-- highlight = "bg",
			},
		},
	},
}
