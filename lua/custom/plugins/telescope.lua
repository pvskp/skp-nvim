Telescope_ivy_options = {}

---@param preview_title boolean
---@return table theme
local function ivy_theme(preview_title)
  return require('telescope.themes').get_ivy({
    previewer = preview_title,
    preview_title = false,
    prompt_title = false,
    results_title = false,

    borderchars = {
      prompt = { ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ' },
      results = { ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ' },
      -- preview = { ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ' },
      preview = Borders.borderchars,
    },

    layout_config = {
      -- width = 0.5,
      height = 0.5,
    },
  })
end

-- Telescope_ivy_options =

---@param preview_title boolean
---@return table theme
local function theme(preview_title)
  -- return require('telescope.themes').get_ivy(Telescope_ivy_options)
  return {
    sorting_strategy = 'ascending',
    previewer = preview_title,

    -- prompt_title = false,
    results_title = false,
    preview_title = false,
    layout_strategy = "vertical",
    layout_config = {
      height = vim.o.lines,  -- maximally available lines
      width = vim.o.columns, -- maximally available columns
      prompt_position = "top",
      preview_height = 0.6,  -- 60% of available lines
    },
  }
end

function Telescope_find_files()
  require('telescope.builtin').find_files(ivy_theme(false))
end

function Telescope_git_files()
  require('telescope.builtin').git_files(ivy_theme(false))
end

function Telescope_live_grep()
  require('telescope.builtin').live_grep(ivy_theme(true))
end

function Telescope_projects()
  require('telescope').load_extension 'projects'

  require('telescope').extensions.projects.projects(theme(false))
end

return {
  'nvim-telescope/telescope.nvim',
  cmd = 'Telescope',
  keys = {
    {
      '<leader>fg',
      Telescope_find_files,
      desc = 'Find [all] files',
    },
    {
      '<leader>ff',
      Telescope_git_files,
      desc = 'Git files',
    },
    {
      '<leader>p',
      Telescope_projects,
      desc = 'Go to project',
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
      Telescope_live_grep,
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
    'pvskp/telescope-projects',
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
        -- borderchars = Borders.borderchars,
        mappings = {
          i = {
            ['<Esc>'] = actions.close,
            ['<C-s>'] = actions.select_horizontal,
            ['<C-v>'] = actions.select_vertical,
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
        ['projects'] = { require('telescope.themes').get_ivy {} },
      },
    }

    require('telescope').load_extension 'ui-select'
    require('telescope').load_extension 'git_worktree'
    -- local ext = require('telescope').extensions
    -- vim.keymap.set('n', '<leader>w', ext.git_worktree.git_worktrees, {})
    -- vim.keymap.set('n', '<leader>,', ext.git_worktree.create_git_worktree, {})

    -- vim.api.nvim_set_hl(0, 'TelescopeNormal', { link = "NormalFloat" })
    -- vim.api.nvim_set_hl(0, 'TelescopeBorder', { link = "NormalFloat" })
    -- vim.api.nvim_set_hl(0, 'TelescopePromptBorder', { link = "NormalFloat" })
    -- vim.api.nvim_set_hl(0, 'TelescopePreviewBorder', { link = "NormalFloat" })
    -- vim.api.nvim_set_hl(0, 'TelescopeResultsBorder', { link = "NormalFloat" })

    -- vim.api.nvim_set_hl(0, 'TelescopeSelection', {})
    vim.api.nvim_set_hl(0, 'TelescopeSelectionCaret', { fg = Symbols.telescope.selection_caret.color })
  end,
}
