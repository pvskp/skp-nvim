return {
  'echasnovski/mini.hipatterns',
  event = 'VeryLazy',
  -- lazy = false,
  version = false,
  config = function()
    local hipatterns = require 'mini.hipatterns'

    vim.api.nvim_set_hl(
      0,
      'TrueHighlighGroup',
      { fg = 'green', bg = 'None', bold = true, italic = false }
    )

    vim.api.nvim_set_hl(
      0,
      'FalseHighlighGroup',
      { fg = 'red', bg = 'None', bold = true, italic = false }
    )

    hipatterns.setup {
      highlighters = {
        -- Highlight standalone 'FIXME', 'HACK', 'TODO', 'NOTE'
        fixme = { pattern = '%f[%w]()FIXME()%f[%W]', group = 'MiniHipatternsFixme' },
        hack = { pattern = '%f[%w]()HACK()%f[%W]', group = 'MiniHipatternsHack' },
        todo = { pattern = '%f[%w]()TODO()%f[%W]', group = 'MiniHipatternsTodo' },
        note = { pattern = '%f[%w]()NOTE()%f[%W]', group = 'MiniHipatternsNote' },
        btrue = { pattern = '%f[%w]()true()%f[%W]', group = 'TrueHighlighGroup' },
        bfalse = { pattern = '%f[%w]()false()%f[%W]', group = 'FalseHighlighGroup' },
        -- Highlight hex color strings (`#rrggbb`) using that color
        hex_color = hipatterns.gen_highlighter.hex_color(),
      },
    }
  end,
}
