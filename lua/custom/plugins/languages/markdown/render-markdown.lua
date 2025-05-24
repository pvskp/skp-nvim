return {
  'MeanderingProgrammer/render-markdown.nvim',
  -- version = '*',
  enabled = false,
  name = 'render-markdown', -- Only needed if you have another plugin named markdown.nvim
  ft = {
    'markdown',
    'Avante',
    'codecompanion',
    'help',
  },
  dependencies = {
    'nvim-treesitter/nvim-treesitter', -- Mandatory
    'nvim-tree/nvim-web-devicons',
  },
  keys = {
    {
      '<leader>v',
      function()
        if vim.opt.concealcursor ~= '' or vim.opt.conceallevel ~= 0 then
          vim.opt.concealcursor = ''
          vim.opt.conceallevel = 0
        else
          vim.opt.concealcursor = 'nvc'
          vim.opt.conceallevel = 3
        end

        vim.cmd('RenderMarkdown toggle')
      end,
      desc = '[markdown] Toggle conceal',
    },
  },
  ---@module 'render-markdown'
  ---@type render.md.UserConfig
  opts = {
    file_types = { 'markdown', 'Avante', 'help', 'codecompanion' },
    sign = {
      enabled = false,
    },
    heading = {
      icons = { '󰲡 ', '󰲣 ', '󰲧 ', '󰲥 ', '󰲩 ', '󰲫 ' },
      position = 'inline',
    },
    anti_conceal = {
      -- This enables hiding any added text on the line the cursor is on.
      enabled = false,
      -- Which elements to always show, ignoring anti conceal behavior. Values can either be
      -- booleans to fix the behavior or string lists representing modes where anti conceal
      -- behavior will be ignored. Valid values are:
      --   head_icon, head_background, head_border, code_language, code_background, code_border,
      --   dash, bullet, check_icon, check_scope, quote, table_border, callout, link, sign
      ignore = {
        code_background = false,
        sign = true,
      },
      -- Number of lines above cursor to show.
      above = 0,
      -- Number of lines below cursor to show.
      below = 0,
    },
  },
}
