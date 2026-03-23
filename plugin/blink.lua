require('utils')

vim.pack.add({
  { src = Gh('saghen/blink.cmp'), version = vim.version.range('1.x') },
  Gh('rafamadriz/friendly-snippets'),
})

require('blink.cmp').setup({
  keymap = {
    preset = 'super-tab',
    ['<CR>'] = { 'accept', 'fallback' },
    ['<C-l>'] = { 'snippet_forward', 'fallback' },
    ['<C-h>'] = { 'snippet_backward' },
    ['<C-d>'] = { function(cmp) cmp.show({ providers = { 'buffer' } }) end },
    ['<C-s>'] = { function(cmp) cmp.show({ providers = { 'lazydev', 'lsp' } }) end },
  },
  appearance = {
    nerd_font_variant = 'mono'
  },
  completion = {
    ghost_text = {
      enabled = true,
    },
    menu = {
      draw = {
        treesitter = { 'lsp' }
      }
    },
    documentation = {
      auto_show = true,
      window = {
        border = 'solid',
      }
    }
  },
  sources = {
    default = { 'lazydev', 'lsp', 'path', 'snippets', 'buffer' },
    providers = {
      lazydev = {
        name = 'LazyDev',
        module = 'lazydev.integrations.blink',
        score_offset = 100,
      },
    },
  },
  fuzzy = { implementation = 'prefer_rust_with_warning' },
})
