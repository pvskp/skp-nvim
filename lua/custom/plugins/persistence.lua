return {
  "folke/persistence.nvim",
  event = "BufReadPre", -- this will only start session saving when an actual file was opened
  keys = {
    {
      '<leader>sr',
      function()
        require("persistence").load({ last = true })
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
    -- add any custom options here
  }
}
