vim.pack.add({
	Gh("olimorris/codecompanion.nvim"),
	Gh("nvim-lua/plenary.nvim"),
	Gh("nvim-treesitter/nvim-treesitter"),
})

require("codecompanion").setup({
	interactions = {
		chat = {
			adapter = "openrouter",
		},
		cmd = {
			adapter = "openrouter",
		},
	},
	adapters = {
		http = {
			openrouter = function()
				return require("codecompanion.adapters").extend("openai_compatible", {
					env = {
						url = "https://openrouter.ai/api",
						api_key = "OPENROUTER_API_KEY",
						chat_url = "/v1/chat/completions",
					},
					-- schema = {
					-- 	model = {
					-- 		default = "anthropic/claude-3.7-sonnet",
					-- 	},
					-- },
				})
			end,
		},
	},
})

Map({ "n", "v" }, "<leader>ac", "<cmd>CodeCompanionChat Toggle<cr>", {
  noremap = true,
  silent = true
})
