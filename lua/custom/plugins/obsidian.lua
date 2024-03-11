return {
	"epwalsh/obsidian.nvim",
	version = "*", -- recommended, use latest release instead of latest commit
	ft = "markdown",
	-- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
	-- event = {
	--   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
	--   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
	--   "BufReadPre path/to/my-vault/**.md",
	--   "BufNewFile path/to/my-vault/**.md",
	-- },

	dependencies = {
		"nvim-lua/plenary.nvim",
	},

	opts = {
		workspaces = {
			{
				name = "personal",
				path = "~/personal-sync/personal-vault-obsidian/",
			},

			{
				name = "work",
				path = "~/personal-sync/work-vault-obsidian/",
			},
		},
	},

	init = function()
		vim.opt.spell = true
		vim.opt.spelllang = "pt_br"
		vim.opt.wrap = false
		vim.opt.conceallevel = 2
	end,
}
