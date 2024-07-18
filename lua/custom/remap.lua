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

-- General movement mappings
map({ 'n', 'v' }, '<leader><leader>', 'g_')
map({ 'n', 'v' }, '<C-j>', '%')
map('i', '<C-j>', '<Esc>]}a')

-- Buffer navigation
map('n', '<S-l>', ':bnext<CR>', opts)
map('n', '<S-h>', ':bprevious<CR>', opts)
map('n', '<leader>x', ':bdelete!<CR>', opts)
map('n', '<Tab>', '<C-6>', opts)

-- Neovide specific mappings
if vim.g.neovide then
  vim.keymap.set({ "n", "v" }, "<C-+>", ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + 0.1<CR>")
  vim.keymap.set({ "n", "v" }, "<C-->", ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor - 0.1<CR>")
  vim.keymap.set({ "n", "v" }, "<C-0>", ":lua vim.g.neovide_scale_factor = 1<CR>")
end

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


-- Find and replace current word
map({ 'n', 'v' }, '<leader>;', function()
  local old_word = vim.fn.expand '<cword>'
  local new_word = vim.fn.input('Replace ' .. old_word .. ' by? ', old_word)

  if new_word ~= old_word and new_word ~= '' then
    vim.cmd(':%s/\\<' .. old_word .. '\\>/' .. new_word .. '/g')
  end
end, {})


map('n', '<M-=>', '<C-w>=')
map('n', '<C-s>', ':w<CR>', opts)

-- Window and buffer close
-- map('n', 'Q', '<c-w>q', { silent = true })
map('n', 'Q', function()
  local buff_info = vim.fn.getbufinfo({ buflisted = 1 })
  if #buff_info > 1 then
    vim.api.nvim_buf_delete(0, { force = true, unload = false })
    return
  end
  vim.cmd('quit')
end, { silent = true })

map('n', '<C-q>', ':qa!<CR>', { silent = true })

-- Visual mode mappings
map('v', '<leader>y', ':CopyCodeBlock<CR>', opts)
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

-- Copy entire file
map('n', '<C-y>', ':%y+<CR>', { silent = true })

-- Folding
map('n', '-', function()
  pcall(vim.cmd.foldclose)
end, {})

-- Comment line
vim.api.nvim_set_keymap('n', '<leader>c', 'gcc', opts)
vim.api.nvim_set_keymap('v', '<leader>c', 'gc', opts)

-- Toggle true/false
map({ 'n', 'v' }, ',t', ':lua ToggleTrueFalse()<CR>', opts)

-- Spell check correction
map('n', '<leader>q', '1z=')
map('n', '<leader>]', '1z=')
map('n', '<leader>[', '1z=')
