return {
  'windwp/nvim-autopairs',
  lazy = false,
  -- event = "InsertEnter",
  opts = {}, -- this is equalent to setup({}) function
  init = function()
    local autopairs = require 'nvim-autopairs'
    local Rule = require 'nvim-autopairs.rule'
    local cond = require 'nvim-autopairs.conds'

    autopairs.add_rules {
      Rule('$', '$', 'markdown'):with_move(cond.after_text '$' and cond.not_before_char '$'),
    }
  end,
}
