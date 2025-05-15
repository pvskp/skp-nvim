local custom_layout = {
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
}

return {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,
  dependencies = {
    'rmagatti/auto-session',
  },
  -- stylua: ignore start
  keys = {
    {',st',        function() require('snacks').terminal.toggle() end, desc = '[Snacks] Open terminal',},
    {'<leader>f', function() Snacks.picker.files ({
      layout = custom_layout,
      hidden = true
    }) end, desc = '[Snacks] Find files',},
    {'<leader>sh', function() Snacks.picker.highlights ({
      layout = custom_layout,
      hidden = true
    }) end, desc = '[Snacks] Find highlights',},
    {'<leader>:',  function() Snacks.picker.command_history() end, desc = '[Snacks] Command History',},
    {'<leader>gg', function() Snacks.picker.grep({ layout = custom_layout, }) end, desc = '[Snacks] Grep',},
    {'<leader>sp', function() Snacks.picker.projects { dev = { '~/Documents/repos/' } } end, desc = '[Snacks] Projects',},
    {'<leader>sb', function() Snacks.picker.buffers({ layout = custom_layout, }) end, desc = '[Snacks] Buffers',},
    {'<leader>sw', function() Snacks.picker.grep_word({ layout = custom_layout, }) end, desc = '[Snacks] Visual selection or word', mode = { 'n', 'x' },},
    {'<leader>h',  function() Snacks.picker.help({ layout = custom_layout, }) end, desc = '[Snacks] Help Pages',},
    {'<leader>sp', function() Snacks.picker.explorer({  cwd = "~/.local/share/nvim/lazy/" }) end, desc = '[Snacks] Search for Plugin Spec',},
    {'<leader>sc', function() Snacks.picker.commands({ layout = custom_layout, }) end, desc = '[Snacks] Commands',},
    -- {'<leader>hd', function() Snacks.notifier.hide() end, desc = '[Snacks] Hide notifications',},
    { "<leader>e", function() Snacks.explorer() end, desc = "[Snacks] Explorer Snacks", },

    -- git
    {'<leader>gl', function() Snacks.picker.git_log({ layout = custom_layout, }) end, desc = '[Snacks] Git Log',},

    -- lsp
    {'<leader>ws', function() Snacks.picker.lsp_workspace_symbols({ layout = custom_layout, }) end, desc = '[Snacks] Search for LSP Workspace Symbols',},
    {'gr',         function() Snacks.picker.lsp_references({ layout = custom_layout, }) end, desc = '[Snacks] References', nowait = true,},
    {'gd',         function() Snacks.picker.lsp_definitions({ layout = custom_layout, }) end, desc = '[Snacks] Goto Definition',},
  },
  -- stylua: ignore end
  ---@type snacks.Config
  opts = {
    bigfile = { enabled = true },
    dashboard = {
      enabled = true,
      preset = {
        pick = 'telescope.nvim',
        keys = {
          { icon = ' ', key = 'f', desc = 'Find File', action = ':lua Snacks.dashboard.pick(\'files\')' },
          { icon = ' ', key = 'n', desc = 'New File', action = ':ene | startinsert' },
          { icon = ' ', key = 'g', desc = 'Find Text', action = ':lua Snacks.dashboard.pick(\'live_grep\')' },
          {
            icon = ' ',
            key = 'c',
            desc = 'Config',
            action = ':lua Snacks.dashboard.pick(\'files\', {cwd = vim.fn.stdpath(\'config\')})',
          },
          { icon = ' ', key = 'r', desc = 'Restore Session', action = ':SessionRestore' },
          { icon = ' ', key = 's', desc = 'Recent Files', action = ':lua Snacks.dashboard.pick(\'oldfiles\')' },
          { icon = '󰒲 ', key = 'L', desc = 'Lazy', action = ':Lazy', enabled = package.loaded.lazy ~= nil },
          { icon = ' ', key = 'q', desc = 'Quit', action = ':qa' },
        },
      },
      sections = {
        { section = 'header' },
        { section = 'keys', gap = 1, padding = 1, height = 100 },
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
      enabled = false,
      animate = { enabled = false },
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
      win = {
        input = {
          keys = { ['<Esc>'] = { 'close', mode = { 'n', 'i' } } },
        },
      },
      sources = {
        explorer = {
          finder = 'explorer',
          sort = { fields = { 'sort' } },
          supports_live = true,
          tree = true,
          watch = true,
          diagnostics = true,
          diagnostics_open = false,
          git_status = true,
          git_status_open = false,
          git_untracked = true,
          follow_file = true,
          focus = 'list',
          auto_close = false,
          jump = { close = false },
          layout = { preset = 'sidebar', preview = false },
          -- to show the explorer to the right, add the below to
          -- your config under `opts.picker.sources.explorer`
          -- layout = { layout = { position = "right" } },
          formatters = {
            file = { filename_only = true },
            severity = { pos = 'right' },
          },
          matcher = { sort_empty = false, fuzzy = false },
          config = function(opts)
            return require('snacks.picker.source.explorer').setup(opts)
          end,
          win = {
            list = {
              keys = {
                ['<BS>'] = 'explorer_up',
                ['l'] = 'confirm',
                ['h'] = 'explorer_close', -- close directory
                ['a'] = 'explorer_add',
                ['d'] = 'explorer_del',
                ['r'] = 'explorer_rename',
                ['c'] = 'explorer_copy',
                ['m'] = 'explorer_move',
                ['o'] = 'explorer_open', -- open with system application
                ['P'] = 'toggle_preview',
                ['y'] = { 'explorer_yank', mode = { 'n', 'x' } },
                ['p'] = 'explorer_paste',
                ['u'] = 'explorer_update',
                ['<c-c>'] = 'tcd',
                ['<leader>/'] = 'picker_grep',
                ['<c-t>'] = 'terminal',
                ['.'] = 'explorer_focus',
                ['I'] = 'toggle_ignored',
                ['H'] = 'toggle_hidden',
                ['Z'] = 'explorer_close_all',
                [']g'] = 'explorer_git_next',
                ['[g'] = 'explorer_git_prev',
                [']d'] = 'explorer_diagnostic_next',
                ['[d'] = 'explorer_diagnostic_prev',
                [']w'] = 'explorer_warn_next',
                ['[w'] = 'explorer_warn_prev',
                [']e'] = 'explorer_error_next',
                ['[e'] = 'explorer_error_prev',
              },
            },
          },
        },
      },
    },
    quickfile = { enabled = true },
    scope = { enabled = false },
    scroll = { enabled = false },
    ---@class snacks.statuscolumn.Config
    statuscolumn = {
      enabled = true,
      left = { 'mark', 'sign' }, -- priority of signs on the left (high to low)
      right = { 'fold', 'git' }, -- priority of signs on the right (high to low)
      folds = { open = true, git_hl = true },
    },
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
