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
    auto_restore_enabled = false,
    auto_save_enabled = false,
    auto_session_suppress_dirs = { '~/' },
  },
}
