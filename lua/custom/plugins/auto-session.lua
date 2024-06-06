return {
  'rmagatti/auto-session',
  lazy = true,
  cmd = { 'SessionSave', 'SessionRestore' },
  keys = {
    {
      '<leader>sr',
      function()
        vim.cmd 'SessionRestore'
        vim.notify '[auto-session] Session restored.'
      end,
      desc = 'Restore Session',
    },
    {
      '<leader>ss',
      function()
        vim.cmd 'SessionSave'
        vim.notify '[auto-session] Session saved.'
      end,
      desc = 'Save Session',
    },
  },
  opts = {
    log_level = 'error',
    auto_restore_enabled = false,
    auto_save_enabled = true,
    auto_session_suppress_dirs = { '~/' },
  },
}
