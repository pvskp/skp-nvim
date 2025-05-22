return {
  'neovim/nvim-lspconfig',
  -- version = '*',
  lazy = false,
  dependencies = {
    'saghen/blink.cmp', -- needed for lsp capabilities
    'mason-org/mason.nvim',
    { 'mason-org/mason-lspconfig.nvim' },
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

    local lspconfig = require('lspconfig')

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

    -- vim.lsp.config('pyright', {
    --   settings = {
    --     ['pyright'] = {
    --       disableOrganizeImports = true,
    --       reportMissingImports = true,
    --       analysis = {
    --         autoSearchPaths = true,
    --         typeCheckingMode = 'recommended',
    --         autoImportCompletions = true,
    --         useLibraryCodeForTypes = true,
    --         diagnosticMode = 'workspace',
    --       },
    --     },
    --   },
    -- })
    --
    -- vim.lsp.config('gopls', {
    --   settings = {
    --     ['gopls'] = {
    --       gopls = {
    --         analyses = {
    --           fillstruct = true,
    --         },
    --       },
    --     },
    --   },
    -- })
    --
    -- vim.lsp.config('ruff', {
    --   settings = {
    --     ['ruff'] = {
    --       init_options = {
    --         settings = {
    --           configurationPreference = 'filesystemFirst',
    --           fixAll = true,
    --           organizeImports = true,
    --         },
    --       },
    --     },
    --   },
    -- })
    --
    -- vim.lsp.config('helm_ls', {
    --   settings = {
    --     ['helm_ls'] = {
    --       ['helm-ls'] = {
    --         logLevel = 'info',
    --         valuesFiles = {
    --           mainValuesFile = 'values.yaml',
    --           lintOverlayValuesFile = 'values.lint.yaml',
    --           additionalValuesFilesGlobPattern = 'values*.yaml',
    --         },
    --         yamlls = {
    --           enabled = true,
    --           enabledForFilesGlob = '*.{yaml,yml}',
    --           diagnosticsLimit = 0,
    --           showDiagnosticsDirectly = false,
    --           path = 'yaml-language-server',
    --           config = {
    --             schemas = {
    --               kubernetes = 'templates/**',
    --             },
    --             completion = true,
    --             hover = true,
    --             -- any other config from https://github.com/redhat-developer/yaml-language-server#language-server-settings
    --           },
    --         },
    --       },
    --     },
    --   },
    -- })

    local servers = {
      pyright = {
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
      gopls = {
        gopls = {
          analyses = {
            fillstruct = true,
          },
        },
      },
    }

    require('mason').setup()
    require('mason-lspconfig').setup({
      ensure_installed = {}, -- explicitly set to an empty table (Kickstart populates installs via mason-tool-installer)
      automatic_installation = false,
      handlers = {
        function(server_name)
          local server = servers[server_name] or {}
          -- This handles overriding only values explicitly passed
          -- by the server configuration above. Useful when disabling
          -- certain features of an LSP (for example, turning off formatting for ts_ls)
          server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
          require('lspconfig')[server_name].setup(server)
        end,
      },
    })
  end,
}
