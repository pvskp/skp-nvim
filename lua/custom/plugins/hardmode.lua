return {
  'dusans/vim-hardmode',
  event = { 'VimEnter', 'BufNewFile', 'BufReadPost' },
  config = function()
    vim.cmd 'call HardMode()'
  end,
}
