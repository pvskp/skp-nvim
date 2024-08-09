return {
  'epwalsh/obsidian.nvim',
  version = '*', -- recommended, use latest release instead of latest commit
  ft = 'markdown',
  cmd = 'ObsidianOpen',
  keys = {
    {
      '<leader>o',
      '<cmd>ObsidianOpen<CR>',
      { desc = 'Open file on obsidian' },
    },
  },
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  opts = {
    workspaces = {
      {
        name = 'personal',
        path = '~/syncthing/personal-vault-obsidian/',
      },
      -- {
      --   name = "work",
      --   path = "~/vaults/work",
      -- },
    },

    -- see below for full list of options 👇
  },
}
