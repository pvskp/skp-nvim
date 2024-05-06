return {
  'zbirenbaum/copilot.lua',
  event = 'InsertEnter',
  cmd = 'Copilot',
  dependencies = {
    'zbirenbaum/copilot-cmp',
    -- {
    --   'CopilotC-Nvim/CopilotChat.nvim',
    --   branch = 'canary',
    --   keys = {
    --     { '\\', ':CopilotChatToggle<CR>', { desc = 'Toggle Copilot Chat window', silent = true } },
    --   },
    --   dependencies = {
    --     { 'nvim-lua/plenary.nvim' }, -- for curl, log wrapper
    --   },
    --   opts = {
    --     -- Copilot Chat configuration
    --     debug = false, -- Enable debug logging
    --     proxy = nil, -- [protocol://]host[:port] Use this proxy
    --     allow_insecure = false, -- Allow insecure server connections

    --     -- system_prompt = prompts.COPILOT_INSTRUCTIONS, -- System prompt to use
    --     model = 'gpt-3.5-turbo', -- GPT model to use, 'gpt-3.5-turbo' or 'gpt-4'
    --     temperature = 0.1, -- GPT temperature

    --     question_header = '## User ', -- Header to use for user questions
    --     answer_header = '## Copilot ', -- Header to use for AI answers
    --     error_header = '## Error ', -- Header to use for errors
    --     separator = '---', -- Separator to use in chat

    --     show_folds = true, -- Shows folds for sections in chat
    --     show_help = true, -- Shows help message as virtual lines when waiting for user input
    --     auto_follow_cursor = true, -- Auto-follow cursor in chat
    --     auto_insert_mode = false, -- Automatically enter insert mode when opening window and if auto follow cursor is enabled on new prompt
    --     clear_chat_on_new_prompt = false, -- Clears chat on every new prompt

    --     context = 'buffer', -- Default context to use, 'buffers', 'buffer' or none (can be specified manually in prompt via @).
    --     history_path = vim.fn.stdpath 'data' .. '/copilotchat_history', -- Default path to stored history
    --     callback = nil, -- Callback to use when ask response is received

    --     -- default selection (visual or line)
    --     -- selection = function(source)
    --     --   return select.visual(source) or select.line(source)
    --     -- end,

    --     -- default prompts
    --     prompts = {
    --       Explain = {
    --         prompt = '/COPILOT_EXPLAIN Write an explanation for the active selection as paragraphs of text.',
    --       },
    --       Fix = {
    --         prompt = '/COPILOT_GENERATE There is a problem in this code. Rewrite the code to show it with the bug fixed.',
    --       },
    --       Optimize = {
    --         prompt = '/COPILOT_GENERATE Optimize the selected code to improve performance and readablilty.',
    --       },
    --       Docs = {
    --         prompt = '/COPILOT_GENERATE Please add documentation comment for the selection.',
    --       },
    --       Tests = {
    --         prompt = '/COPILOT_GENERATE Please generate tests for my code.',
    --       },
    --     },

    --     -- default window options
    --     window = {
    --       layout = 'vertical', -- 'vertical', 'horizontal', 'float'
    --       width = 0.5, -- fractional width of parent, or absolute width in columns when > 1
    --       height = 0.5, -- fractional height of parent, or absolute height in rows when > 1
    --       -- Options below only apply to floating windows
    --       relative = 'editor', -- 'editor', 'win', 'cursor', 'mouse'
    --       border = 'single', -- 'none', single', 'double', 'rounded', 'solid', 'shadow'
    --       row = nil, -- row position of the window, default is centered
    --       col = nil, -- column position of the window, default is centered
    --       title = 'Copilot Chat', -- title of chat window
    --       footer = nil, -- footer of chat window
    --       zindex = 1, -- determines if window is on top or below other floating windows
    --     },

    --     -- default mappings
    --     mappings = {
    --       complete = {
    --         detail = 'Use @<Tab> or /<Tab> for options.',
    --         insert = '<Tab>',
    --       },
    --       close = {
    --         normal = 'q',
    --         -- insert = '<C-c>',
    --         insert = '',
    --       },
    --       reset = {
    --         normal = '<C-l>',
    --         insert = '<C-l>',
    --       },
    --       submit_prompt = {
    --         normal = '<CR>',
    --         insert = '<C-m>',
    --       },
    --       accept_diff = {
    --         normal = '<C-y>',
    --         insert = '<C-y>',
    --       },
    --       yank_diff = {
    --         normal = 'gy',
    --       },
    --       show_diff = {
    --         normal = 'gd',
    --       },
    --       show_system_prompt = {
    --         normal = 'gp',
    --       },
    --       show_user_selection = {
    --         normal = 'gs',
    --       },
    --     },
    --     -- See Configuration section for rest
    --   },
    --   -- See Commands section for default commands if you want to lazy load on them
    -- },
  },
  opts = {
    suggestion = {
      enabled = false,
      auto_trigger = true,
      keymap = {
        -- accept = "<M-l>",
        accept = '<C-a>',
        accept_word = false,
        accept_line = false,
        next = '<Right>',
        prev = '<Left>',
        dismiss = '<C-c>',
      },
    },

    panel = {
      enabled = false,
    },

    filetypes = {
      yaml = true,
      markdown = true,
      help = false,
      gitcommit = false,
      gitrebase = false,
      hgcommit = false,
      svn = false,
      cvs = false,
      ['.'] = false,
    },
  },
  config = function(_, opts)
    local copilot_lua = require 'copilot'
    copilot_lua.setup(opts)
    require('copilot_cmp').setup()
  end,
}
