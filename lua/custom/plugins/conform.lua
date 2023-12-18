return {
	"stevearc/conform.nvim",
	lazy = false,
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			bash = { "beautysh" },
			python = { "isort", "black" },
			javascript = { { "prettierd", "prettier" } },
		},
	},
}
