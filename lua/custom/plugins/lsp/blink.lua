return {
  'saghen/blink.cmp',
  lazy = false,
  -- event = { 'InsertEnter' },
  dependencies = {
    {
      'saghen/blink.compat',
      version = '*',
      lazy = true,
      opts = {},
    },
    'rafamadriz/friendly-snippets',
    {
      'giuxtaposition/blink-cmp-copilot',

      dependencies = {
        {
          'zbirenbaum/copilot.lua',
          cmd = 'Copilot',
          event = 'InsertEnter',
          config = function()
            require('copilot').setup({
              suggestion = { enabled = false },
              panel = { enabled = false },
            })
          end,
        },
      },
    },
    {
      'L3MON4D3/LuaSnip',
      version = 'v2.*',
      config = function()
        require('luasnip.loaders.from_snipmate').lazy_load()
      end,
    },
    'MahanRahmati/blink-nerdfont.nvim',
    'moyiz/blink-emoji.nvim',
    'Kaiser-Yang/blink-cmp-avante',
    'xzbdmw/colorful-menu.nvim',
    'folke/lazydev.nvim',
    'amarakon/nvim-cmp-fonts',
  },
  opts_extend = { 'sources.default' },
  version = '1.*',
  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    keymap = {
      preset = 'enter',
      ['<C-l>'] = { 'snippet_forward' },
      ['<C-h>'] = { 'snippet_backward' },
      ['<C-d>'] = {
        function(cmp)
          cmp.show({ providers = { 'fonts' } })
        end,
      },
      ['<c-space>'] = {
        function(cmp)
          cmp.show({ providers = { 'lsp', 'snippets' } })
        end,
      },
      ['<c-v>'] = {
        function(cmp)
          cmp.show({ providers = { 'buffer' } })
        end,
      },
      ['<c-e>'] = {
        function(cmp)
          cmp.show({ providers = { 'emoji' } })
        end,
      },
      ['<c-f>'] = {
        function(cmp)
          cmp.show({ providers = { 'nerdfont' } })
        end,
      },
    },
    appearance = {
      nerd_font_variant = 'mono',
    },

    cmdline = { enabled = true },
    snippets = { preset = 'luasnip' },
    completion = {
      menu = {
        draw = {
          columns = { { 'kind_icon' }, { 'label', gap = 1 } },
          components = {
            label = {
              text = function(ctx)
                return require('colorful-menu').blink_components_text(ctx)
              end,
              highlight = function(ctx)
                return require('colorful-menu').blink_components_highlight(ctx)
              end,
            },
          },
        },
      },
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 0,
        window = {
          max_width = 20,
        },
      },
      ghost_text = { enabled = true },
    },

    -- Default list of enabled providers defined so that you can extend it
    -- elsewhere in your config, without redefining it, due to `opts_extend`
    sources = {
      default = {
        'lazydev',
        'snippets',
        'avante',
        'lsp',
        'path',
        'copilot',
        -- 'buffer',
        -- 'nerdfont',
        -- 'emoji',
      },
      providers = {
        copilot = {
          name = 'copilot',
          module = 'blink-cmp-copilot',
          score_offset = 100,
          async = true,
        },
        lazydev = {
          name = 'LazyDev',
          module = 'lazydev.integrations.blink',
          score_offset = 100,
        },
        snippets = {
          score_offset = 20,
        },
        nerdfont = {
          module = 'blink-nerdfont',
          name = 'Nerd Fonts',
          score_offset = 15, -- Tune by preference
          opts = { insert = true }, -- Insert nerdfont icon (default) or complete its name
        },
        emoji = {
          module = 'blink-emoji',
          name = 'Emoji',
          score_offset = 16, -- Tune by preference
          opts = {
            insert = true,
          },
        },
        avante = {
          module = 'blink-cmp-avante',
          name = 'Avante',
          opts = {},
        },
        fonts = {
          name = 'fonts',
          module = 'blink.compat.source',
          score_offset = -1,
          opts = {
            cmp_name = 'fonts',
          },
        },
      },
    },

    signature = { enabled = true },
    fuzzy = { implementation = 'prefer_rust_with_warning' },
  },
}
