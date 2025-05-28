return {
  'yetone/avante.nvim',
  -- event = 'VeryLazy',
  keys = {
    { '<leader>at', '<cmd>AvanteAsk<CR>' },
    { '<leader>aa', '<cmd>AvanteAsk<CR>' },
    { '<leader>ae', '<cmd>AvanteEdit<CR>' },
  },
  version = false, -- Never set this value to "*"! Never!
  build = 'make',
  dependencies = {
    'stevearc/dressing.nvim',
    'nvim-lua/plenary.nvim',
    'MunifTanjim/nui.nvim',
    --- The below dependencies are optional,
    'nvim-tree/nvim-web-devicons', -- or echasnovski/mini.icons
    'ravitemer/mcphub.nvim',
    -- 'zbirenbaum/copilot.lua',
  },
  opts = {
    provider = 'copilot',
    ---@alias Mode "agentic" | "legacy"
    mode = 'legacy', -- The default mode for interaction. "agentic" uses tools to automatically generate code, "legacy" uses the old planning method to generate code.
    copilot = {
      model = 'claude-3.7-sonnet',
    },
    hints = { enabled = false },
    system_prompt = function()
      local hub = require('mcphub').get_hub_instance()
      ---@diagnostic disable-next-line: need-check-nil
      return hub:get_active_servers_prompt()
    end,
    custom_tools = function()
      return {
        require('mcphub.extensions.avante').mcp_tool(),
      }
    end,
    windows = {
      ---@type "right" | "left" | "top" | "bottom"
      position = 'right', -- the position of the sidebar
      wrap = true, -- similar to vim.o.wrap
      width = 30, -- default % based on available width
      sidebar_header = {
        enabled = true, -- true, false to enable/disable the header
        align = 'center', -- left, center, right for title
        rounded = false,
      },
      input = {
        prefix = '> ',
        height = 8, -- Height of the input window in vertical layout
      },
      edit = {
        border = 'single',
        start_insert = true, -- Start insert mode when opening the edit window
      },
      ask = {
        floating = false, -- Open the 'AvanteAsk' prompt in a floating window
        start_insert = false, -- Start insert mode when opening the ask window
        border = 'single',
        ---@type "ours" | "theirs"
        focus_on_apply = 'ours', -- which diff to focus after applying
      },
    },
  },
  config = function(_, opts)
    require('avante').setup(opts)
    vim.api.nvim_create_autocmd('FileType', {
      pattern = 'Avante*',
      callback = function()
        vim.keymap.set('n', '<Esc><Esc>', '<cmd>AvanteToggle<CR>', { buffer = true })
        vim.keymap.set('n', '<leader>aa', '<cmd>AvanteToggle<CR>', { buffer = true })
        vim.keymap.set('n', 'q', 'q', { buffer = true })
      end,
    })
  end,
  init = function()
    vim.opt.laststatus = 3
  end,
}
