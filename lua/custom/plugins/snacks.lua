return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  dependencies = {
    "rmagatti/auto-session",
  },
  keys = {
    { ",st",
      function()
        require("snacks").terminal.toggle()
      end, }
  },
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    bigfile = { enabled = true },
    dashboard = {
      enabled = true,
      preset = {
        pick = "telescope.nvim",
        keys = {
          { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
          { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
          { icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
          { icon = " ", key = "c", desc = "Config", action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
          { icon = " ", key = "r", desc = "Restore Session", action = ":SessionRestore" },
          { icon = " ", key = "s", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
          { icon = "󰒲 ", key = "L", desc = "Lazy", action = ":Lazy", enabled = package.loaded.lazy ~= nil },
          { icon = " ", key = "q", desc = "Quit", action = ":qa" },
        }
      },
      sections = {
        {
          section = "header",
        },
        {
          section = "keys",
          gap = 1,
          padding = 1,
          height = 100,
        },
        { section = "startup" },
        -- {
        --   section = "terminal",
        --   cmd = "krabby name umbreon --no-title",
        --   -- random = 10,
        --   pane = 2,
        --   indent = 4,
        --   height = 30,
        -- },
      },
    },
    indent = { enabled = true },
    input = { enabled = true },
    notifier = {
      enabled = true,
      level = vim.log.levels.INFO
    },
    quickfile = { enabled = true },
    scope = { enabled = false },
    scroll = { enabled = false },
    statuscolumn = { enabled = true },
    words = { enabled = true },
  },
  config = function(_, opts)
    local snacks = require("snacks")
    snacks.setup(opts)
    vim.api.nvim_create_user_command('NotificationHistory', snacks.notifier.show_history, {})
  end
}
