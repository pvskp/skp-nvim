return {
  'stevearc/oil.nvim',
  cmd = { 'OpenFileManager', 'Oil' },
  -- dir = "~/Documents/repos/gp.nvim/",
  init = function()
    vim.api.nvim_create_autocmd('FileType', {
      pattern = 'oil',
      callback = function()
        vim.cmd 'setlocal norelativenumber'
        vim.cmd 'setlocal nonumber'
        vim.cmd 'setlocal nonumber'
        vim.cmd 'setlocal colorcolumn=""'
      end,
    })
    vim.api.nvim_create_user_command('OpenFileManager', function()
      vim.cmd 'Oil'
    end, {})
  end,

  keys = {
    -- { '<C-e>',     "<CMD>Oil<CR>", desc = 'Open parent directory' },
    -- { '<leader>e', "<CMD>Oil<CR>", desc = 'Open parent directory' },

    {
      '<C-e>',
      function()
        require("oil").toggle_float()
      end,
      desc = 'Open parent directory'
    },
    {
      '<leader>e',
      function()
        require("oil").toggle_float()
      end,
      desc = 'Open parent directory'
    },
  },

  opts = {
    -- default_file_explorer = false,
    skip_confirm_for_simple_edits = true,
    use_default_keymaps = true,
    columns = {
      'icon',
    },
    float = {
      padding = 10,
      max_width = 0,
      max_height = 0,
      border = Borders.simple,
      win_options = {
        winblend = 0,
      },
    },
    keymaps = {
      ["g?"] = "actions.show_help",
      ["<CR>"] = "actions.select",
      ["L"] = "actions.select",
      -- ["<C-s>"] = { "actions.select", opts = { vertical = true } },
      ["<C-s>"] = "<cmd>w<CR>",
      ["<C-h>"] = { "actions.select", opts = { horizontal = true } },
      ["<C-t>"] = { "actions.select", opts = { tab = true } },
      ["<C-p>"] = "actions.preview",
      ["<C-c>"] = "<Esc>",
      ["q"] = "actions.close",
      ["<C-l>"] = "actions.refresh",
      ["-"] = "actions.parent",
      ["H"] = "actions.parent",
      ["_"] = "actions.open_cwd",
      ["`"] = "actions.cd",
      ["~"] = { "actions.cd", opts = { scope = "tab" } },
      ["gs"] = "actions.change_sort",
      ["gx"] = "actions.open_external",
      ["g."] = "actions.toggle_hidden",
      ["g\\"] = "actions.toggle_trash",
    },
  },
}
