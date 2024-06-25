local options = {
  --< General Settings >
  compatible = false,  -- Disable Vi compatibility
  title = false,       -- Do not show the title of the window
  background = 'dark', -- Use a dark background
  cmdheight = 1,       -- Height of the command line

  --< Search >
  ignorecase = true,    -- Ignore case in search patterns
  smartcase = true,     -- Use smart case for search patterns
  hlsearch = false,     -- Do not highlight all matches on previous search pattern
  inccommand = 'split', -- Show incremental command results in a split window

  --< Display >
  number = true, -- Show line numbers
  relativenumber = true, -- Show relative line numbers
  numberwidth = 2, -- Set the width of the number column to 2
  cursorline = true, -- Highlight the current line
  cursorlineopt = 'number', -- Highlight the current line number
  cursorcolumn = false, -- Do not highlight the column of the cursor
  signcolumn = 'yes', -- Always show the sign column
  wrap = false, -- Do not wrap lines
  linebreak = true, -- Wrap lines at convenient points
  showbreak = '-', -- String to show at the beginning of wrapped lines
  scrolloff = 99999, -- Keep the cursor vertically centered
  pumblend = 0, -- Do not blend the popup menu
  fillchars = { vert = '│', eob = ' ' }, -- Characters used to fill the window

  --< Tabulation and Indentation >
  expandtab = true,   -- Convert tabs to spaces
  tabstop = 2,        -- Number of spaces that a tab counts for
  shiftwidth = 2,     -- Number of spaces inserted for each indentation
  smartindent = true, -- Make indenting smarter again

  --< Splits >
  splitbelow = true,  -- Horizontal splits will be below
  splitright = true,  -- Vertical splits will be to the right
  equalalways = true, -- Equalize window sizes when adding/removing windows

  --< Wildmenu >
  wildmenu = true,             -- Enable command-line completion menu
  wildignorecase = true,       -- Ignore case in command-line completion
  wildoptions = 'pum,tagfile', -- Use popup menu for command-line completion
  wildmode = 'full',           -- Command-line completion mode

  --< Folds >
  foldmethod = 'indent', -- Fold based on indent levels
  foldlevelstart = 99,   -- Open all folds by default
  foldlevel = 0,
  foldenable = false,    -- Enable folding by default

  --< Files and Backups >
  swapfile = false, -- Do not use swapfile
  undofile = true,  -- Save undo history to an undo file

  --< Performance >
  timeoutlen = 300, -- Time to wait for a mapped sequence to complete (milliseconds)
  updatetime = 250, -- Faster completion (default is 4000ms)

  --< Miscellaneous >
  virtualedit = 'all',                                                    -- Allow cursor to move anywhere
  clipboard = 'unnamedplus',                                              -- Use the system clipboard
  autochdir = false,                                                      -- Do not change the current working directory automatically
  statuscolumn = [[%!v:lua.require'custom.statuscolumn'.statuscolumn()]], -- Custom status column
  showmode = true,                                                        -- Show the current mode in the command line
  conceallevel = 3,                                                       -- Hide concealed text unless it has a replacement character
}

local globals = {
  netrw_banner = 0,
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

for k, v in pairs(globals) do
  vim.g[k] = v
end

-- vim.cmd([[set listchars=tab:█\ ,trail:█]])
-- vim.cmd("set list")

vim.cmd [[set listchars=tab:▸\ ,eol:↲]]
vim.cmd [[set list]]

vim.filetype.add {
  extension = {
    tf = 'terraform',
  },
}

-- Sets quickfixtextfunc
local fn = vim.fn

function _G.qftf(info)
  local items
  local ret = {}
  -- The name of item in list is based on the directory of quickfix window.
  -- Change the directory for quickfix window make the name of item shorter.
  -- It's a good opportunity to change current directory in quickfixtextfunc :)
  --
  -- local alterBufnr = fn.bufname('#') -- alternative buffer is the buffer before enter qf window
  -- local root = getRootByAlterBufnr(alterBufnr)
  -- vim.cmd(('noa lcd %s'):format(fn.fnameescape(root)))
  --
  if info.quickfix == 1 then
    items = fn.getqflist({ id = info.id, items = 0 }).items
  else
    items = fn.getloclist(info.winid, { id = info.id, items = 0 }).items
  end
  local limit = 31
  local fnameFmt1, fnameFmt2 = '%-' .. limit .. 's', '…%.' .. (limit - 1) .. 's'
  local validFmt = '%s │%5d:%-3d│%s %s'
  for i = info.start_idx, info.end_idx do
    local e = items[i]
    local fname = ''
    local str
    if e.valid == 1 then
      if e.bufnr > 0 then
        fname = fn.bufname(e.bufnr)
        if fname == '' then
          fname = '[No Name]'
        else
          fname = fname:gsub('^' .. vim.env.HOME, '~')
        end
        -- char in fname may occur more than 1 width, ignore this issue in order to keep performance
        if #fname <= limit then
          fname = fnameFmt1:format(fname)
        else
          fname = fnameFmt2:format(fname:sub(1 - limit))
        end
      end
      local lnum = e.lnum > 99999 and -1 or e.lnum
      local col = e.col > 999 and -1 or e.col
      local qtype = e.type == '' and '' or ' ' .. e.type:sub(1, 1):upper()
      str = validFmt:format(fname, lnum, col, qtype, e.text)
    else
      str = e.text
    end
    table.insert(ret, str)
  end
  return ret
end

if vim.g.neovide then
  vim.keymap.set(
    { 'n', 'v' },
    '<C-+>',
    ':lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + 0.1<CR>'
  )
  vim.keymap.set(
    { 'n', 'v' },
    '<C-->',
    ':lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor - 0.1<CR>'
  )
  vim.keymap.set({ 'n', 'v' }, '<C-0>', ':lua vim.g.neovide_scale_factor = 1<CR>')
end

-- ---@diagnostic disable-next-line: duplicate-set-field
-- vim.deprecate = function() end

-- vim.api.nvim_set_hl(0, 'ColorColumn', {
--   fg = 'None',
--   bg = 'NvimDarkGrey3',
-- })

vim.o.qftf = '{info -> v:lua._G.qftf(info)}'
