local options = {
  --< Search >--
  hlsearch = false, -- highlight all matches on previous search pattern
  smartcase = true,
  title = false,
  titlestring = "%<%F%=%l/%L - nvim",
  ignorecase = true, -- ignore case in search patterns
  number = true,     -- the number of spaces inserted for each indentation
  list = true,
  termguicolors = true,
  guifont = "FiraCode Nerd Font:h12",
  path = '.,,**',

  --< Tabulation >--
  expandtab = true, -- convert tabs to spaces
  tabstop = 2,
  shiftwidth = 2,   -- the number of spaces inserted for each indentation

  --< UI >--
  cursorcolumn = false,
  cursorline = true,        -- highlight the current line
  cursorlineopt = 'number', -- highlight the current line
  statuscolumn = [[%!v:lua.require'custom.statuscolumn'.statuscolumn()]],
  -- colorcolumn = '101',
  signcolumn = 'yes',
  numberwidth = 2,        -- set number column width {default 4}
  wrap = false,
  linebreak = true,       -- companion to wrap, don't split words
  relativenumber = false, -- set relative numbered lines
  showmode = true,
  scrolloff = 99999,
  pumblend = 0,

  --< Split >--
  splitbelow = true,
  splitright = true,

  --< Wildmenu >--
  wildmenu = true,
  wildignorecase = true,
  wildoptions = 'pum,tagfile',
  wildmode = 'full',
  -- wildmode = 'list:longest,full',

  fillchars = { vert = '│', eob = ' ' },

  --< Fold >--
  foldmethod = 'indent',
  foldlevel = 1,
  foldenable = false,

  --< Misc >--
  swapfile = false,
  timeoutlen = 300,
  undofile = true,
  updatetime = 250,
  virtualedit = 'all',
  clipboard = 'unnamedplus',
  smartindent = true, -- make indenting smarter again
  autochdir = false,
  background = 'dark',
  cmdheight = 1, -- space in the neovim command line for displaying messages
  compatible = false,
  equalalways = true,
  conceallevel = 3,
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

-- vim.cmd([[set listchars=tab:█\ ,trail:█]])
-- vim.cmd("set list")

vim.cmd [[set listchars=tab:▸\ ,eol:↲]]
vim.cmd [[set list]]

vim.g.netrw_banner = 0

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
  vim.keymap.set({ "n", "v" }, "<C-+>", ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + 0.1<CR>")
  vim.keymap.set({ "n", "v" }, "<C-->", ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor - 0.1<CR>")
  vim.keymap.set({ "n", "v" }, "<C-0>", ":lua vim.g.neovide_scale_factor = 1<CR>")
end

---@diagnostic disable-next-line: duplicate-set-field
vim.deprecate = function() end

-- vim.api.nvim_set_hl(0, 'ColorColumn', {
--   fg = 'None',
--   bg = 'NvimDarkGrey3',
-- })

vim.o.qftf = '{info -> v:lua._G.qftf(info)}'
