--- @type snacks.layout.Box
local picker_layout = {
  fullscreen = true,
  row = -1,
  box = 'vertical',
  backdrop = false,
  {
    win = 'preview',
    height = 0.69,
    enabled = false,
    border = 'none',
    wo = { number = false },
  },
  {
    height = 0.30,
    box = 'vertical',
    { win = 'input', height = 1 },
    { win = 'list' },
  },
}

local default_layout = {
  layout = {
    layout = {
      box = 'horizontal',
      width = 0.8,
      min_width = 120,
      height = 0.8,
      {
        box = 'vertical',
        border = true,
        title = '{title} {live} {flags}',
        { win = 'input', height = 1, border = 'top_bottom' },
        { win = 'list', border = 'none' },
      },
      { win = 'preview', title = '{preview}', border = true, width = 0.5 },
    },
  },
}

local shared_keys = {
  ['<c-e>'] = { 'toggle_preview', mode = { 'i', 'n' } },
  ['<c-u>'] = { 'preview_scroll_up', mode = { 'i', 'n' } },
  ['<c-d>'] = { 'preview_scroll_down', mode = { 'i', 'n' } },
}

local general_picker_config = {
  --- @type snacks.picker.layout.Config
  layout = {
    layout = picker_layout,
  },
  win = {
    input = {
      keys = shared_keys,
    },
  },
}

--- @type snacks.picker.Config
local file_picker_config = {
  layout = {
    hidden = { 'preview' },
    layout = picker_layout,
  },
  win = {
    input = {
      keys = shared_keys,
    },
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
     {'<leader>f', function() Snacks.picker.files (file_picker_config) end, desc = '[Snacks] Find files',},
    {'<leader>sh', function() Snacks.picker.highlights (default_layout) end, desc = '[Snacks] Find highlights',},
    { "<leader>sR", function() Snacks.picker.resume() end, desc = "Resume" },

    {'<leader>:',  function() Snacks.picker.command_history() end, desc = '[Snacks] Command History',},
    {'<leader>gg', function() Snacks.picker.grep(general_picker_config) end, desc = '[Snacks] Grep',},
    -- {'<leader>sp', function() Snacks.picker.projects { dev = { '~/Documents/repos/' } } end, desc = '[Snacks] Projects',},
    {'<leader>sb', function() Snacks.picker.buffers(general_picker_config) end, desc = '[Snacks] Buffers',},
    {'<leader>sw', function() Snacks.picker.grep_word(general_picker_config) end, desc = '[Snacks] Visual selection or word', mode = { 'n', 'x' },},
    {'<leader>h',  function() Snacks.picker.help(general_picker_config) end, desc = '[Snacks] Help Pages',},
    {'<leader>sp', function() Snacks.picker.files({  cwd = "~/.local/share/nvim/lazy/" }) end, desc = '[Snacks] Search for Plugin Spec',},
    {'<leader>sc', function() Snacks.picker.commands(general_picker_config) end, desc = '[Snacks] Commands',},
    -- {'<leader>hd', function() Snacks.notifier.hide() end, desc = '[Snacks] Hide notifications',},
    -- { "<leader>e", function() Snacks.explorer() end, desc = "[Snacks] Explorer Snacks", },

    -- git
    {'<leader>gl', function() Snacks.picker.git_log(general_picker_config) end, desc = '[Snacks] Git Log',},
    { "<leader>gL", function() Snacks.picker.git_log_line(
      vim.tbl_extend('keep', general_picker_config, {})
    ) end, desc = "Git Log Line" },

    -- lsp
    {'<leader>ws', function() Snacks.picker.lsp_workspace_symbols(general_picker_config) end, desc = '[Snacks] Search for LSP Workspace Symbols',},
    {'gr',         function() Snacks.picker.lsp_references(general_picker_config) end, desc = '[Snacks] References', nowait = true,},
    {'gi',         function() Snacks.picker.lsp_implementations(general_picker_config) end, desc = '[Snacks] Implementations', nowait = true,},
    {'gd',         function() Snacks.picker.lsp_definitions(general_picker_config) end, desc = '[Snacks] Goto Definition',},
  },
  -- stylua: ignore end
  ---@type snacks.Config
  opts = {
    bigfile = { enabled = true },
    dashboard = {
      enabled = false,
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
          { icon = ' ', key = 'r', desc = 'Restore Session', action = ':AutoSession restore' },
          { icon = ' ', key = 's', desc = 'Recent Files', action = ':lua Snacks.dashboard.pick(\'oldfiles\')' },
          { icon = '󰒲 ', key = 'L', desc = 'Lazy', action = ':Lazy', enabled = package.loaded.lazy ~= nil },
          { icon = ' ', key = 'q', desc = 'Quit', action = ':qa' },
        },
      },
      sections = {
        { section = 'header' },
        { section = 'keys', gap = 1, padding = 1, height = 100 },
        { section = 'startup' },
      },
    },
    indent = {
      enabled = true,
      animate = { enabled = false },
    },
    explorer = {
      enabled = false,
      replace_netrw = false, -- Replace netrw with the snacks explorer
    },
    win = {
      input = {
        keys = { ['<Esc>'] = { 'close', mode = { 'n', 'i' } } },
      },
    },
    notifier = {
      enabled = false,
      -- level = vim.log.levels.WARN
    },
    dim = {
      enabled = false,
    },
    picker = {
      previewers = {
        diff = {
          style = 'terminal',
          cmd = 'diff-so-fancy',
        },
      },
      enabled = true,
      win = {
        input = {
          keys = { ['<Esc>'] = { 'close', mode = { 'n', 'i' } } },
        },
      },
    },
    quickfile = { enabled = false }, -- couldn't note the difference using this
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
