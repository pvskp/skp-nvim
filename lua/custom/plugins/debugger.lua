return {
  'mfussenegger/nvim-dap',
  lazy = false,
  -- stylua: ignore start
  keys = {
    { '<F5>',      function() require('dap').continue()          end },
    { '<F10>',     function() require('dap').step_over()         end },
    { '<F11>',     function() require('dap').step_into()         end },
    { '<F12>',     function() require('dap').step_out()          end },
    { '<leader>b', function() require('dap').toggle_breakpoint() end },
  },
  -- stylua: ignore end
  dependencies = {
    { 'rcarriga/nvim-dap-ui', config = true },
    'nvim-neotest/nvim-nio',
    {
      'mfussenegger/nvim-dap-python',
      config = function()
        require('dap-python').setup('python3')
      end,
    },
  },
  config = function()
    local dap = require('dap')
    local dapui = require('dapui')

    dap.listeners.before.attach.dapui_config = function()
      dapui.open()
    end

    dap.listeners.before.launch.dapui_config = function()
      dapui.open()
    end

    vim.api.nvim_create_user_command('DapToggleUI', function()
      require('dapui').toggle()
    end, {})
  end,
}
