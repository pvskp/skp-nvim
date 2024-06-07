return {
  'windwp/nvim-autopairs',
  event = 'InsertEnter',
  config = function(_, opts)
    local autopairs = require 'nvim-autopairs'
    local Rule = require 'nvim-autopairs.rule'
    local cond = require 'nvim-autopairs.conds'
    autopairs.setup()
    autopairs.add_rules {
      Rule('$', '$', 'markdown'):with_move(cond.after_text '$' and cond.not_before_char '$'),
    }
  end,
}
