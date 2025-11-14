return {
  'nvim-neo-tree/neo-tree.nvim',
  branch = 'v3.x',
  keys = {
    { '<leader>e', '<cmd>Neotree toggle<cr>' },
  },
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },
  lazy = false, -- neo-tree will lazily load itself
  ---@module "neo-tree"
  ---@type neotree.Config?
  opts = {
    popup_border_style = 'rounded',
    use_popups_for_input = true,
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
