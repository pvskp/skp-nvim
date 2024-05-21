local M = {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.6',
  -- cmd = 'Telescope',
  lazy = false,
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope-ui-select.nvim',
    'BurntSushi/ripgrep',
    'ThePrimeagen/git-worktree.nvim',
  },
}

function M.config()
  local telescope = require 'telescope'
  local actions = require 'telescope.actions'
  local themes = require 'telescope.themes'
  local builtin = require 'telescope.builtin'

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
      prompt_prefix = Symbols.telescope.prompt_prefix,
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

  vim.api.nvim_set_hl(0, 'TelescopeSelectionCaret', { fg = Symbols.telescope.selection_caret.color })
  vim.api.nvim_set_hl(0, 'TelescopeSelection', {})

  -- local ivy_opts = {
  --   layout_config = {
  --     height = 0.5,
  --     prompt_position = 'top',
  --   },
  --   previewer = false,
  -- }

  local git_files = function()
    builtin.git_files {
      borderchars = Borders.borderchars,
      previewer = false,
      -- sorting_strategy = 'ascending', -- this is buggy for some reason
      -- prompt_title = false,
      results_title = false,
      layout_config = {
        width = 0.5,
        height = 0.5,
        prompt_position = 'bottom',
      },
    }
  end

  local fuzzy_in_file = function()
    builtin.current_buffer_fuzzy_find(themes.get_dropdown {
      winblend = 0,
      previewer = false,
    })
  end

  local search_buffers = function()
    builtin.buffers {
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
  end

  vim.keymap.set('n', '<leader>f', git_files, { desc = 'Find [F]iles' })
  vim.keymap.set('n', '<leader><space>', search_buffers, {})
  vim.keymap.set('n', '<leader>g', builtin.live_grep, { desc = '[G]rep Files' })
  vim.keymap.set('n', '<leader>h', builtin.help_tags, { desc = '[H]elp Tags' })
  vim.keymap.set({ 'n', 'v' }, '<leader>sw', builtin.grep_string, { desc = '[S]earch [W]ord' })
  vim.keymap.set('n', '<leader>/', fuzzy_in_file, { desc = 'Fuzzy in file' })

  require('telescope').load_extension 'ui-select'
  require('telescope').load_extension 'git_worktree'
  local ext = require('telescope').extensions
  vim.keymap.set('n', '<leader>w', ext.git_worktree.git_worktrees, {})
  vim.keymap.set('n', '<leader>,', ext.git_worktree.create_git_worktree, {})
end

return M
