return {
  'neovim/nvim-lspconfig',
  event = { 'BufReadPre', 'BufNewFile' },
  dependencies = {
    'hrsh7th/cmp-nvim-lsp',
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    'antosha417/nvim-lsp-file-operations',
    'nvim-lua/plenary.nvim',
  },
  config = function()
    vim.lsp.handlers['textDocument/hover'] =
        vim.lsp.with(vim.lsp.handlers.hover, { border = Borders.simple })
    vim.lsp.handlers['textDocument/signatureHelp'] =
        vim.lsp.with(vim.lsp.handlers.signature_help, { border = Borders.simple })

    vim.diagnostic.config {
      virtual_text = false,
      underline = true,
      float = { border = Borders.simple },
    }

    local signs = Symbols.diagnostics

    for type, icon in pairs(signs) do
      local hl = 'DiagnosticSign' .. type
      vim.fn.sign_define(hl, {
        text = icon,
        texthl = hl,
        numhl = '',
      })
    end

    local mason = require 'mason'
    local mason_lspconfig = require 'mason-lspconfig'
    local mason_tool_installer = require 'mason-tool-installer'
    local lspconfig = require 'lspconfig'

    -- enable mason and configure icons
    mason.setup {
      ui = {
        icons = {
          package_installed = '✓',
          package_pending = '➜',
          package_uninstalled = '✗',
        },
        border = Borders.simple,
      },
    }

    mason_lspconfig.setup {
      automatic_installation = false, -- not the same as ensure_installed
    }

    local keymap = vim.keymap -- for conciseness
    local opts = { noremap = true, silent = true }
    local set_keymaps = function(bufnr)
      opts.buffer = bufnr

      keymap.set(
        'n',
        '<leader>.',
        '<cmd>lua vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())<CR>',
        { desc = '[T]oggle inlay_hint', silent = true }
      )

      if pcall(require, 'telescope') then
        keymap.set(
          'n',
          'gd',
          require('telescope.builtin').lsp_definitions,
          { desc = '[G]oto [D]efinition' }
        )
        keymap.set(
          'n',
          'gr',
          require('telescope.builtin').lsp_references,
          { desc = '[G]oto [R]eferences' }
        )
        keymap.set(
          'n',
          'gI',
          require('telescope.builtin').lsp_implementations,
          { desc = '[G]oto [I]mplementation' }
        )
        keymap.set(
          'n',
          '<leader>D',
          require('telescope.builtin').lsp_type_definitions,
          { desc = 'Type [D]efinition' }
        )
        keymap.set(
          'n',
          '<leader>ds',
          require('telescope.builtin').lsp_document_symbols,
          { desc = '[D]ocument [S]ymbols' }
        )

        -- keymap.set(
        --   'n',
        --   '<leader>ws',
        --   require('telescope.builtin').lsp_dynamic_workspace_symbols,
        --   { desc = '[W]orkspace [S]ymbols' }
        -- )
      else
        keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = '[G]o to [D]efinition' }) -- show lsp definitions
        keymap.set('n', 'gr', vim.lsp.buf.references, { desc = '[G]o to [R]eferences' })
      end

      opts.desc = 'Uses Navbuddy'
      keymap.set('n', '<leader>n', ':Navbuddy<CR>', opts)

      opts.desc = 'Go to declaration'
      keymap.set('n', 'gD', vim.lsp.buf.declaration, opts) -- go to declaration

      opts.desc = 'See available code actions'
      keymap.set({ 'n', 'v' }, '<leader>a', vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

      opts.desc = 'Smart rename'
      keymap.set('n', '<leader>r', vim.lsp.buf.rename, opts) -- smart rename

      opts.desc = 'Show line diagnostics'
      keymap.set('n', '<leader>d', vim.diagnostic.open_float, opts) -- show diagnostics for line

      opts.desc = 'Formats code'
      keymap.set('n', '<leader>p', vim.lsp.buf.format, opts)

      opts.desc = 'Show line diagnostics'
      keymap.set('n', 'gl', vim.diagnostic.open_float, opts) -- show diagnostics for line

      opts.desc = 'Go to previous diagnostic'
      keymap.set('n', '[d', function()
        vim.diagnostic.jump({ count = -1 })
      end, opts) -- jump to previous diagnostic in buffer

      opts.desc = 'Go to next diagnostic'
      keymap.set('n', ']d', function()
        vim.diagnostic.jump({ count = 1 })
      end, opts) -- jump to next diagnostic in buffer

      opts.desc = 'Opens quickfix list with diagnostics'
      vim.keymap.set('n', '<leader>oq', vim.diagnostic.setloclist, opts)

      opts.desc = 'Show documentation for what is under cursor'
      keymap.set('n', 'K', vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

      opts.desc = 'Restart LSP'
      keymap.set('n', '<leader>rs', ':LspRestart<CR>', opts)
    end

    local on_attach = function(_, bufnr)
      -- mapping to restart lsp if necessary
      set_keymaps(bufnr)

      -- vim.highlight.priorities.semantic_tokens = 95
      -- vim.highlight.priorities.treesitter = 201
    end

    -- used to enable autocompletion (assign to every lsp server config)
    local capabilities = require('cmp_nvim_lsp').default_capabilities()
    capabilities.textDocument.foldingRange = {
      dynamicRegistration = false,
      lineFoldingOnly = true,
    }

    -- Setup lua language server separately so it works on arm
    lspconfig.lua_ls.setup {
      capabilities = capabilities,
      on_attach = on_attach,
      settings = { -- custom settings for lua
        Lua = {
          -- make the language server recognize "vim" global
          hint = { enable = true },
          diagnostics = {
            globals = { 'vim' },
          },
          workspace = {
            -- make language server aware of runtime files
            library = {
              [vim.fn.expand '$VIMRUNTIME/lua'] = true,
              [vim.fn.stdpath 'config' .. '/lua'] = true,
            },
          },
        },
      },
    }

    lspconfig.pyright.setup {
      capabilities = capabilities,
      on_attach = on_attach,
    }

    mason_lspconfig.setup_handlers {
      function(server_name) -- default handler (optional)
        lspconfig[server_name].setup {
          capabilities = capabilities,
          on_attach = on_attach,
        }
      end,
      ['clangd'] = function()
        lspconfig.clangd.setup {
          on_attach = on_attach,
          capabilities = capabilities,
          cmd = {
            'clangd',
            '--offset-encoding=utf-16',
          },
        }
      end,
    }

    mason_tool_installer.setup {
      ensure_installed = {
        'autoflake',
        'beautysh',
        'black',
        'eslint_d',
        'flake8',
        'goimports',
        'golangci-lint',
        'gopls',
        'isort',
        'jsonls',
        'jsonlint',
        'luacheck',
        'prettier',
        'prettierd',
        'pylint',
        'pyright',
        'ruff',
        'ruff_lsp',
        'stylua',
        'terraformls', -- terraformls
        'tflint',
        'tfsec',
        'yamlls',
      },
    }
  end,
}
