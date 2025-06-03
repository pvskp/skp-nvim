return {
  'rmagatti/auto-session',
  lazy = false,
  -- stylua: ignore start
  keys = {
    {'<leader>sr', function() vim.cmd('SessionRestore') end, desc = 'Restore Session',},
    {'<leader>ss', function() vim.cmd('SessionSave') end, desc = 'Save Session',},
  },
  -- stylua: ignore end
  opts = {
    log_level = 'error',
    auto_restore = true,
    auto_save = true,
    auto_session_suppress_dirs = { '~/' },
  },
  init = function()
    vim.keymap.set('n', '<leader>rr', function()
      -- vim.cmd('SessionSave before_restart')
      vim.cmd('restart')
      -- vim.cmd('SessionRestore before_restart')
    end, { desc = 'Restart neovim' })
  end,
}
