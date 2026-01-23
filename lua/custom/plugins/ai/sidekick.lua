return {
  'folke/sidekick.nvim',
  opts = {
    -- add any options here
    cli = {
      mux = {
        backend = 'tmux',
        enabled = true,
        -- terminal: new sessions will be created for each CLI tool and shown in a Neovim terminal
        -- window: when run inside a terminal multiplexer, new sessions will be created in a new tab
        -- split: when run inside a terminal multiplexer, new sessions will be created in a new split
        -- NOTE: zellij only supports `terminal`
        create = 'window', ---@type "terminal"|"window"|"split"
      },
      win = {
        --- CLI Tool Keymaps (default mode is `t`)
        ---@type table<string, sidekick.cli.Keymap|false>
        -- stylua: ignore
        keys = {
          hide_n        = { "q"    , "hide"      , mode = "n"  }, -- hide the terminal window in normal mode
          hide_ctrl_dot = { "<c-.>", "hide"      , mode = "nt" }, -- hide the terminal window in terminal mode
          hide_ctrl_z   = { "<c-z>", "hide"      , mode = "nt" }, -- hide the terminal window in terminal mode
          prompt        = { "<c-p>", "prompt"    , mode = "t"  }, -- insert prompt or context
          stopinsert    = { "<esc>", "stopinsert", mode = "t"  }, -- enter normal mode
        },
      },
    },
  },
  -- stylua: ignore
  keys = {
    {
      "<leader>aa",
      function() require("sidekick.cli").toggle() end,
      desc = "Sidekick Toggle CLI",
      mode = { "n", "t", "x" },
    },
    {
      "<leader>as",
      function() require("sidekick.cli").select() end,
      -- Or to select only installed tools:
      -- require("sidekick.cli").select({ filter = { installed = true } })
      desc = "Select CLI",
    },
    {
      "<leader>at",
      function() require("sidekick.cli").send({ msg = "{this}" }) end,
      mode = { "x", "n" },
      desc = "Send This",
    },
    {
      "<leader>af",
      function() require("sidekick.cli").send({ msg = "{file}" }) end,
      desc = "Send File",
    },
    {
      "<leader>av",
      function() require("sidekick.cli").send({ msg = "{selection}" }) end,
      mode = { "x" },
      desc = "Send Visual Selection",
    },
    {
      "<leader>ap",
      function() require("sidekick.cli").prompt() end,
      mode = { "n", "x" },
      desc = "Sidekick Select Prompt",
    },
    {
      "<leader><Tab>",
      function() require("sidekick.cli").focus() end,
      mode = { "x", "v", "n", "t" },
      desc = "Switch Focus",
    },
  },
}
