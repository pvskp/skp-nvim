return {
  'Wansmer/treesj',
  keys = {
    { 'gS', function() require('treesj').toggle({ split = { recursive = true } }) end },
  },
  dependencies = { 'nvim-treesitter/nvim-treesitter' }, -- if you install parsers with `nvim-treesitter`
  event = 'VeryLazy',
  config = function()
    require('treesj').setup({
      use_default_keymaps = false,
    })
  end,
}
