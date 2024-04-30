return {
  'mfussenegger/nvim-lint',
  event = {
    'BufReadPre',
    'BufNewFile',
  },
  config = function()
    local lint = require 'lint'

    lint.linters_by_ft = {
      javascript = { 'eslint_d' },
      typescript = { 'eslint_d' },
      json = { 'jsonlint' },
      lua = { 'luacheck' },
      go = { 'golangcilint' },
      terraform = { 'tflint', 'tfsec' },
      python = { 'ruff' },
      -- cpp = { "cpplint" },
      -- yaml = { "yamllint" },
      -- python = { "flake8" },
    }

    lint.linters.luacheck.args = {
      '--globals',
      'vim',
    }

    local lint_augroup = vim.api.nvim_create_augroup('lint', { clear = true })
    vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
      group = lint_augroup,
      callback = function()
        lint.try_lint()

        -- local linters = lint.get_running()
        -- P(linters)
      end,
    })
  end,
}
