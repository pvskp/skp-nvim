return {
	"stevearc/conform.nvim",
	lazy = false,
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			bash = { "beautysh", "shellcheck" },
			-- python = { "autoflake", "isort", "black" },
			python = { "isort", "black" },
			javascript = { { "prettierd", "prettier" } },
			json = { { "prettierd", "prettier" } },
			yaml = { "yamlfmt" },
			cpp = { "clang-format" },
		},

		format_on_save = {
			-- I recommend these options. See :help conform.format for details.
			lsp_fallback = true,
			timeout_ms = 1000,
		},
	},
}
