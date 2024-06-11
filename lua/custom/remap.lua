-- Key mappings for general functionality
local map = vim.keymap.set
local opts = { silent = true, noremap = false }

-- Leader key settings
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Disable space key
map('n', '<Space>', '<Nop>', { silent = true, remap = false })

-- File explorer
map('n', '<C-e>', ':Explore! 15<CR>', { silent = true, noremap = true })

-- Copy line from cursor position
map('n', 'Y', 'v$y')

map({ 'i', 'n' }, '<C-c>', '<Esc>')

-- Movement key mappings
map({ 'n', 'v' }, '<leader><leader>', 'g_')
map({ 'n', 'v' }, '<C-j>', '%')

-- Buffer navigation
map('n', '<S-l>', ':bnext<CR>', opts)
map('n', '<S-h>', ':bprevious<CR>', opts)
map('n', '<Tab>', '<C-6>', opts)

-- Find mode
map('n', '<leader>ff', ':find *')

-- Search in directory
map('n', '<leader>g', function()
  local ok, pattern = pcall(vim.fn.input, 'Enter search pattern: ')
  if ok and pattern ~= '' then
    vim.cmd('silent! grep! ' .. pattern .. ' * 2> /dev/null')
    vim.cmd 'copen'
  end
end, opts)

-- Window splitting
map('n', '<M-j>', '<C-w>j')
map('n', '<M-k>', '<C-w>k')
map('n', '<M-l>', '<C-w>l')
map('n', '<M-h>', '<C-w>h')

map({ 'n', 'v' }, ';', ':')
map({ 'n', 'v' }, ':', ';')

map('n', '<leader>;', function()
  local old_word = vim.fn.expand '<cword>'
  local new_word = vim.fn.input('Replace ' .. old_word .. ' by? ', old_word)

  if new_word ~= old_word and new_word ~= '' then
    vim.cmd(':%s/\\<' .. old_word .. '\\>/' .. new_word .. '/g')
  end
end, {})

-- Resize window
map('n', '<M-r>', function()
  local keymap_set = vim.keymap.set
  local interactive_resize_opts = { noremap = true }

  keymap_set('n', 'k', ':resize -2<CR>', interactive_resize_opts)
  keymap_set('n', 'j', ':resize +2<CR>', interactive_resize_opts)
  keymap_set('n', 'l', ':vertical resize -2<CR>', interactive_resize_opts)
  keymap_set('n', 'h', ':vertical resize +2<CR>', interactive_resize_opts)
  keymap_set('n', '<C-c>', '<cmd>lua Exit_interactive_resize()<CR>', interactive_resize_opts)

  -- exit resize mode
  keymap_set('n', 'q', function()
    local keymap_del = vim.api.nvim_del_keymap
    keymap_del('n', 'k')
    keymap_del('n', 'j')
    keymap_del('n', 'h')
    keymap_del('n', 'l')
    keymap_del('n', '<C-c>')
    keymap_del('n', 'q')
  end, interactive_resize_opts)
end, { noremap = true, silent = true })

map('n', '<M-=>', '<C-w>=')
map('n', '<C-s>', ':w<CR>', opts)
map('n', '<M-t>', ':term<CR>')

map('n', 'Q', ':bd!<CR>', { silent = true })

map('n', '<C-q>', ':qa!<CR>', { silent = true })

-- Visual mode mappings
map('v', '<M-j>', ":m '>+1<CR>gv=gv")
map('v', '<M-k>', ":m '<-2<CR>gv=gv")
map('v', '>', '>gv')
map('v', '<', '<gv')

-- Tab key mappings
map('n', '<M-a>c', function()
  vim.cmd 'tabnew'
  vim.cmd 'term'
end)
map('n', '<M-1>', '1gt')
map('n', '<M-2>', '2gt')
map('n', '<M-3>', '3gt')
map('n', '<M-4>', '4gt')
map('n', '<M-5>', '5gt')
map('n', '<M-6>', '6gt')
map('n', '<M-7>', '7gt')
map('n', '<M-8>', '8gt')
map('n', '<M-9>', '9gt')

-- Terminal mode mappings
-- map('t', '<M-a>', '<C-\\><C-n>')
map('t', '<C-x>', '<C-\\><C-n>')
map('t', '<Esc>', '<C-\\><C-n>')

map('t', '<M-j>', '<C-\\><C-n><C-w>j', { silent = true })
map('t', '<M-k>', '<C-\\><C-n><C-w>k', { silent = true })
map('t', '<M-l>', '<C-\\><C-n><C-w>l', { silent = true })
map('t', '<M-h>', '<C-\\><C-n><C-w>h', { silent = true })

-- Copy entire file
map('n', '<C-y>', ':%y+<CR>', { silent = true })

-- Window zoom
local window_zoomed = false
local window_zoom_restore = {}

-- Command mode mappings
vim.api.nvim_set_keymap('c', '<C-x>', '<C-y>', { noremap = true })

-- Folding
map('n', '-', function()
  pcall(vim.cmd.foldclose)
end, {})

-- Comment line
vim.api.nvim_set_keymap('n', '<leader>c', 'gcc', opts)
vim.api.nvim_set_keymap('v', '<leader>c', 'gc', opts)

map({ 'n', 'v' }, '<C-t>', ':lua ToggleTrueFalse()<CR>', opts)

-- Spell
map('n', '<leader>q', '1z=')
