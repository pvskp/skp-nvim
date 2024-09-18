return {
  "dhruvasagar/vim-zoom",
  -- lazy = false,
  event = "VeryLazy",
  config = function()
    vim.cmd('set statusline+=%{zoom#statusline()}')
  end
}
