return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.5',
  -- cmd = 'Telescope',
  lazy = false,
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope-ui-select.nvim',
  },
  config = function()
    local telescope = require 'telescope'
    local actions = require 'telescope.actions'
    local themes = require 'telescope.themes'
    local builtin = require 'telescope.builtin'

    telescope.setup {
      defaults = {
        borderchars = { '─', '│', '─', '│', '┌', '┐', '┘', '└' },
        mappings = {
          i = {
            ['<Esc>'] = actions.close,
          },
        },
        prompt_prefix = Symbols.telescope.prompt_prefix,
        selection_caret = Symbols.telescope.selection_caret,
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

    local dropdown_opts = {
      borderchars = {
        { '─', '│', '─', '│', '┌', '┐', '┘', '└' },
        prompt = { '─', '│', ' ', '│', '┌', '┐', '│', '│' },
        results = { '─', '│', '─', '│', '├', '┤', '┘', '└' },
        preview = { '─', '│', '─', '│', '┌', '┐', '┘', '└' },
      },
      width = 0.8,
      previewer = false,
      prompt_title = false,
    }

    local no_preview = function(prompt)
      if prompt ~= nil then
        dropdown_opts['prompt_title'] = prompt
      else
        dropdown_opts['prompt_title'] = false
      end

      return themes.get_dropdown(dropdown_opts)
    end

    vim.keymap.set('n', '<leader>f', function()
      builtin.find_files(no_preview 'Find Files')
    end, { desc = 'Find [F]iles' })

    vim.keymap.set('n', '<leader><space>', builtin.buffers, { desc = '[ ] Find existing buffers' })
    vim.keymap.set('n', '<leader>g', builtin.live_grep, { desc = '[G]rep Files' })
    vim.keymap.set('n', '<leader>h', builtin.help_tags, { desc = '[H]elp Tags' })
    -- vim.keymap.set('n', '<leader>mp', builtin.man_pages, { desc = '[M]an [P]ages' })
    vim.keymap.set(
      { 'n', 'v' },
      '<leader>sw',
      builtin.grep_string,
      { desc = '[S]earch current [W]ord' }
    )
    vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
    vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })

    vim.keymap.set('n', '<leader>/', function()
      -- You can pass additional configuration to Telescope to change the theme, layout, etc.
      builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
        winblend = 10,
        previewer = false,
      })
    end, { desc = '[/] Fuzzily search in current buffer' })
    require('telescope').load_extension 'ui-select'
  end,
}
