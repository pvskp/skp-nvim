return {
  'rmagatti/auto-session',
  lazy = true,
  keys = {
    { "<leader>sr", "<cmd>SessionRestore<cr>", desc = "Restore Session" },
    { "<leader>ss", "<cmd>SessionSave<cr>",    desc = "Save Session" }
  },
  opts = {
    log_level = 'error',
    auto_restore_enabled = false,
    auto_save_enabled = true,
    auto_session_suppress_dirs = { "~/" },
  },
}
