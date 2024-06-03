return {
  'hrsh7th/nvim-cmp',
  event = {
    'InsertEnter',
    -- 'CmdlineEnter'
  },
  dependencies = {
    'hrsh7th/cmp-buffer', -- source for text in buffer
    'hrsh7th/cmp-path', -- source for file system paths
    -- 'hrsh7th/cmp-cmdline',
    'hrsh7th/cmp-nvim-lsp-signature-help',
    'amarakon/nvim-cmp-fonts', -- source for font completion

    --< snippet engine >--
    {
      'L3MON4D3/LuaSnip',
      event = {
        'InsertEnter',
        -- 'CmdlineEnter'
      },
    },
    'saadparwaiz1/cmp_luasnip',
    'onsails/lspkind.nvim', -- vs-code like pictograms
  },
  config = function()
    local cmp = require 'cmp'
    local luasnip = require 'luasnip'
    local lspkind = require 'lspkind'

    local success, cmd_autopairs = pcall(require, 'nvim-autopairs.completion.cmp')

    cmp.setup {
      preselect = cmp.PreselectMode.Item,
      experimental = {
        ghost_text = true,
      },
      completion = {
        completeopt = 'menu,preview,noinsert',
      },
      window = {
        completion = cmp.config.window.bordered {
          border = Borders.simple,
          scrollbar = false,
          winhighlight = 'Normal:NormalFloat,FloatBorder:NormalFloat,CursorLine:PmenuSel,Search:None',
        },
        documentation = cmp.config.window.bordered {
          border = Borders.simple,
          winhighlight = 'Normal:NormalFloat,FloatBorder:NormalFloat,CursorLine:PmenuSel,Search:None',
        },
      },
      snippet = {
        -- configure how nvim-cmp interacts with snippet engine
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },

      mapping = cmp.mapping.preset.insert {
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4), -- show completion suggestions
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(), -- close completion window
        -- ["<CR>"] = cmp.mapping.confirm({ select = false }),
        ['<CR>'] = cmp.mapping.confirm { select = true },
        ['<Tab>'] = cmp.mapping.confirm { select = true },
      },

      -- sources for autocompletion
      sources = cmp.config.sources {
        { name = 'nvim_lsp_signature_help' },
        { name = 'fonts' },
        { name = 'gitmoji' },
        { name = 'nvim_lsp' },
        { name = 'codeium' },
        { name = 'copilot' },
        { name = 'luasnip' }, -- snippets
        { name = 'path' }, -- file system paths
        { name = 'buffer' }, -- text within current buffer
      },

      -- configure lspkind for vs-code like pictograms in completion menu
      formatting = {
        format = lspkind.cmp_format {
          mode = 'symbol',
          menu = {
            buffer = '(Buffer)',
            nvim_lsp = '(LSP)',
            luasnip = '(LuaSnip)',
            nvim_lua = '(Lua)',
            latex_symbols = '(Latex)',
            codeium = '(AI)',
            fonts = '(Fonts)',
          },
          maxwidth = 50,
          ellipsis_char = '...',
          symbol_map = {
            Codeium = '󱚣',
            Copilot = '',
          },
        },
      },
    }

    -- Prevents copilot autotrigger when cmp menu is open
    cmp.event:on('menu_opened', function()
      vim.b.copilot_suggestion_hidden = true
    end)

    cmp.event:on('menu_closed', function()
      vim.b.copilot_suggestion_hidden = false
    end)

    if success then
      cmp.event:on('confirm_done', cmd_autopairs.on_confirm_done())
      vim.cmd 'highlight! BorderBG guibg=NONE'
    end

    -- cmp.setup.filetype({ 'conf', 'config', 'kitty', 'toml' }, {
    --   sources = {
    --     -- {
    --     --   name = 'fonts',
    --     --   option = { space_filter = '-' },
    --     -- },
    --     { name = 'path' },
    --   },
    -- })

    local cmd_mappings = {

      ['<C-n>'] = {
        c = function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          else
            fallback()
          end
        end,
      },

      ['<C-p>'] = {
        c = function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          else
            fallback()
          end
        end,
      },

      ['<C-e>'] = {
        c = cmp.mapping.abort(),
      },

      ['<C-x>'] = {
        c = cmp.mapping.confirm { select = false },
      },

      ['<Tab>'] = {
        c = cmp.mapping.confirm { select = false },
      },
    }
  end,
}
