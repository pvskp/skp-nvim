-- Key mappings for general functionality
local opts = { silent = true, noremap = false }

-- Leader key settings
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- horizontal scroll
vim.keymap.set('n', '<Left>', 'z2h', { desc = 'Scroll left slightly' })
vim.keymap.set('n', '<Right>', 'z2l', { desc = 'Scroll right slightly' })

vim.keymap.set('n', '<S-ScrollWheelDown>', 'z3h', { desc = 'Scroll left with shift+wheel' })
vim.keymap.set('n', '<S-ScrollWheelUp>', 'z3l', { desc = 'Scroll right with shift+wheel' })

-- Disable space key
vim.keymap.set('n', '<Space>', '<Nop>', { silent = true, remap = false, desc = 'Space' })

-- File explorer
vim.keymap.set(
  'n',
  '<C-e>',
  ':Explore! 15<CR>',
  { silent = true, noremap = true, desc = 'Open file explorer with 15 lines height' }
)

-- Copy line from cursor position
vim.keymap.set('n', 'Y', 'v$y', { desc = 'Yank from cursor to end of line' })
-- vim.keymap.set('n', ',', '@@', { desc = 'Repeat last macro' })

-- Map <C-c> to <Esc>
vim.keymap.set({ 'i', 'n' }, '<C-c>', '<Esc>', { desc = 'Exit to normal mode' })

-- General movement mappings
vim.keymap.set({ 'n', 'v' }, '<leader><leader>', 'g_', { desc = 'Go to the end of the line' })
vim.keymap.set({ 'n', 'v' }, '<C-j>', '%', { desc = 'Jump to matching bracket' })
vim.keymap.set('i', '<C-j>', '<Esc>]}a', { desc = 'Jump to next closing bracket in insert mode' })

vim.keymap.set('n', '<Tab>', '<C-6>', { silent = true, noremap = false, desc = 'Go to previous buffer' })

-- Neovide specific mappings
-- Note: Actual Neovide mappings might be in a separate file

-- Find mode
vim.keymap.set('n', '<leader>f', ':find *', { desc = 'Find files in current directory' })

-- Search in directory
vim.keymap.set('n', '<leader>gg', function()
  local ok, pattern = pcall(vim.fn.input, 'Enter search pattern: ')
  if ok and pattern ~= '' then
    vim.cmd('silent! grep! ' .. pattern .. ' * 2> /dev/null')
    vim.cmd('copen')
  end
end, { desc = 'Search pattern in current directory', silent = true, noremap = false })

-- Find and replace current word
vim.keymap.set({ 'n', 'v' }, '<leader>;', function()
  local old_word = vim.fn.expand('<cword>')
  local new_word = vim.fn.input('Replace ' .. old_word .. ' by? ', old_word)

  if new_word ~= old_word and new_word ~= '' then
    vim.cmd(':%s/\\<' .. old_word .. '\\>/' .. new_word .. '/g')
  end
end, { desc = 'Find and replace current word' })

vim.keymap.set('n', '<M-=>', '<C-w>=', { desc = 'Make all windows equal size' })
vim.keymap.set('n', '<C-s>', ':w<CR>', { desc = 'Save current buffer', silent = true, noremap = false })

-- Window and buffer close
-- map('n', 'Q', '<c-w>q', { silent = true })
vim.keymap.set('n', 'Q', function()
  local buff_info = vim.fn.getbufinfo({ buflisted = 1 })
  if #buff_info > 1 then
    vim.api.nvim_buf_delete(0, { force = true, unload = false })
    return
  end
  vim.cmd('quit')
end, { silent = true, desc = 'Close buffer or quit if last buffer' })

vim.keymap.set('n', '<C-q>', ':qa!<CR>', { silent = true, desc = 'Force quit all' })

-- Visual mode mappings
vim.keymap.set('v', '<leader>y', ':CopyCodeBlock<CR>', { desc = 'Copy code block', silent = true, noremap = false })
vim.keymap.set('v', '<M-j>', ':m \'>+1<CR>gv=gv', { desc = 'Move selected lines down' })
vim.keymap.set('v', '<M-k>', ':m \'<-2<CR>gv=gv', { desc = 'Move selected lines up' })
vim.keymap.set('v', '>', '>gv', { desc = 'Indent and maintain selection' })
vim.keymap.set('v', '<', '<gv', { desc = 'Outdent and maintain selection' })

-- Load non-tmux specific keymaps when not in tmux session
if os.getenv('TMUX') == nil then
  require('custom.remap.no_tmux')
end

-- Copy entire file
vim.keymap.set('n', '<C-y>', ':%y+<CR>', { silent = true, desc = 'Copy entire file to clipboard' })

-- Folding
vim.keymap.set('n', '-', function()
  pcall(vim.cmd.foldclose)
end, { desc = 'Close current fold' })

-- Comment line
vim.api.nvim_set_keymap('n', '<leader>c', 'gcc', { desc = 'Toggle comment line' })
vim.api.nvim_set_keymap('v', '<leader>c', 'gc', { desc = 'Toggle comment lines' })

vim.keymap.set({ 'n', 'v' }, ',t', ':lua ToggleTrueFalse()<CR>', { desc = 'Toggle true/false' })

-- Spell check correction
vim.keymap.set('n', '<leader>q', '1z=', { desc = 'Accepts first spell fix' })
vim.keymap.set('n', '<leader>]', '1z=', { desc = 'Accepts first spell fix' })
vim.keymap.set('n', '<leader>[', '1z=', { desc = 'Accepts first spell fix' })

-- Tabs
require('custom.remap.tabs')

-- map('n', '<c-w>m', '<cmd>tabnew %<CR>')
vim.keymap.set('n', '<c-w>m', function()
  -- if have less than 2 window, do not open a new tab
  local windows = vim.api.nvim_tabpage_list_wins(0)
  if #windows < 2 then
    return
  end

  -- count how many common windows (focusable) we have
  -- this helps to avoid things like ts-context and nvim-navic to be counted
  -- as a window
  local count = 0
  for _, win_id in ipairs(windows) do
    local config = vim.api.nvim_win_get_config(win_id)
    if config.relative == '' then
      count = count + 1
    end
  end

  -- if it's only one, do not open a new tab
  if count < 2 then
    return
  end

  -- open a new tab
  local pos = vim.api.nvim_win_get_cursor(0)
  vim.cmd('tabnew %')
  vim.api.nvim_win_set_cursor(0, pos)
end, { desc = 'Zoom window into a tab' })

vim.keymap.set('n', 'H', 'zc', { desc = 'Closes fold' })
vim.keymap.set('n', 'L', 'zo', { desc = 'Opens fold' })

vim.keymap.set('n', '<leader>v', function()
  if vim.opt.conceallevel == 0 then
    vim.opt.conceallevel = 3
    vim.opt.concealcursor = 'ncv'
  else
    vim.opt.conceallevel = 0
    vim.opt.concealcursor = ''
  end
end, { desc = 'Toggle conceal' })

-- vim.keymap.set('c', '<Tab>', function()
--   if vim.fn.pumvisible() == 1 then
--     return '<c-y>'
--   end
--   return '<cr>'
-- end, { expr = true })
