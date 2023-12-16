return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "python", "go" },
      sync_install = false,
      auto_install = true,
      ignore_install = {},

      highlight = {
        enable = true,
        disable = { "markdown" },
        additional_vim_regex_highlighting = false,
        indent = {
          enable = true,
          disable = {},
        },
      },
    })
  end,
}
