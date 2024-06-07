return {
  'luukvbaal/statuscol.nvim',
  event = 'VimEnter',
  init = function() end,
  config = function()
    local builtin = require 'statuscol.builtin'
    require('statuscol').setup {
      relculright = true,
      segments = {

        {
          sign = {
            namespace = { 'diagnostic' },
            maxwidth = 1,
            colwidth = 1,
            auto = false,
          },
          click = 'v:lua.ScSa',
        },

        {
          text = { builtin.lnumfunc, ' ' },
          click = 'v:lua.ScLa',
        },

        {
          sign = {
            namespace = { 'gitsigns' },
            name = { '.*' },
            maxwidth = 1,
            colwidth = 2,
            auto = false,
          },
          click = 'v:lua.ScSa',
        },
      },
    }
  end,
}
