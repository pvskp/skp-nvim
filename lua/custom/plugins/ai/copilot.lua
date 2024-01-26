return {
	"zbirenbaum/copilot.lua",
	event = "InsertEnter",
	cmd = "Copilot",
	dependencies = {
		"zbirenbaum/copilot-cmp",
	},
	opts = {
		suggestion = {
			enabled = false,
			auto_trigger = true,
			keymap = {
				-- accept = "<M-l>",
				accept = "<C-a>",
				accept_word = false,
				accept_line = false,
				next = "<Right>",
				prev = "<Left>",
				dismiss = "<C-c>",
			},
		},

		panel = {
			enabled = false,
		},

		filetypes = {
			yaml = true,
			markdown = true,
			help = false,
			gitcommit = false,
			gitrebase = false,
			hgcommit = false,
			svn = false,
			cvs = false,
			["."] = false,
		},
	},
	config = function(_, opts)
		local copilot_lua = require("copilot")
		copilot_lua.setup(opts)
		require("copilot_cmp").setup()
	end,
}
