return {
  'saghen/blink.cmp',
  lazy = false, -- lazy loading handled internally
  -- optional: provides snippets for the snippet source
  dependencies = {
    {
      'L3MON4D3/LuaSnip',
      config = function()
        local luasnip = require("luasnip")
        luasnip.filetype_extend("javascriptreact", { "html" })
        luasnip.filetype_extend("typescriptreact", { "html" })
        require('luasnip.loaders.from_vscode').lazy_load()
        require("luasnip.loaders.from_snipmate").lazy_load()
      end
    },
    'rafamadriz/friendly-snippets',
  },
  version = 'v0.*',
  opts = {
    snippets = {
      expand = function(snippet) require('luasnip').lsp_expand(snippet) end,
      active = function(filter)
        if filter and filter.direction then
          return require('luasnip').jumpable(filter.direction)
        end
        return require('luasnip').in_snippet()
      end,
      jump = function(direction) require('luasnip').jump(direction) end,
    },
    sources = {
      default = { 'lsp', 'path', 'luasnip', 'buffer' },
      providers = {
        lsp = {
          async = true,
          -- async = function()
          --   local clients = vim.lsp.get_clients({ bufnr = 0 })
          --   for _, client in ipairs(clients) do
          --     if client.name == 'marksman' then
          --       return true
          --       local
          --     end
          --     return false
          --   end
          -- end
        }
      },
    },
    windows = {
      documentation = {
        auto_show = true,
      },
    },
    keymap = {
      preset = 'enter',
      ['<C-l>'] = {'snippet_forward', 'fallback'},
      ['<C-h>'] = {'snippet_backward', 'fallback'},
    },
    completion = { accept = { auto_brackets = { enabled = true } } },
    signature = { enabled = true },
    opts_extend = { "sources.default" }
  },
}
