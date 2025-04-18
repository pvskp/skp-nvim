return {
  'rmagatti/auto-session',
  -- lazy = true,
  lazy = false,
  cmd = { 'SessionSave', 'SessionRestore' },
  keys = {
    {
      '<leader>sr',
      function()
        vim.cmd 'SessionRestore'
        -- vim.notify('[auto-session] Session restored.', vim.log.levels.WARN)
      end,
      desc = 'Restore Session',
    },
    {
      '<leader>ss',
      function()
        vim.cmd 'SessionSave'
        -- vim.notify('[auto-session] Session saved.', vim.log.levels.WARN)
      end,
      desc = 'Save Session',
    },
  },
  opts = {
    log_level = 'error',
    auto_restore_enabled = false,
    auto_save_enabled = false,
    auto_session_suppress_dirs = { '~/' },
  },
}
