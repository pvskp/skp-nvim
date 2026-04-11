vim.pack.add({ Gh("afonsofrancof/OSC11.nvim") })

require("osc11").setup({
	-- Function to call when switching to dark theme
	on_dark = function()
		vim.o.background = "dark"
		vim.cmd.colorscheme("catppuccin")
	end,
	-- Function to call when switching to light theme
	on_light = function()
		vim.o.background = "light"
		vim.cmd.colorscheme("catppuccin")
	end,
})

vim.cmd.colorscheme("catppuccin")

vim.api.nvim_create_autocmd("OptionSet", {
	pattern = "background",
	-- once = true,
	callback = function()
		vim.api.nvim_set_hl(0, "Normal", { bg = 'none' })

		vim.api.nvim_set_hl(0, "Title", { fg = Fg("Title"), bold = true })
		vim.api.nvim_set_hl(0, "FloatBorder", { fg = Bg("NormalFloat"), bg = Bg("NormalFloat") })

		vim.api.nvim_set_hl(0, "MiniFilesTitle", {
			fg = Fg("Title"),
			bg = Bg("NormalFloat"),
			bold = true,
		})

		vim.api.nvim_set_hl(0, "MiniFilesTitleFocused", {
			fg = Fg("NvimString"),
			bg = Bg("NormalFloat"),
			bold = true,
		})
	end,
})
