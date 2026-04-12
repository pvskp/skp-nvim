vim.pack.add({
  Gh("stevearc/conform.nvim"),
})

require("conform").setup({
  formatters_by_ft = {
    sh = { "beautysh" },
    bash = { "beautysh" },
    -- python = { 'autoflake', 'isort', 'black' },
    python = { "ruff_format", "ruff_fix" },
    javascript = { "prettier" },
    json = { "prettier" },
    html = { "prettier" },
    css = { "prettier" },
    yaml = { "prettier" },
    helm = { "prettier" },
    markdown = { "prettier" },
    -- vimwiki = { 'prettier' },
    -- toml = { 'taplo' },
    cpp = { "clang-format" },
    go = {
      "goimports",
      "gofmt",
    },
    terraform = { "terraform_fmt" },
    ["terraform-vars"] = { "terraform_fmt" },
    zsh = { "beautysh" },
    c = { "clang-format" },
    sql = { "sql_formatter" },
  },
  formatters = {
    prettier = {
      prepend_args = { "--prose-wrap", "always", "--print-width", "80" },
    },
  },
})
