return {
  'nvim-treesitter/nvim-treesitter',
  pin = true,
  dependencies = {
    {
      'nvim-treesitter/nvim-treesitter-textobjects', -- <- this is amazing
    },
  },
  lazy = false,
  opts = {
    ensure_installed = { 'c', 'lua', 'vim', 'vimdoc', 'query', 'python', 'go' },
    sync_install = false,
    auto_install = true,
    ignore_install = {},

    highlight = {
      enable = true,
      disable = { 'markdown', 'vimdoc', 'help', 'helm', 'gitcommit' },
      additional_vim_regex_highlighting = false,
      indent = {
        enable = false,
        -- disable = {},
      },
    },
    textobjects = {
      select = {
        enable = true,
        lookahead = true,

        keymaps = {
          ['af'] = '@function.outer',
          ['if'] = '@function.inner',
          ['ac'] = '@class.outer',
          ['ic'] = { query = '@class.inner', desc = 'Select inner part of a class region' },
          ['as'] = { query = '@scope', query_group = 'locals', desc = 'Select language scope' },
        },
        selection_modes = {
          ['@parameter.outer'] = 'v', -- charwise
          ['@function.outer'] = 'V',  -- linewise
          ['@class.outer'] = 'V',     -- blockwise
        },
        include_surrounding_whitespace = true,
      },
      swap = {
        enable = true,
        swap_next = {
          ['<C-l>'] = '@parameter.inner',
        },
        swap_previous = {
          ['<C-h>'] = '@parameter.inner',
        },
      },
      move = {
        enable = true,
        set_jumps = true, -- whether to set jumps in the jumplist
        goto_next_start = {
          [']m'] = '@function.outer',
          [']]'] = { query = '@class.outer', desc = 'Next class start' },
          [']o'] = '@loop.*',
          [']s'] = { query = '@scope', query_group = 'locals', desc = 'Next scope' },
          [']z'] = { query = '@fold', query_group = 'folds', desc = 'Next fold' },
        },
        goto_next_end = {
          [']M'] = '@function.outer',
          [']['] = '@class.outer',
        },
        goto_previous_start = {
          ['[m'] = '@function.outer',
          ['[['] = '@class.outer',
        },
        goto_previous_end = {
          ['[M'] = '@function.outer',
          ['[]'] = '@class.outer',
        },
      },
    },
  },

  config = function(_, opts)
    require('nvim-treesitter.configs').setup(opts)
    vim.treesitter.language.register('yaml', 'ansible')
  end,
}
