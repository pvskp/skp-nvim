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
    local actions = fzf_lua.actions
    fzf_lua.setup({
      fzf_colors = {
        ["gutter"] = "-1",
        ["pointer"] = "blue",
        ["current-bg"] = "blue",
      },
      keymap = {
        builtin = {
          -- neovim `:tmap` mappings for the fzf win
          -- true,        -- uncomment to inherit all the below in your custom config
          ["<M-Esc>"]    = "hide",  -- hide fzf-lua, `:FzfLua resume` to continue
          ["<F1>"]       = "toggle-help",
          ["<F2>"]       = "toggle-fullscreen",
          -- Only valid with the 'builtin' previewer
          ["<F3>"]       = "toggle-preview-wrap",
          ["<F4>"]       = "toggle-preview",
          -- Rotate preview clockwise/counter-clockwise
          ["<F5>"]       = "toggle-preview-ccw",
          ["<F6>"]       = "toggle-preview-cw",
          -- `ts-ctx` binds require `nvim-treesitter-context`
          ["<F7>"]       = "toggle-preview-ts-ctx",
          ["<F8>"]       = "preview-ts-ctx-dec",
          ["<F9>"]       = "preview-ts-ctx-inc",
          ["<S-Left>"]   = "preview-reset",
          ["<C-f>"]      = "preview-page-down",
          ["<C-b>"]      = "preview-page-up",
          ["<C-j>"]      = "preview-page-down",
          ["<C-k>"]      = "preview-page-up",
          ["<M-S-down>"] = "preview-down",
          ["<M-S-up>"]   = "preview-up",
        },
        fzf = {
          -- fzf '--bind=' options
          -- true,        -- uncomment to inherit all the below in your custom config
          true, -- uncomment to inherit all the below in your custom config
          ["ctrl-z"]     = "abort",
          ["ctrl-u"]     = "unix-line-discard",
          ["ctrl-f"]     = "",
          ["ctrl-b"]     = "",
          ["ctrl-a"]     = "beginning-of-line",
          ["ctrl-e"]     = "end-of-line",
          ["alt-a"]      = "toggle-all",
          ["alt-g"]      = "first",
          ["alt-G"]      = "last",
          -- Only valid with fzf previewers (bat/cat/git/etc)
          ["f3"]         = "toggle-preview-wrap",
          ["f4"]         = "toggle-preview",
          ["shift-down"] = "preview-page-down",
          ["shift-up"]   = "preview-page-up",
        },
        actions = {
          files = {
            ["ctrl-q"] = actions.file_sel_to_qf,
          }
        }
      },
    })
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
