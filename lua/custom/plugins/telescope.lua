local ivy_options = {
  previewer = false,
  prompt_title = false,
  results_title = false,

  -- borderchars = {
  --   prompt = { ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ' },
  --   results = { ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ' },
  --   preview = { ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ' },
  -- },

  layout_config = {
    -- width = 0.5,
    height = 0.3,
  },
}

return {
  'nvim-telescope/telescope.nvim',
  -- tag = '0.1.6',
  cmd = 'Telescope',
  keys = {
    {
      '<leader>fg',
      function()
        require('telescope.builtin').find_files(require('telescope.themes').get_ivy(ivy_options))
      end,
      desc = 'Find [all] files',
    },
    {
      '<leader>ff',
      function()
        require('telescope.builtin').git_files(require('telescope.themes').get_ivy(ivy_options))
      end,
      desc = 'Git files',
    },

    {
      '<leader><space>',
      function()
        require('telescope.builtin').buffers {
          ignore_current_buffer = true,
          -- sorting_strategy = 'ascending',
          sort_lastused = true,
          -- prompt_title = false,
          results_title = false,
          layout_config = {
            width = 0.5,
            height = 0.5,
            prompt_position = 'bottom',
          },
        }
      end,
      {},
    },

    {
      '<leader>g',
      function()
        require('telescope.builtin').live_grep()
      end,
      desc = '  Grep Files',
    },

    {
      '<leader>h',
      function()
        require('telescope.builtin').help_tags()
      end,
      desc = 'Help Tags',
    },

    {
      '<leader>sw',
      function()
        require('telescope.builtin').grep_string()
      end,
      desc = 'Search Word',
    },

    {
      '<leader>/',
      function()
        require('telescope.builtin').current_buffer_fuzzy_find(
          require('telescope.themes').get_dropdown {
            winblend = 0,
            previewer = false,
          }
        )
      end,
      { desc = 'Fuzzy in file' },
    },
  },

  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope-ui-select.nvim',
    'BurntSushi/ripgrep',
    'ThePrimeagen/git-worktree.nvim',
  },

  config = function()
    local telescope = require 'telescope'
    local actions = require 'telescope.actions'

    local previewers = require 'telescope.previewers'
    local Job = require 'plenary.job'

    -- `new_maker` avoid binary files preview
    local new_maker = function(filepath, bufnr, opts)
      filepath = vim.fn.expand(filepath)
      Job:new({
        command = 'file',
        args = { '--mime-type', '-b', filepath },
        on_exit = function(j)
          local mime_type = vim.split(j:result()[1], '/')[1]
          if mime_type == 'text' then
            previewers.buffer_previewer_maker(filepath, bufnr, opts)
          else
            -- maybe we want to write something to the buffer here
            vim.schedule(function()
              vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, { 'BINARY' })
            end)
          end
        end,
      }):sync()
    end

    telescope.setup {
      defaults = {
        borderchars = Borders.borderchars,
        mappings = {
          i = {
            ['<Esc>'] = actions.close,
          },
        },
        buffer_previewer_maker = new_maker,
        prompt_prefix = Symbols.telescope.prompt_prefix.icon,
        selection_caret = Symbols.telescope.selection_caret.icon,
      },
      pickers = {
        colorscheme = {
          enable_preview = true,
        },
        buffers = {
          -- theme = "dropdown",
          previewer = false,
          show_all_buffers = true,
          mappings = {
            i = {
              ['<c-d>'] = actions.delete_buffer,
              ['<C-j>'] = actions.move_selection_next,
              ['<C-k>'] = actions.move_selection_previous,
              ['<Esc>'] = actions.close,
              ['<leader>e'] = actions.close,
            },
          },
          -- ignore_current_buffer = true,
        },
      },
      extensions = {
        ['ui-select'] = {
          require('telescope.themes').get_dropdown {},
        },
      },
    }

    vim.api.nvim_set_hl(0, 'TelescopeSelection', {})

    require('telescope').load_extension 'ui-select'
    require('telescope').load_extension 'git_worktree'
    local ext = require('telescope').extensions
    -- vim.keymap.set('n', '<leader>w', ext.git_worktree.git_worktrees, {})
    vim.keymap.set('n', '<leader>,', ext.git_worktree.create_git_worktree, {})
  end,
}
