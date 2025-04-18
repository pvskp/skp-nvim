return {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,
  dependencies = {
    'rmagatti/auto-session',
  },
  keys = {
    {
      ',st',
      function()
        require('snacks').terminal.toggle()
      end,
      desc = 'Open terminal',
    },
    {
      '<leader>ff',
      function()
        Snacks.picker.files { hidden = true }
      end,
      desc = 'Find files',
    },
    {
      '<leader>:',
      function()
        Snacks.picker.command_history()
      end,
      desc = 'Command History',
    },
    {
      '<leader>gg',
      function()
        Snacks.picker.grep()
      end,
      desc = 'Grep',
    },
    -- {
    --   '<C-e>',
    --   function()
    --     Snacks.explorer()
    --   end,
    --   desc = 'File Explorer',
    -- },
    {
      '<leader>fp',
      function()
        Snacks.picker.projects { dev = { '~/Documents/repos/' } }
      end,
      desc = 'Projects',
    },
    {
      '<leader>fb',
      function()
        Snacks.picker.buffers()
      end,
      desc = 'Buffers',
    },
    {
      '<leader>sw',
      function()
        Snacks.picker.grep_word()
      end,
      desc = 'Visual selection or word',
      mode = { 'n', 'x' },
    },
    {
      '<leader>h',
      function()
        Snacks.picker.help()
      end,
      desc = 'Help Pages',
    },
    {
      '<leader>sp',
      function()
        Snacks.picker.lazy()
      end,
      desc = 'Search for Plugin Spec',
    },
    {
      '<leader>fc',
      function()
        Snacks.picker.commands()
      end,
      desc = 'Commands',
    },
    {
      '<leader>hd',
      function()
        Snacks.notifier.hide()
      end,
      desc = 'Hide notifications',
    },

    -- git
    {
      '<leader>gl',
      function()
        Snacks.picker.git_log()
      end,
      desc = 'Git Log',
    },

    -- lsp
    {
      '<leader>ws',
      function()
        Snacks.picker.lsp_workspace_symbols()
      end,
      desc = 'LSP Workspace Symbols',
    },
    {
      'gr',
      function()
        Snacks.picker.lsp_references()
      end,
      desc = 'References',
      nowait = true,
    },
    {
      'gd',
      function()
        Snacks.picker.lsp_definitions()
      end,
      desc = 'Goto Definition',
    },
  },
  ---@type snacks.Config
  opts = {
    bigfile = { enabled = true },
    dashboard = {
      enabled = true,
      preset = {
        pick = 'telescope.nvim',
        keys = {
          {
            icon = ' ',
            key = 'f',
            desc = 'Find File',
            action = ':lua Snacks.dashboard.pick(\'files\')',
          },
          { icon = ' ', key = 'n', desc = 'New File', action = ':ene | startinsert' },
          {
            icon = ' ',
            key = 'g',
            desc = 'Find Text',
            action = ':lua Snacks.dashboard.pick(\'live_grep\')',
          },
          {
            icon = ' ',
            key = 'c',
            desc = 'Config',
            action = ':lua Snacks.dashboard.pick(\'files\', {cwd = vim.fn.stdpath(\'config\')})',
          },
          { icon = ' ', key = 'r', desc = 'Restore Session', action = ':SessionRestore' },
          {
            icon = ' ',
            key = 's',
            desc = 'Recent Files',
            action = ':lua Snacks.dashboard.pick(\'oldfiles\')',
          },
          {
            icon = '󰒲 ',
            key = 'L',
            desc = 'Lazy',
            action = ':Lazy',
            enabled = package.loaded.lazy ~= nil,
          },
          { icon = ' ', key = 'q', desc = 'Quit', action = ':qa' },
        },
      },
      sections = {
        {
          section = 'header',
        },
        {
          section = 'keys',
          gap = 1,
          padding = 1,
          height = 100,
        },
        { section = 'startup' },
        -- {
        --   section = "terminal",
        --   cmd = "krabby name umbreon --no-title",
        --   -- random = 10,
        --   pane = 2,
        --   indent = 4,
        --   height = 30,
        -- },
      },
    },
    indent = {
      enabled = true,
      animate = {
        enabled = false,
      },
    },
    explorer = {
      replace_netrw = false, -- Replace netrw with the snacks explorer
    },
    input = {
      enabled = true,
      win = {
        style = {
          keys = {
            n_esc = { '<esc>', { 'cmp_close', 'cancel' }, mode = 'n', expr = true },
            i_esc = { '<esc>', { 'cmp_close', 'cancel' }, mode = 'i', expr = true },
            i_cr = { '<cr>', { 'cmp_accept', 'confirm' }, mode = 'i', expr = true },
            i_tab = { '<tab>', { 'cmp_select_next', 'cmp' }, mode = 'i', expr = true },
            i_ctrl_w = { '<c-w>', '<c-s-w>', mode = 'i', expr = true },
            i_up = { '<up>', { 'hist_up' }, mode = { 'i', 'n' } },
            i_down = { '<down>', { 'hist_down' }, mode = { 'i', 'n' } },
            q = 'cancel',
          },
        },
      },
    },
    notifier = {
      enabled = false,
      -- level = vim.log.levels.WARN
    },
    picker = {
      enabled = true,
      layout = {
        -- preset = "ivy",
        layout = {
          width = 0.999,
          height = 0.999,
          box = 'horizontal',
          {
            box = 'vertical',
            border = 'single',
            { win = 'input', height = 1, border = 'single' },
            { win = 'list', border = 'none' },
          },
          { win = 'preview', border = 'single', width = 0.5 },
        },
      },
      win = {
        input = {
          keys = {
            ['<Esc>'] = { 'close', mode = { 'n', 'i' } },
          },
        },
      },
    },
    quickfile = { enabled = true },
    scope = { enabled = false },
    scroll = { enabled = false },
    statuscolumn = { enabled = true },
    gitbrowse = { enabled = true },
    words = { enabled = true },
  },
  config = function(_, opts)
    Snacks.setup(opts)
    vim.api.nvim_create_user_command('NotificationHistory', Snacks.notifier.show_history, {})
    vim.api.nvim_create_user_command('GitBrowser', function()
      Snacks.gitbrowse()
    end, {})

    vim.api.nvim_create_user_command('GoToFile', function()
      Snacks.picker.files()
    end, {})
  end,
}
