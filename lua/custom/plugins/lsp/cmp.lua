return {
  'hrsh7th/nvim-cmp',
  event = {
    'InsertEnter',
    -- 'CmdlineEnter'
  },
  dependencies = {
    -- 'copilot',
    'hrsh7th/cmp-buffer', -- source for text in buffer
    {
      'pvskp/cmp-path',
      -- dev = false,
      -- dir = "~/Documents/repos/cmp-path/"
    },                         -- source for file system paths
    'hrsh7th/cmp-nvim-lsp',
    'amarakon/nvim-cmp-fonts', -- source for font completion
    -- 'hrsh7th/cmp-cmdline',
    -- 'hrsh7th/cmp-nvim-lsp-signature-help',
    {
      'allaman/emoji.nvim',
      version = '1.2.0',
      event = { 'InsertEnter' },
      dependencies = {
        'hrsh7th/nvim-cmp',
      },
      opts = {
        enable_cmp_integration = true,
      },
      config = function(_, opts)
        require('emoji').setup(opts)
        -- require('telescope').load_extension 'emoji'
      end,
    },
    {
      'Dynge/gitmoji.nvim',
      dependencies = {
        'hrsh7th/nvim-cmp',
      },
      opts = { -- the values below are the defaults
        filetypes = { 'gitcommit' },
        completion = {
          append_space = false,
          complete_as = 'emoji',
        },
      },
      ft = { 'gitcommit', 'NeogitCommitMessage' },
    },

    --< snippet engine >--
    {
      'L3MON4D3/LuaSnip',
      dependencies = {
        'rafamadriz/friendly-snippets',
      },
      config = function()
        local luasnip = require "luasnip"
        luasnip.filetype_extend("javascriptreact", { "html" })
        luasnip.filetype_extend("typescriptreact", { "html" })
        require('luasnip.loaders.from_snipmate').lazy_load()
        require('luasnip.loaders.from_vscode').lazy_load()

        -- vim.keymap.set("n", "<Esc>", require('luasnip').unlink_current)

        -- -- this one ends up snippet session on exiting the insert mode
        -- vim.api.nvim_create_autocmd('ModeChanged', {
        --   pattern = '*',
        --   callback = function()
        --     if ((vim.v.event.old_mode == 's' and vim.v.event.new_mode == 'n') or vim.v.event.old_mode == 'i')
        --         and require('luasnip').session.current_nodes[vim.api.nvim_get_current_buf()]
        --         and not require('luasnip').session.jump_active
        --     then
        --       require('luasnip').unlink_current()
        --     end
        --   end
        -- })

        ---
      end,
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
      view = {
        entries = {
          selection_order = 'top_down',
        },
      },
      preselect = cmp.PreselectMode.None,
      experimental = {
        ghost_text = false,
      },
      completion = {
        completeopt = 'menu,preview,noinsert',
        keyword_length = 0,
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
        ['<C-s>'] = cmp.mapping.complete {
          config = {
            sources = {
              { name = 'emoji' },
              { name = 'gitmoji' },
            },
          },
        },

        ['<C-Space>'] = cmp.mapping.complete {
          config = {
            sources = {
              -- { name = "nvim_lsp_signature_help" },
              { name = 'nvim_lsp' },
              { name = 'otter' },
            },
          },
        },
        -- ['<C-x>'] = cmp.mapping.complete {
        --   config = {
        --     sources = {
        --       { name = 'copilot' },
        --       { name = 'codeium' },
        --     },
        --   },
        -- },
        ['<C-v>'] = cmp.mapping.complete {
          config = {
            sources = {
              {
                name = 'path',
                trigger_characters = { "/", ".", '"', "'" }
              },
              { name = 'buffer' },
            },
          },
        },
        ['<C-d>'] = cmp.mapping.complete {
          config = {
            sources = {
              { name = 'fonts' },
            },
          },
        },
        ['<C-e>'] = cmp.mapping.abort(), -- close completion window
        ['<CR>'] = cmp.mapping.confirm { select = true },
        ['<Tab>'] = cmp.mapping.confirm { select = true },
        ['<C-l>'] = cmp.mapping(function()
          if luasnip.expand_or_locally_jumpable() then
            luasnip.expand_or_jump()
          end
        end, { 'i', 's' }),
        ['<C-h>'] = cmp.mapping(function()
          if luasnip.locally_jumpable(-1) then
            luasnip.jump(-1)
          end
        end, { 'i', 's' }),
      },

      -- sources for autocompletion
      sources = cmp.config.sources {
        -- { name = 'nvim_lsp_signature_help' },
        { name = 'otter' },
        { name = 'nvim_lsp' },
        { name = 'luasnip' }, -- snippets
        {
          name = 'copilot',
          keyword_length = 0,
          entry_filter = function()
            return false
          end,
        },
      },

      -- configure lspkind for vs-code like pictograms in completion menu
      formatting = {
        format = lspkind.cmp_format {
          mode = 'symbol',
          menu = {
            buffer = '(Buffer)',
            nvim_lsp = '(LSP)',
            nvim_lsp_signature_help = '(SigHelp)',
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

    -- cmp.setup.filetype({ 'gitcommit', 'NeogitCommitMessage' }, {
    --   sources = {
    --     { name = 'gitmoji' },
    --   },
    -- })

    cmp.setup.filetype({ 'markdown' }, {
      sources = {
        { name = 'luasnip' },
        { name = 'emoji' },
      },
    })

    -- cmp.setup.filetype({ 'go', 'python', 'lua' }, {
    --   sources = {
    --     {
    --       { name = 'nvim_lsp' },
    --       { name = 'nvim_lsp_signature_help' },
    --     },
    --     {
    --       { name = 'codeium' },
    --       { name = 'luasnip' }, -- snippets
    --     },
    --     {
    --       { name = 'path' },   -- file system paths
    --       { name = 'buffer' }, -- text within current buffer
    --     }
    --   }
    -- })

    if success then
      cmp.event:on('confirm_done', cmd_autopairs.on_confirm_done())
      vim.cmd 'highlight! BorderBG guibg=NONE'
    end
  end,
}
