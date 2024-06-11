return {
  'lewis6991/gitsigns.nvim',
  event = 'VeryLazy',
  keys = {
    { '-', '<cmd>Gitsigns preview_hunk<CR>', desc = 'Preview hunk' },
  },
  opts = {
    signs = {
      add = { text = '▌' },
      change = { text = '▌' },
      delete = { text = '▬' },
      topdelete = { text = '▬' },
      changedelete = { text = '~' },
      untracked = { text = '▌' },
    },

    signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
    numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
    linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
    word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`

    watch_gitdir = {
      follow_files = true,
    },

    auto_attach = true,
    attach_to_untracked = true,

    current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
    current_line_blame_opts = {
      virt_text = true,
      virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
      delay = 250,
      ignore_whitespace = false,
      virt_text_priority = 100,
    },

    current_line_blame_formatter = '  <author>, <author_time:%Y-%m-%d> - <summary>',
    sign_priority = 6,
    update_debounce = 100,
    status_formatter = nil, -- Use default
    max_file_length = 40000, -- Disable if file is longer than this (in lines)

    preview_config = {
      -- Options passed to nvim_open_win
      border = Borders.simple,
      style = 'minimal',
      relative = 'cursor',
      row = 0,
      col = 1,
    },

    yadm = {
      enable = false,
    },
  },

  config = function(_, opts)
    require('gitsigns').setup(opts)

    -- vim.api.nvim_set_hl(0, 'GitSignsCurrentLineBlame', {
    --   fg = '#4d4d4c',
    --   bg = 'NONE',
    -- })

    -- local M = {}
    -- _G.Status = M
    --
    -- ---@return {name:string, text:string, texthl:string}[]
    -- function M.get_signs()
    --   local buf = vim.api.nvim_win_get_buf(vim.g.statusline_winid)
    --   -- vim.notify('Buffer: ' .. buf .. ', Line: ' .. vim.v.lnum) -- Debug print
    --   local signs = vim.fn.sign_getplaced(buf, { group = '*', lnum = vim.v.lnum })[1].signs
    --   -- vim.notify('Signs: ' .. vim.inspect(signs)) -- Debug print
    --   return vim.tbl_map(function(sign)
    --     return vim.fn.sign_getdefined(sign.name)[1]
    --   end, signs)
    -- end
    --
    -- function M.column()
    --   local sign, git_sign
    --   -- vim.notify 'Column function called' -- Debug print
    --   local all_signs = M.get_signs()
    --   -- vim.notify('All signs: ' .. vim.inspect(all_signs)) -- Debug print
    --   for _, s in ipairs(all_signs) do
    --     if s.name:find 'GitSign' then
    --       git_sign = s
    --     else
    --       sign = s
    --     end
    --   end
    --   local components = {
    --     sign and ('%#' .. sign.texthl .. '#' .. sign.text .. '%*') or ' ',
    --     [[%=]],
    --     [[%{&nu?(&rnu&&v:relnum?v:relnum:v:lnum):''} ]],
    --     git_sign and ('%#' .. git_sign.texthl .. '#' .. git_sign.text .. '%*') or '  ',
    --   }
    --   return table.concat(components, '')
    -- end

    -- vim.opt.statuscolumn = [[%!v:lua.Status.column()]]
  end,
}
