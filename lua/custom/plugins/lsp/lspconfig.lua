return {
  'neovim/nvim-lspconfig',
  version = '*',
  -- event = { 'BufReadPost', 'BufWritePost', 'BufNewFile' },
  lazy = false,
  dependencies = {
    -- 'hrsh7th/cmp-nvim-lsp', -- needed for lsp capabilities
    'saghen/blink.cmp', -- needed for lsp capabilities
    {
      'mason-org/mason.nvim',
      version = '*',
      opts = {},
    },
    { 'j-hui/fidget.nvim', opts = {} },
  },
  config = function()
    vim.diagnostic.config({
      virtual_text = false,
      underline = true,
      float = {},
    })

    vim.diagnostic.config({
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = ' ',
          [vim.diagnostic.severity.WARN] = ' ',
          [vim.diagnostic.severity.INFO] = ' ',
          [vim.diagnostic.severity.HINT] = ' ',
        },
      },
    })

    vim.api.nvim_create_autocmd({ 'LspAttach' }, {
      group = vim.api.nvim_create_augroup('LspAttach', {}),
      callback = function(args)
        local lsp_keymaps = require('custom.remap.lsp')
        lsp_keymaps.setup(args.buf)
      end,
    })

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = vim.tbl_deep_extend('force', capabilities, require('blink.cmp').get_lsp_capabilities())

    capabilities.textDocument.foldingRange = {
      dynamicRegistration = false,
      lineFoldingOnly = true,
    }

    local servers = {
      lua_ls = {},
      jsonls = {},
      bashls = {},

      pyright = {
        settings = {
          ['pyright'] = {
            disableOrganizeImports = true,
            reportMissingImports = true,
            analysis = {
              autoSearchPaths = true,
              typeCheckingMode = 'recommended',
              autoImportCompletions = true,
              useLibraryCodeForTypes = true,
              diagnosticMode = 'workspace',
            },
          },
        },
      },

      gopls = {
        settings = {
          ['gopls'] = {
            gopls = {
              analyses = {
                fillstruct = true,
              },
            },
          },
        },
      },

      ruff = {
        settings = {
          ['ruff'] = {
            init_options = {
              settings = {
                configurationPreference = 'filesystemFirst',
                fixAll = true,
                organizeImports = true,
              },
            },
          },
        },
      },

      helm_ls = {
        settings = {
          ['helm_ls'] = {
            ['helm-ls'] = {
              logLevel = 'info',
              valuesFiles = {
                mainValuesFile = 'values.yaml',
                lintOverlayValuesFile = 'values.lint.yaml',
                additionalValuesFilesGlobPattern = 'values*.yaml',
              },
              yamlls = {
                enabled = true,
                enabledForFilesGlob = '*.{yaml,yml}',
                diagnosticsLimit = 0,
                showDiagnosticsDirectly = false,
                path = 'yaml-language-server',
                config = {
                  schemas = {
                    kubernetes = 'templates/**',
                  },
                  completion = true,
                  hover = true,
                  -- any other config from https://github.com/redhat-developer/yaml-language-server#language-server-settings
                },
              },
            },
          },
        },
      },
    }

    for k, v in pairs(servers) do
      vim.lsp.config(k, v)
    end

    vim.lsp.config('*', {
      capabilities = capabilities,
    })

    vim.lsp.enable(vim.tbl_keys(servers or {}))

    require('mason').setup()
    local lspconfig = require('lspconfig')
  end,
}
