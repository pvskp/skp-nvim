return {
	"stevearc/conform.nvim",
	lazy = false,
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			bash = { "beautysh", "shellcheck" },
			-- python = { "autoflake", "isort", "black" },
			python = { "ruff_format" },
			javascript = { { "prettierd", "prettier" } },
			json = { { "prettierd", "prettier" } },
			yaml = { "yamlfmt" },
			cpp = { "clang-format" },
			terraform = { "terraform_fmt" },
			zsh = { "beautysh" },
		},

		format_on_save = {
			-- I recommend these options. See :help conform.format for details.
			lsp_fallback = true,
			timeout_ms = 1000,
			quiet = true,
			callback = function(err, did_edit)
				if err ~= nil then
					vim.notify("Failed to format file. See :ConformInfo for more information.")
				end
			end,
		},
	},
	config = function(_, opts)
		require("conform").setup(opts)

		-- 		-- Use this instead format_on_save so I can exclude specific files
		-- 		vim.api.nvim_create_autocmd("BufWritePre", {
		-- 			pattern = "*",
		-- 			callback = function(ctx)
		-- 				-- require("conform").format({ bufnr = ctx.buf })
		-- 				local ok, _ = pcall(require("conform").format, { bufnr = ctx.buf })
		-- 				if not ok then
		-- 					vim.notify("Conform: Failed to format buffer. Type ConformInfo for more information")
		-- 				end
		-- 				-- if vim.fn.expand("%:t") ~= "rc.lua" then
		-- 				-- 	require("conform").format({ bufnr = ctx.buf })
		-- 				-- end
		-- 			end,
		-- 		})
	end,
}
