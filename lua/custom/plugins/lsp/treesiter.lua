return {
  'nvim-treesitter/nvim-treesitter',
  tag = "v0.9.2",
  init = function()
    vim.opt.foldmethod = "expr"
    vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
  end,
  dependencies = {
    {
      { 'nvim-treesitter/nvim-treesitter-textobjects' },
      {
        'nvim-treesitter/nvim-treesitter-context',
        opts = {
          enable = true,            -- Enable this plugin (Can be enabled/disabled later via commands)
          max_lines = 0,            -- How many lines the window should span. Values <= 0 mean no limit.
          min_window_height = 0,    -- Minimum editor window height to enable context. Values <= 0 mean no limit.
          line_numbers = true,
          multiline_threshold = 20, -- Maximum number of lines to show for a single context
          trim_scope = 'outer',     -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
          mode = 'cursor',          -- Line used to calculate context. Choices: 'cursor', 'topline'
          -- Separator between context and content. Should be a single character string, like '-'.
          -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
          -- separator = '_',
          zindex = 20,     -- The Z-index of the context window
          on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
        },
        config = function(_, opts)
          require 'treesitter-context'.setup(opts)
          vim.api.nvim_create_autocmd('Filetype', {

            pattern = "markdown",
            command = "TSContextDisable",
          })
        end
      },
    },
  },
  event = { 'BufReadPost' },
  opts = {
    ensure_installed = {
      'lua',
      'vim',
      'vimdoc',
      'query',
      'markdown',
      'markdown_inline',
      'gitcommit',
      'diff',
    },
    sync_install = true,
    auto_install = true,
    ignore_install = {},

    highlight = {
      enable = true,
      -- disable = { 'markdown', 'vimdoc', 'help', 'gitcommit', 'diff' },
      additional_vim_regex_highlighting = false,
      indent = {
        enable = true,
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
          -- [']s'] = { query = '@scope', query_group = 'locals', desc = 'Next scope' },
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

    local parser_config = require('nvim-treesitter.parsers').get_parser_configs()
    parser_config.gotmpl = {
      install_info = {
        url = 'https://github.com/ngalaiko/tree-sitter-go-template',
        files = { 'src/parser.c' },
      },
      filetype = 'gotmpl',
      used_by = { 'gohtmltmpl', 'gotexttmpl', 'gotmpl', 'yaml' },
    }

    vim.treesitter.language.register('yaml', 'ansible')
  end,
}
