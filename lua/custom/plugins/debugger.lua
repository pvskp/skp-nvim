return {
  'mfussenegger/nvim-dap',
  -- stylua: ignore start
  keys = {
    { '<F5>',      function() require('dap').continue()          end, desc = "[nvim-dap] Continue"},
    { '<F10>',     function() require('dap').step_over()         end, desc = "[nvim-dap] Step over"},
    { '<F11>',     function() require('dap').step_into()         end, desc = "[nvim-dap] Step into"},
    { '<F12>',     function() require('dap').step_out()          end, desc = "[nvim-dap] Step out"},
    { '<leader>b', function() require('dap').toggle_breakpoint() end, desc = "[nvim-dap] Toggle breakpoint"},
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
