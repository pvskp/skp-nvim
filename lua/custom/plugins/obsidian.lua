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
				path = "~/personal-sync/Obsidian Vault/",
			},

			{
				name = "work",
				path = "~/syncthing/obsidian-work/",
			},
		},
	},
	init = function()
		vim.opt.wrap = false
		vim.opt.conceallevel = 2
	end,
	config = function(_, opts)
		require("obsidian").setup(opts)
	end,
}
