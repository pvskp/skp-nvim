vim.pack.add({
	Gh("olimorris/codecompanion.nvim"),
	Gh("nvim-lua/plenary.nvim"),
	Gh("nvim-treesitter/nvim-treesitter"),
})

local prompt = table.concat(
  vim.fn.readfile(vim.fn.stdpath("config") .. "/plugin/codecompanion/prompt.txt"),
  "\n"
)

require("codecompanion").setup({
  display = {
    -- chat = {
    --   show_reasoning = false,
    -- },
  },
	interactions = {
		chat = {
			adapter = "deepseek",
      opts = {
        system_prompt = prompt,
      }
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
