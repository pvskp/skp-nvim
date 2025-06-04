return {
  'rmagatti/auto-session',
  lazy = false,
  -- stylua: ignore start
  keys = {
    {'<leader>sr', function() vim.cmd('SessionRestore') end, desc = 'Restore Session',},
    {'<leader>ss', function() vim.cmd('SessionSave') end, desc = 'Save Session',},
  },
  -- stylua: ignore end
  ---@module 'auto-session'
  ---@type AutoSession.Config
  opts = {
    log_level = 'error',
    enabled = true,
    auto_save = true,
    auto_restore = true,
    auto_restore_last_session = false,
    auto_session_suppress_dirs = { '~/' },
  },
}
