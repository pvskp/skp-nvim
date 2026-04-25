-- vim.pack.add({ Gh("afonsofrancof/OSC11.nvim") })

-- require("osc11").setup({
-- 	-- Function to call when switching to dark theme
-- 	on_dark = function()
-- 		vim.o.background = "dark"
-- 		vim.cmd.colorscheme("catppuccin")
-- 	end,
-- 	-- Function to call when switching to light theme
-- 	on_light = function()
-- 		vim.o.background = "light"
-- 		vim.cmd.colorscheme("catppuccin")
-- 	end,
-- })

vim.cmd.colorscheme("retrobox")

vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		local hl = "DiagnosticUnderlineWarn"
		vim.api.nvim_set_hl(0, hl, {
			fg = Fg(hl),
			underline = false,
			undercurl = true,
		})

		hl = "DiagnosticUnderlineError"
		vim.api.nvim_set_hl(0, hl, {
			fg = Fg(hl),
			underline = false,
			undercurl = true,
		})
	end,
})

vim.api.nvim_create_autocmd("OptionSet", {
	pattern = "background",
	-- once = true,
	callback = function()
		vim.api.nvim_set_hl(0, "Normal", { bg = "none" })

		local hl = "Title"
		vim.api.nvim_set_hl(0, hl, { fg = Fg(hl), bold = true })
		vim.api.nvim_set_hl(0, "FloatBorder", { fg = Bg("NormalFloat"), bg = Bg("NormalFloat") })

		vim.api.nvim_set_hl(0, "MiniFilesTitle", {
			fg = Fg("Title"),
			bg = Bg("NormalFloat"),
			bold = true,
		})

		hl = "VertSplit"
		vim.api.nvim_set_hl(0, hl, {
			fg = Fg("StatusLineNC"),
			bg = nil,
		})

		hl = "SignColumn"
		vim.api.nvim_set_hl(0, hl, {
			fg = Fg(hl),
			bg = "none",
		})

		hl = "FoldColumn"
		vim.api.nvim_set_hl(0, hl, {
			fg = Fg(hl),
			bg = "none",
		})

		hl = "CursorLineNr"
		vim.api.nvim_set_hl(0, hl, {
			fg = Fg(hl),
			bg = "none",
		})

		hl = "CursorLineSign"
		vim.api.nvim_set_hl(0, hl, {
			fg = "none",
			bg = "none",
		})

		hl = "CursorLineFold"
		vim.api.nvim_set_hl(0, hl, {
			fg = "none",
			bg = "none",
		})

		-- hl = "DiagnosticUnderlineWarn"
		-- vim.api.nvim_set_hl(0, hl, {
		-- 	underline = false,
		-- 	undercurl = true,
		-- })

		vim.api.nvim_set_hl(0, "MiniFilesTitleFocused", {
			fg = Fg("NvimString"),
			bg = Bg("NormalFloat"),
			bold = true,
		})

		vim.api.nvim_set_hl(0, "SpellBad", {
			fg = "#cdd6f4",
			bg = "#89556b",
		})

		vim.api.nvim_set_hl(0, "@string.special.url", {
			link = "Directory",
		})
	end,
})
