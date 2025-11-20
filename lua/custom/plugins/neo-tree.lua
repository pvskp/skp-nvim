return {
  'nvim-neo-tree/neo-tree.nvim',
  branch = 'v3.x',
  keys = {
    { '<leader>e', '<cmd>Neotree toggle<cr>' },
    -- { '<leader>e', '<cmd>Neotree toggle position=current<cr>' },
  },
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
    {
      's1n7ax/nvim-window-picker',
      name = 'window-picker',
      event = 'VeryLazy',
      version = '2.*',
      config = function()
        require('window-picker').setup({
          hint = 'floating-big-letter',
        })
      end,
    },
  },
  lazy = false, -- neo-tree will lazily load itself
  ---@module "neo-tree"
  ---@type neotree.Config?
  opts = {
    popup_border_style = 'rounded',
    use_popups_for_input = true,
    filesystem = {
      follow_current_file = {
        enabled = true,
      },
    },
    window = {
      mappings = {
        ['<space>'] = 'expand_all_subnodes',
        ['l'] = 'open',
        ['L'] = 'expand_all_subnodes',
        ['h'] = 'close_node',
        ['<leader>e'] = function()
          vim.cmd('Neotree toggle')
        end,
      },
    },
    -- fill any relevant options here
  },
}
