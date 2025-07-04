return {
  'saghen/blink.cmp',
  -- lazy = false,
  event = { 'InsertEnter' },
  dependencies = {
    {
      'saghen/blink.compat',
      version = '*',
      lazy = true,
      opts = {},
    },
    {
      'giuxtaposition/blink-cmp-copilot',
      enabled = false,

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
      dependencies = {
        'rafamadriz/friendly-snippets',
      },
      version = 'v2.*',
      config = function()
        require('luasnip.loaders.from_snipmate').lazy_load()
        require('luasnip.loaders.from_vscode').lazy_load()
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
    enabled = function()
      return not vim.tbl_contains({ 'minifiles' }, vim.bo.filetype)
    end,
    keymap = {
      preset = 'enter',
      ['<C-l>'] = { 'snippet_forward' },
      ['<C-h>'] = { 'snippet_backward' },
      ['<C-d>'] = {
        function(cmp)
          cmp.show({ providers = { 'fonts' } })
        end,
      },
      ['<C-Space>'] = {
        function(cmp)
          cmp.show({ providers = { 'lsp', 'snippets', 'lazydev' } })
        end,
      },
      ['<c-v>'] = {
        function(cmp)
          cmp.show({ providers = { 'buffer' } })
        end,
      },
      ['<c-e>'] = {
        function(cmp)
          cmp.show({ providers = { 'emoji', 'nerdfont' } })
        end,
      },
    },
    appearance = {
      nerd_font_variant = 'mono',
    },

    cmdline = {
      enabled = true,
      keymap = {
        ['<Tab>'] = { 'accept' },
      },
      completion = {
        menu = {
          auto_show = true,
        },
      },
    },
    snippets = { preset = 'luasnip' },
    completion = {
      trigger = {
        show_on_keyword = true,
        show_on_trigger_character = true,
        show_on_blocked_trigger_characters = {},
      },
      menu = {
        border = 'single',
        auto_show = true,
        max_height = 20,
        scrollbar = false,
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
          border = 'single',
          max_width = 100,
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
        -- 'copilot',
        -- 'buffer',
        -- 'nerdfont',
        -- 'emoji',
      },
      per_filetype = {
        codecompanion = { 'codecompanion' },
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
        lsp = {
          score_offset = 22,
        },
        path = {
          score_offset = 21,
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

    signature = {
      enabled = true,
      window = { border = 'single' },
    },
    fuzzy = { implementation = 'prefer_rust_with_warning' },
  },
}
