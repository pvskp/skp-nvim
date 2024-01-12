vim.keymap.set("n", "<leader>ts", ":SunglassesToggle<CR>", {
	noremap = true,
	silent = true,
	desc = "[T]oggle [S]unglasses",
})

return {
	"miversen33/sunglasses.nvim",
	config = true,
	event = "UIEnter",
	opts = {
		filter_percent = 0.65,
		filter_type = "NOSYNTAX",
		log_level = "ERROR",
		refresh_timer = 5,
		excluded_filetypes = {
			"dashboard",
			"lspsagafinder",
			"packer",
			"checkhealth",
			"mason",
			"NvimTree",
			"neo-tree",
			"plugin",
			"lazy",
			"TelescopePrompt",
			"alpha",
			"toggleterm",
			"sagafinder",
			"better_term",
			"fugitiveblame",
			"starter",
			"NeogitPopup",
			"NeogitStatus",
			"DiffviewFiles",
			"DiffviewFileHistory",
			"DressingInput",
			"spectre_panel",
			"zsh",
			"registers",
			"startuptime",
			"OverseerList",
			"Navbuddy",
			"noice",
			"notify",
			"saga_codeaction",
			"sagarename",
		},
		excluded_highlights = {
			"WinSeparator",
			{ "lualine_.*", glob = true },
		},
	},
}