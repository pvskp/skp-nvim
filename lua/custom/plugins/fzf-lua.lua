return {
  "ibhagwan/fzf-lua",
  -- optional for icon support
  lazy = false,
  -- keys = {
  --   { "<leader>ff", "<cmd>FzfLua files<CR>" },
  --   { "<leader>gg", "<cmd>FzfLua live_grep<CR>" },
  --   { "<leader>h", "<cmd>FzfLua helptags<CR>" },
  --   { "<leader>ws", "<cmd>FzfLua lsp_workspace_symbols<CR>" },
  --   { "<leader>sw", "<cmd>FzfLua grep_cword<CR>" },
  -- },
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    -- calling `setup` is optional for customization
    local fzf_lua = require("fzf-lua")
    fzf_lua.setup()
    fzf_lua.register_ui_select()

    local set = vim.keymap.set

    set(
      "n",
      "<leader>ff",
      function()
        fzf_lua.files({ resume = true })
      end,
      { desc = "Search Files" }
    )
    set(
      "n",
      "<leader>gg",
      function()
        fzf_lua.live_grep({ resume = true })
      end,
      { desc = "Grep string" }
    )
    set(
      "n",
      "<leader>h",
      function()
        fzf_lua.helptags({ resume = true })
      end
      ,
      { desc = "Search helptags" }
    )
    set("n", "<leader>ws", function()
        fzf_lua.lsp_live_workspace_symbols({ resume = true })
      end,
      { desc = "Search Workspace symbols" })
    set("n", "<leader>sw", fzf_lua.grep_cword, { desc = "Search word under cursor" })
    -- set("n", "<leader>la", fzf_lua.lsp_code_actions, { desc = "List available code actions" })
  end
}
