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
    layout_strategy = 'vertical',

    layout_config = {
      height = vim.o.lines,  -- maximally available lines
      width = vim.o.columns, -- maximally available columns
      prompt_position = 'top',
      preview_height = 0.6,  -- 60% of available lines
    },
  }
end

function Telescope_find_files()
  require('telescope.builtin').find_files(require('telescope.themes').get_ivy {
    results_title = false,
    prompt_prefix = 'find files> ',
  })
end

function Telescope_find_git_files()
  require('telescope.builtin').git_files(require('telescope.themes').get_ivy {
    results_title = false,
    preview_title = false,
    prompt_title = false,
    prompt_prefix = 'git files> ',
  })
end

function Telescope_find_highlights()
  require('telescope.builtin').highlights(require('telescope.themes').get_ivy {
    results_title = false,
    prompt_prefix = 'hl> ',
  })
end

function Telescope_live_grep()
  require('telescope.builtin').live_grep(require('telescope.themes').get_ivy {
    results_title = false,
    prompt_prefix = 'live grep> ',
  })
end

function Telescope_help_files()
  require('telescope.builtin').help_tags {
    prompt_prefix = "help tags> "
  }
end

function Telescope_grep_string()
  require('telescope.builtin').grep_string {
    results_title = false,
    prompt_prefix = 'grep string> ',
  }
end

function Telescope_find_projects()
  require('telescope').load_extension 'projects'
  require('telescope').extensions.projects.projects(theme(false))
end

return {
  'nvim-telescope/telescope.nvim',
  version = '0.1.8',
  cmd = 'Telescope',
  keys = {
    {
      '<leader>fe',
      Telescope_find_files,
      desc = 'Find [all] files',
    },
    {
      '<leader>fh',
      Telescope_find_highlights,
      desc = 'Find [all] files',
    },
    {
      '<leader>ff',
      Telescope_find_git_files,
      desc = 'Git files',
    },
    {
      '<leader>p',
      Telescope_find_projects,
      desc = 'Go to project',
    },
    {
      '<leader>fc',
      function()
        require('telescope.builtin').colorscheme()
      end,
      desc = 'List colorschemes',
    },

    {
      '<leader><space>',
      function()
        require('telescope.builtin').buffers {
          ignore_current_buffer = false,
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
      '<leader>gg',
      desc = '  Grep Files',
      Telescope_live_grep
    },

    {
      '<leader>h',
      desc = 'Help Tags',
      Telescope_help_files
    },

    {
      '<leader>sw',
      Telescope_grep_string,
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
    {
      'nvim-lua/plenary.nvim',
      commit = "ec289423a1693aeae6cd0d503bac2856af74edaa",
    },
    {
      'nvim-telescope/telescope-ui-select.nvim',
      -- version = '*',
      commit = "6e51d7da30bd139a6950adf2a47fda6df9fa06d2",
    },
    'BurntSushi/ripgrep',
    'ThePrimeagen/git-worktree.nvim',
    'pvskp/telescope-projects',
  },

  config = function()
    local telescope = require 'telescope'
    local actions = require 'telescope.actions'

    local previewers = require 'telescope.previewers'
    local Job = require 'plenary.job'

    telescope.setup {
      defaults = {
        borderchars = Borders.borderchars,
        mappings = {
          i = {
            ['<Esc>'] = actions.close,
            ['<C-s>'] = actions.select_horizontal,
            ['<C-v>'] = actions.select_vertical,
          },
        },
        prompt_prefix = Symbols.telescope.prompt_prefix.icon,
        selection_caret = Symbols.telescope.selection_caret.icon,
        preview = {
          mime_hook = function(filepath, bufnr, opts)
            local get_ext = function(filepath)
              local split_path = vim.split(filepath:lower(), ".", { plain = true })
              return split_path[#split_path]
            end
            local is_image = function(filepath)
              local image_extensions = { "png", "jpg" } -- Supported image formats
              return vim.tbl_contains(image_extensions, get_ext(filepath))
            end
            if is_image(filepath) then
              local term = vim.api.nvim_open_term(bufnr, {})
              local function send_output(a, data, c)
                for _, d in ipairs(data) do
                  vim.api.nvim_chan_send(term, d .. "\r\n")
                end
              end
              vim.fn.jobstart({
                "catimg",
                -- "chafa,"
                filepath, -- Terminal image viewer command
              }, { on_stdout = send_output, stdout_buffered = true, pty = true })
            else
              require("telescope.previewers.utils").set_preview_message(
                bufnr,
                opts.winid,
                "Binary cannot be previewed (" .. get_ext(filepath) .. ")"
              )
            end
          end,
        },
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
  end,
}
