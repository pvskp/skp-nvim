return {
  'nvim-neotest/neotest',
  ft = { 'go' },
  dependencies = {
    'nvim-neotest/nvim-nio',
    'nvim-lua/plenary.nvim',
    'antoinemadec/FixCursorHold.nvim',
    'nvim-treesitter/nvim-treesitter',
    'fredrikaverpil/neotest-golang',
  },

  config = function()
    require('neotest').setup({
      adapters = {
        require('neotest-golang')({
          -- This lags a lot, event with discovery.enablede = false
          testify_enabled = false,
        }),
      },
      discovery = {
        -- Drastically improve performance in ginormous projects by
        -- only AST-parsing the currently opened buffer.
        enabled = false,
      },
      running = {
        -- Run tests concurrently when an adapter provides multiple commands to run.
        concurrent = true,
      },

      icons = {
        child_indent = '│',
        child_prefix = '├',
        collapsed = '─',
        expanded = '╮',
        -- failed = '',
        failed = 'X',
        final_child_indent = ' ',
        final_child_prefix = '╰',
        non_collapsible = '─',
        notify = '',
        passed = '',
        running = '',
        running_animated = { '/', '|', '\\', '-', '/', '|', '\\', '-' },
        skipped = '',
        unknown = '',
        watching = '',
      },
    })

    --- stylua: ignore start
    vim.keymap.set('n', '<leader>tr', require('neotest').run.run, { desc = '[Neotest] Run test under the cursor' })
    vim.keymap.set('n', '<leader>ts', require('neotest').summary.toggle, { desc = '[Neotest] Toggle summary' })
    --- stylua: ignore end
  end,
}
