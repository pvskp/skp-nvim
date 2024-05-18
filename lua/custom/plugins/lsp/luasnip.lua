return {
  'L3MON4D3/LuaSnip',
  event = 'InsertEnter',
  dependencies = {
    'rafamadriz/friendly-snippets', -- useful snippets
  },

  config = function()
    vim.keymap.set({ 'i', 's' }, '<C-j>', function()
      require('luasnip').jump(1)
    end, { silent = true })

    vim.keymap.set({ 'i', 's' }, '<C-k>', function()
      require('luasnip').jump(-1)
    end, { silent = true })

    require('luasnip.loaders.from_snipmate').lazy_load()
    require('luasnip.loaders.from_vscode').lazy_load()
  end,
}
