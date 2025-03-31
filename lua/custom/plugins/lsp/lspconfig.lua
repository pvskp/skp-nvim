return {
  'neovim/nvim-lspconfig',
  version = '*',
  event = { "BufReadPost", "BufWritePost", "BufNewFile" },
  dependencies = {
    -- 'hrsh7th/cmp-nvim-lsp', -- needed for lsp capabilities
    -- "saghen/blink.cmp", -- needed for lsp capabilities
    {
      'williamboman/mason.nvim',
      version = '*',
      opts = {
        ui = {
          border = Borders.simple,
          icons = {
            package_installed = '✅',
            package_pending = '🔶',
            package_uninstalled = '❌',
          },
          -- icons = {
          --   package_installed = "✓",
          --   package_pending = "➜",
          --   package_uninstalled = "✗"
          -- }
        },
      },
    },
    'williamboman/mason-lspconfig.nvim',
    'nvim-lua/plenary.nvim',
  },
  config = function()
    vim.diagnostic.config {
      virtual_text = false,
      underline = true,
      float = {
        -- border = Borders.simple,
      },
    }

    local signs = Symbols.diagnostics

    -- for type, icon in pairs(signs) do
    -- local hl = 'DiagnosticSign' .. type
    vim.diagnostic.config({
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = " ",
          [vim.diagnostic.severity.WARN] = " ",
          [vim.diagnostic.severity.INFO] = " ",
          [vim.diagnostic.severity.HINT] = " "
        }
      }
    })
    --   vim.fn.sign_define(hl, {
    --     text = icon,
    --     texthl = hl,
    --     numhl = '',
    --   })
    -- end

    local mason_lspconfig = require 'mason-lspconfig'
    local lspconfig = require 'lspconfig'

    mason_lspconfig.setup {
      automatic_installation = false, -- not the same as ensure_installed
    }

    local keymap = vim.keymap -- for conciseness
    local opts = { noremap = true, silent = true }
    local set_keymaps = function(bufnr)
      opts.buffer = bufnr

      -- keymap.set(
      --   'n',
      --   '<leader>.',
      --   '<cmd>lua vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())<CR>',
      --   { desc = '[T]oggle inlay_hint', silent = true }
      -- )

      -- opts.desc = 'Go to declaration'
      -- keymap.set('n', 'gD', vim.lsp.buf.declaration, opts) -- go to declaration

      -- opts.desc = 'Go to definition'
      -- keymap.set('n', 'gd', vim.lsp.buf.definition, opts) -- go to declaration

      opts.desc = "Toggle inlay hint"
      keymap.set('n', '<leader>li', function()
        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
      end)

      keymap.set('n', '<leader>ll', function()
        local new_config = not vim.diagnostic.config().virtual_lines
        vim.diagnostic.config({ virtual_lines = new_config })
      end, { desc = 'Toggle diagnostic virtual_lines' })

      opts.desc = "Toggle inlay hint"
      keymap.set('n', '<leader>li', function()
        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
      end)

      -- opts.desc = 'Go to declaration in vertical split'
      keymap.set('n', 'gV', function()
        vim.cmd 'vsplit'
        vim.lsp.buf.definition()
      end, opts)

      opts.desc = 'Go to declaration in horizontal split'
      keymap.set('n', 'gh', function()
        vim.cmd 'split'
        vim.lsp.buf.definition()
      end, opts)

      opts.desc = 'See available code actions'
      keymap.set({ 'n', 'v' }, '<leader>la', vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

      opts.desc = 'Smart rename'
      keymap.set('n', '<leader>r', vim.lsp.buf.rename, opts) -- smart rename

      opts.desc = 'Show line diagnostics'
      keymap.set('n', '<leader>d', vim.diagnostic.open_float, opts) -- show diagnostics for line

      opts.desc = 'Formats code'
      keymap.set('n', '<leader>lf', vim.lsp.buf.format, opts)

      opts.desc = 'Show LSP signature'
      vim.keymap.set('i', '<C-k>', function()
        vim.lsp.buf.signature_help({ border = "solid" })
      end, opts)

      opts.desc = 'Show line diagnostics'
      keymap.set('n', 'gl', vim.diagnostic.open_float, opts) -- show diagnostics for line

      opts.desc = 'Go to previous diagnostic'
      keymap.set('n', '[d', function()
        vim.diagnostic.jump({ count = -1, float = true })
      end, opts) -- jump to previous diagnostic in buffer

      opts.desc = 'Go to next diagnostic'
      keymap.set('n', ']d', function ()
        vim.diagnostic.jump({ count = 1, float = true })
      end, opts) -- jump to next diagnostic in buffer

      opts.desc = 'Opens quickfix list with diagnostics'
      vim.keymap.set('n', '<leader>oq', vim.diagnostic.setloclist, opts)

      opts.desc = 'Show documentation for what is under cursor'
      keymap.set('n', 'K', function()
        vim.lsp.buf.hover({ border = "solid" })
      end, opts) -- show documentation for what is under cursor

      -- opts.desc = 'Restart LSP'
      -- keymap.set('n', '<leader>rs', ':LspRestart<CR>', opts)
    end

    local on_attach = function(_, bufnr)
      -- mapping to restart lsp if necessary
      set_keymaps(bufnr)

      -- vim.highlight.priorities.semantic_tokens = 95
      -- vim.highlight.priorities.treesitter = 201
    end


    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())
    --

    -- capabilities = vim.tbl_deep_extend(
    --   'force',
    --   capabilities,
    --   require('blink.cmp').get_lsp_capabilities(capabilities)
    -- )

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
      settings = {
        pyright = {
          disableOrganizeImports = true,
          reportMissingImports = true,
          analysis = {
            autoSearchPaths = true,
            typeCheckingMode = "recommended",
            autoImportCompletions = true,
            useLibraryCodeForTypes = true,
            diagnosticMode = 'workspace',
          },
        },
      },
      on_attach = on_attach,
    }

    mason_lspconfig.setup_handlers {
      function(server_name) -- default handler
        lspconfig[server_name].setup {
          capabilities = capabilities,
          on_attach = on_attach,
        }
      end,
      ['lua_ls'] = function()
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
      end,
      ["taplo"] = function()
        lspconfig.taplo.setup {
          cmd = { "taplo", "lsp", "stdio" }
        }
      end,
      ['ruff'] = function()
        lspconfig.ruff.setup {
          init_options = {
            settings = {
              configurationPreference = "filesystemFirst",
              fixAll = true,
              organizeImports = true
            }
          }
        }
      end,
      ['gopls'] = function()
        lspconfig.gopls.setup {
          on_attach = on_attach,
          capabilities = capabilities,
          cmd = { 'gopls' },
          settings = {
            gopls = {
              analyses = {
                fillstruct = true,
              },
            },
          },
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
      ['cssls'] = function()
        lspconfig.cssls.setup {
          on_attach = on_attach(),
          capabilities = capabilities,
          settings = {
            css = {
              validate = true,
              lint = {
                unknownAtRules = 'ignore'
              }
            },
            scss = {
              validate = true,
              lint = {
                unknownAtRules = 'ignore'
              }
            }
          }
        }
      end,
      ['helm_ls'] = function()
        lspconfig.helm_ls.setup {
          on_attach = on_attach,
          capabilities = capabilities,
          settings = {
            ['helm-ls'] = {
              logLevel = "info",
              valuesFiles = {
                mainValuesFile = "values.yaml",
                lintOverlayValuesFile = "values.lint.yaml",
                additionalValuesFilesGlobPattern = "values*.yaml"
              },
              yamlls = {
                enabled = true,
                enabledForFilesGlob = "*.{yaml,yml}",
                diagnosticsLimit = 0,
                showDiagnosticsDirectly = false,
                path = "yaml-language-server",
                config = {
                  schemas = {
                    kubernetes = "templates/**",
                  },
                  completion = true,
                  hover = true,
                  -- any other config from https://github.com/redhat-developer/yaml-language-server#language-server-settings
                }
              }
            }
          }
        }
      end,
    }
  end,
}
