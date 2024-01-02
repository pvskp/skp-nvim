-- return {}
return {
	"pvskp/btterm.nvim",
	-- dir = "~/Documents/repos/btterm",
	-- dir = "~/Documents/repos/btterm",
	lazy = false,
	config = function()
		require("flatten")
		require("btterm").setup({})
	end,
	dependencies = {
		{
			"willothy/flatten.nvim",
			config = true,
			-- or pass configuration with
			opts = {
				block_for = {
					gitcommit = true,
					gitrebase = true,
				},
				allow_cmd_passthrough = true,
				nest_if_no_args = false,
				window = {
					open = "alternate",
					diff = "tab_vsplit",
					focus = "first",
				},
				one_per = {
					kitty = false,
					wezterm = false,
				},
			},
			lazy = false,
			priority = 1001,
		},
	},
}
