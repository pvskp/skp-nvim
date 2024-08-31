return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  keys = {
    { "<c-e>", "<cmd>NvimTreeToggle<CR>", desc = "  Toggle File Explorer" }
  },
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local api = require "nvim-tree.api"
    require("nvim-tree").setup {
      hijack_cursor = true,
      diagnostics = {
        enable = true,
        show_on_dirs = true,
        show_on_open_dirs = true,
        debounce_delay = 50,
        severity = {
          min = vim.diagnostic.severity.HINT,
          max = vim.diagnostic.severity.ERROR,
        },
        icons = {
          hint = "",
          info = "",
          warning = "",
          error = "",
        },
      },
      ui = {
        confirm = {
          remove = true,
          trash = true,
          default_yes = true,
        }
      },
      on_attach = function(bufnr)
        local function opts(desc)
          return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
        end
        -- default mappings
        api.config.mappings.default_on_attach(bufnr)

        -- custom mappings
        vim.keymap.set('n', '<C-e>', api.tree.toggle, opts('Toggle tree'))

        vim.keymap.set('n', 'y', api.fs.copy.node, opts('Copy'))

        vim.keymap.set('n', 'D', api.fs.remove, opts('Delete'))
        vim.keymap.set('n', 'd', api.fs.trash, opts('Trash'))

        vim.keymap.set('n', 'p', api.fs.paste, opts('Paste'))
        vim.keymap.set('n', 'P', api.fs.paste, opts('Paste'))

        vim.keymap.set('n', 'o', api.fs.create, opts('Create node'))
        vim.keymap.set('n', 'l', api.node.open.edit, opts('Open node'))
        vim.keymap.set('n', 'h', api.node.navigate.parent_close, opts('Close node'))
        vim.keymap.set('n', 'L', api.tree.expand_all, opts('Expand all'))
        vim.keymap.set('n', 'H', api.tree.collapse_all, opts('Collapse all'))
      end
    }

    vim.api.nvim_create_autocmd({ "BufEnter" }, {
      group = vim.api.nvim_create_augroup("Nvim-Tree-auto-find-file", {}),
      callback = function()
        api.tree.find_file({
          open = false,
          focus = false,
        })
      end

    })

    -- vim.keymap.set('n', '<C-e>', '<cmd>NvimTreeToggle<CR>', {})
  end,
}
