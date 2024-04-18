return {
	"mfussenegger/nvim-lint",
	event = {
		"BufReadPre",
		"BufNewFile",
	},
	config = function()
		local lint = require("lint")

		lint.linters_by_ft = {
			javascript = { "eslint_d" },
			typescript = { "eslint_d" },
			json = { "jsonlint" },
			-- lua = { "luacheck" },
			-- python = { "ruff" },
			python = { "flake8" },
			go = { "golangcilint" },
			terraform = { "tflint", "tfsec" },
			-- cpp = { "cpplint" },
			-- yaml = { "yamllint" },
		}

		local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
			group = lint_augroup,
			callback = function()
				lint.try_lint()

				-- local linters = lint.get_running()
				-- P(linters)
			end,
		})
	end,
}
