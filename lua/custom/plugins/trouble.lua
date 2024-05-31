-- return {}
return {
  "folke/trouble.nvim",
  keys = {
    {
      "<leader>t",
      "<cmd>Trouble diagnostics toggle<cr>",
      desc = "Diagnostics (Trouble)",
    },
    {
      "<leader>xX",
      "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
      desc = "Buffer Diagnostics (Trouble)",
    },
    {
      "<leader>cs",
      "<cmd>Trouble symbols toggle focus=false<cr>",
      desc = "Symbols (Trouble)",
    },
    {
      "<leader>cl",
      "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
      desc = "LSP Definitions / references / ... (Trouble)",
    },
    {
      "<leader>xL",
      "<cmd>Trouble loclist toggle<cr>",
      desc = "Location List (Trouble)",
    },
    {
      "<leader>xQ",
      "<cmd>Trouble qflist toggle<cr>",
      desc = "Quickfix List (Trouble)",
    },
  },

  opts = {
    auto_close = false,      -- auto close when there are no items
    auto_open = false,       -- auto open when there are items
    auto_preview = true,     -- automatically open preview when on an item
    auto_refresh = true,     -- auto refresh when open
    auto_jump = false,       -- auto jump to the item when there's only one
    focus = false,           -- Focus the window when opened
    restore = true,          -- restores the last location in the list when opening
    follow = true,           -- Follow the current item
    indent_guides = true,    -- show indent guides
    max_items = 200,         -- limit number of items that can be displayed per section
    multiline = true,        -- render multi-line messages
    pinned = false,          -- When pinned, the opened trouble window will be bound to the current buffer
    warn_no_results = true,  -- show a warning when there are no results
    open_no_results = false, -- open the trouble window when there are no results
    win = {},                -- window options for the results window. Can be a split or a floating window.
    preview = {
      type = "main",
      -- when a buffer is not yet loaded, the preview window will be created
      -- in a scratch buffer with only syntax highlighting enabled.
      -- Set to false, if you want the preview to always be a real loaded buffer.
      scratch = true,
    },
    -- Throttle/Debounce settings. Should usually not be changed.
    ---@type table<string, number|{ms:number, debounce?:boolean}>
    throttle = {
      refresh = 20,                            -- fetches new data when needed
      update = 10,                             -- updates the window
      render = 10,                             -- renders the window
      follow = 100,                            -- follows the current item
      preview = { ms = 100, debounce = true }, -- shows the preview for the current item
    },
    keys = {
      ["?"] = "help",
      r = "refresh",
      R = "toggle_refresh",
      q = "close",
      o = "jump_close",
      ["<esc>"] = "cancel",
      ["<cr>"] = "jump",
      ["<2-leftmouse>"] = "jump",
      ["<c-s>"] = "jump_split",
      ["<c-v>"] = "jump_vsplit",
      -- go down to next item (accepts count)
      -- j = "next",
      ["}"] = "next",
      ["]]"] = "next",
      -- go up to prev item (accepts count)
      -- k = "prev",
      ["{"] = "prev",
      ["[["] = "prev",
      i = "inspect",
      p = "preview",
      P = "toggle_preview",
      zo = "fold_open",
      zO = "fold_open_recursive",
      zc = "fold_close",
      zC = "fold_close_recursive",
      za = "fold_toggle",
      zA = "fold_toggle_recursive",
      zm = "fold_more",
      zM = "fold_close_all",
      zr = "fold_reduce",
      zR = "fold_open_all",
      zx = "fold_update",
      zX = "fold_update_all",
      zn = "fold_disable",
      zN = "fold_enable",
      zi = "fold_toggle_enable",
      gb = { -- example of a custom action that toggles the active view filter
        action = function(view)
          view.state.filter_buffer = not view.state.filter_buffer
          view:filter(view.state.filter_buffer and { buf = 0 } or nil)
        end,
        desc = "Toggle Current Buffer Filter",
      },
    },
    modes = {
      symbols = {
        desc = "document symbols",
        mode = "lsp_document_symbols",
        focus = false,
        win = { position = "right" },
        filter = {
          -- remove Package since luals uses it for control flow structures
          ["not"] = { ft = "lua", kind = "Package" },
          any = {
            -- all symbol kinds for help / markdown files
            ft = { "help", "markdown" },
            -- default set of symbol kinds
            kind = {
              "Class",
              "Constructor",
              "Enum",
              "Field",
              "Function",
              "Interface",
              "Method",
              "Module",
              "Namespace",
              "Package",
              "Property",
              "Struct",
              "Trait",
            },
          },
        },
      },
    },
    -- stylua: ignore
    icons = {
      indent        = {
        top         = "│ ",
        middle      = "├╴",
        last        = "└╴",
        -- last          = "-╴",
        -- last       = "╰╴", -- rounded
        fold_open   = " ",
        fold_closed = " ",
        ws          = "  ",
      },
      folder_closed = " ",
      folder_open   = " ",
      kinds         = {
        Array         = " ",
        Boolean       = "󰨙 ",
        Class         = " ",
        Constant      = "󰏿 ",
        Constructor   = " ",
        Enum          = " ",
        EnumMember    = " ",
        Event         = " ",
        Field         = " ",
        File          = " ",
        Function      = "󰊕 ",
        Interface     = " ",
        Key           = " ",
        Method        = "󰊕 ",
        Module        = " ",
        Namespace     = "󰦮 ",
        Null          = " ",
        Number        = "󰎠 ",
        Object        = " ",
        Operator      = " ",
        Package       = " ",
        Property      = " ",
        String        = " ",
        Struct        = "󰆼 ",
        TypeParameter = " ",
        Variable      = "󰀫 ",
      },
    },
  },
}
