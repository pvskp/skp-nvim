---@module 'codecompanion'
---@module "lazy"
---@type LazyPluginSpec
return {
  'olimorris/codecompanion.nvim',
  lazy = false,
  version = '*',
  cmd = { 'CodeCompanionChat' },
  keys = {
    {
      '<leader>aa',
      '<cmd>CodeCompanionChat toggle<CR>',
    },
    {
      '<leader>ae',
      ':CodeCompanion ',
      mode = { 'n', 'v' },
    },
  },
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
    {
      'echasnovski/mini.diff',
      version = '*',
      config = function(self, opts)
        local diff = require('mini.diff')
        diff.setup({
          source = diff.gen_source.none(),
        })
      end,
    },
    'ravitemer/mcphub.nvim',
    {
      'j-hui/fidget.nvim',
      opts = {
        notification = {
          window = {
            normal_hl = 'none', -- Base highlight group in the notification window
            winblend = 0, -- Background color opacity in the notification window
            border = 'none', -- Border around the notification window
            zindex = 45, -- Stacking priority of the notification window
            max_width = 0, -- Maximum width of the notification window
            max_height = 0, -- Maximum height of the notification window
            x_padding = 1, -- Padding from right edge of window boundary
            y_padding = 0, -- Padding from bottom edge of window boundary
            align = 'bottom', -- How to align the notification window
            relative = 'editor', -- What the notification window position is relative to
          },
        },
      },
    },
  },
  init = function(self)
    local group = vim.api.nvim_create_augroup('CodeCompanionFidgetHooks', {})
    local progress = require('fidget.progress')
    local handles = {}

    local function llm_role_title(adapter)
      local parts = {}
      table.insert(parts, adapter.formatted_name)
      if adapter.model and adapter.model ~= '' then
        table.insert(parts, '(' .. adapter.model .. ')')
      end
      return table.concat(parts, ' ')
    end

    local function store_progress_handle(id, handle)
      handles[id] = handle
    end

    local function pop_progress_handle(id)
      local handle = handles[id]
      handles[id] = nil
      return handle
    end

    local function create_progress_handle(request)
      return progress.handle.create({
        -- title = "  Requesting assistance (" .. request.data.strategy .. ")",
        title = '',
        message = '  Sending...',
        lsp_client = {
          name = llm_role_title(request.data.adapter),
        },
      })
    end

    local function report_exit_status(handle, request)
      if request.data.status == 'success' then
        handle.message = 'Completed'
      elseif request.data.status == 'error' then
        handle.message = ' Error'
      else
        handle.message = '󰜺 Cancelled'
      end
    end

    vim.api.nvim_create_autocmd({ 'User' }, {
      pattern = 'CodeCompanionRequestStarted',
      callback = function(request)
        local handle = create_progress_handle(request)
        store_progress_handle(request.data.id, handle)
      end,
    })

    vim.api.nvim_create_autocmd({ 'User' }, {
      pattern = 'CodeCompanionRequestFinished',
      group = group,
      callback = function(request)
        local handle = pop_progress_handle(request.data.id)
        if handle then
          report_exit_status(handle, request)
          handle:finish()
        end
      end,
    })
  end,
  config = function()
    require('codecompanion').setup({
      strategies = {
        chat = {
          adapter = {
            name = 'copilot',
            model = 'claude-3.7-sonnet',
          },
        },
      },
      display = {
        action_palette = {
          provider = 'snacks',
        },
        diff = {
          provider = 'mini_diff',
        },
        chat = {
          window = {
            layout = 'horizontal', -- float|vertical|horizontal|buffer
            position = 'bottom',
            height = 0.5,
            width = 0.45,
          },
        },
      },
      extensions = {
        mcphub = {
          callback = 'mcphub.extensions.codecompanion',
          opts = {
            make_vars = true,
            make_slash_commands = true,
            show_result_in_chat = true,
          },
        },
      },
    })
  end,
}
