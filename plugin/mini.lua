vim.pack.add({ Gh('nvim-mini/mini.nvim') })

require("mini.ai").setup()
require("mini.icons").setup()
require("mini.statusline").setup()
require("mini.git").setup()
require("mini.diff").setup()
require("mini.surround").setup()
require("mini.misc").setup()
require("mini.tabline").setup()
require("mini.trailspace").setup()
require("mini.bracketed").setup()
require("mini.pairs").setup()

local miniclue = require('mini.clue')

miniclue.setup({
  window = {
    delay = 0,
    -- scroll_down = '',
    -- scroll_up = '',
    config = {
      relative = 'cursor',
      width = 'auto',
      height = 10,
      row = 1,
      col = 1,
      anchor = 'NW',
    }
  },
  triggers = {
    { mode = 'n', keys = '<C-w>' },
    { mode = 'n', keys = '<leader>e' },
    { mode = 'n', keys = 'z' },

    { mode = 'n', keys = ']' },
    { mode = 'n', keys = '[' },
  },
  clues = {
    { mode = 'n', keys = '<leader>eh', postkeys = '<leader>e' },
    { mode = 'n', keys = '<leader>el', postkeys = '<leader>e' },
    { mode = 'n', keys = '<leader>eq', postkeys = '<leader>e' },

    { mode = 'n', keys = '<C-w>q',     postkeys = '<C-w>' },

    { mode = 'n', keys = ']b',         postkeys = ']' },
    { mode = 'n', keys = '[b',         postkeys = '[' },
    { mode = 'n', keys = '[w',         postkeys = '[' },
    { mode = 'n', keys = ']w',         postkeys = ']' },
    { mode = 'n', keys = '[d',         postkeys = '[' },
    { mode = 'n', keys = ']d',         postkeys = ']' },
    { mode = 'n', keys = '[D',         postkeys = '[' },
    { mode = 'n', keys = ']D',         postkeys = ']' },

    miniclue.gen_clues.z(),
    miniclue.gen_clues.windows({
      submode_move = true,
      submode_navigate = true,
      submode_resize = true,
    })
  },
})

vim.api.nvim_set_hl(0, 'MiniClueTitle', { link = 'MiniFilesTitle' })

require("mini.notify").setup({
  window = {
    winblend = 0,
    config = {
      border = 'solid'
    },
  }
})

vim.api.nvim_set_hl(0, 'MiniNotifyTitle', { link = 'MiniFilesTitle' })

-----------------
--- SplitJoin ---
-----------------

require("mini.splitjoin").setup({
  mappings = {
    toggle = 'gs'
  }
})

-----------------
--- MiniFiles ---
-----------------

require("mini.files").setup({
  windows = {
    preview = false,
    width_preview = 50,
  },
  options = {
    permanent_delete = true,
    use_as_default_explorer = true,
  },
  mappings = {
    go_in       = '',
    synchronize = '<CR>',
    go_out      = '',
    go_in_plus  = 'l',
    go_out_plus = 'h',
  },
})

------------------
--- HiPatterns ---
------------------
local hipatterns = require('mini.hipatterns')
hipatterns.setup({
  highlighters = {
    -- Highlight standalone 'FIXME', 'HACK', 'TODO', 'NOTE'
    fixme     = { pattern = '%f[%w]()FIXME()%f[%W]', group = 'MiniHipatternsFixme' },
    hack      = { pattern = '%f[%w]()HACK()%f[%W]', group = 'MiniHipatternsHack' },
    todo      = { pattern = '%f[%w]()TODO()%f[%W]', group = 'MiniHipatternsTodo' },
    note      = { pattern = '%f[%w]()NOTE()%f[%W]', group = 'MiniHipatternsNote' },

    ['false'] = { pattern = '%f[%w]()false()%f[%W]', group = 'diffRemoved' },
    ['true']  = { pattern = '%f[%w]()true()%f[%W]', group = 'diffAdded' },

    ['False'] = { pattern = '%f[%w]()False()%f[%W]', group = 'diffRemoved' },
    ['True']  = { pattern = '%f[%w]()True()%f[%W]', group = 'diffAdded' },

    -- Highlight hex color strings (`#rrggbb`) using that color
    hex_color = hipatterns.gen_highlighter.hex_color(),
  },
})

------------
--- Pick ---
------------

require("mini.extra").setup()

require("mini.pick").setup({
  mappings = {
    refine = '<C-g>',
    move_start = ''
  },
  window = {
    prompt_prefix = '󰩷 ',
    config = function()
      return {
        border = 'solid',
        width = vim.o.columns + 1,
        height = math.floor(0.2 * vim.o.lines)
      }
    end
  }
})

------------------
--- Trailspace ---
------------------

vim.api.nvim_create_autocmd('BufWritePre', {
  callback = function()
    MiniTrailspace.trim()
    MiniTrailspace.trim_last_lines()
  end
})

------------------
--- Highlights ---
------------------

vim.api.nvim_set_hl(0, 'MiniPickPrompt', { bg = Bg('MiniPickNormal') })
vim.api.nvim_set_hl(0, 'MiniPickBorder', { bg = Bg('MiniPickNormal') })
vim.api.nvim_set_hl(0, 'MiniPickBorderText', { fg = Fg('Title'), bg = Bg('MiniPickNormal'), bold = true })
vim.api.nvim_set_hl(0, 'MiniPickHeader', { bg = 'white' })

-- announce that Mini was initiated
vim.api.nvim_exec_autocmds('User', {
  pattern = EventMiniLoaded
})
