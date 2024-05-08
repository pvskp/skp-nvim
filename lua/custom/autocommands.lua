local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  group = highlight_group,
  pattern = '*',
  callback = function()
    local event = vim.v.event
    if event.operator == 'y' and event.regtype ~= '' then
      vim.highlight.on_yank { higroup = 'IncSearch', timeout = 300, on_visual = false }
    end
  end,
})

vim.api.nvim_create_autocmd({ 'BufWinEnter' }, {
  group = vim.api.nvim_create_augroup('TFVarsHighlight', { clear = true }),
  pattern = '*.tfvars',
  command = 'set filetype=terraform',
})

-- vim.api.nvim_create_autocmd({ 'BufWinEnter' }, {
--   group = vim.api.nvim_create_augroup('AnsibleFiletype', { clear = true }),
--   pattern = '*.yaml.ansible',
--   command = 'set filetype=ansible',
-- })

-- Fix cursor
local cursor_reset = vim.api.nvim_create_augroup('CursorReset', { clear = true })
vim.api.nvim_create_autocmd('VimLeave', {
  group = cursor_reset,
  pattern = '*',
  command = 'set guicursor=a:ver90',
})

vim.api.nvim_create_autocmd({ 'BufWinEnter' }, {
  callback = function()
    vim.cmd 'set formatoptions-=cro'
  end,
})

vim.api.nvim_create_autocmd({ 'FileType' }, {
  pattern = {
    'netrw',
    'Jaq',
    'qf',
    'git',
    'help',
    'man',
    'lspinfo',
    'oil',
    'spectre_panel',
    'lir',
    'DressingSelect',
    'tsplayground',
    '',
  },
  callback = function()
    vim.cmd [[
      nnoremap <silent> <buffer> q :bd<CR>
      set nobuflisted
    ]]
  end,
})

vim.api.nvim_create_autocmd({ 'BufEnter' }, {
  pattern = '*.md',
  command = 'set wrap',
})

vim.api.nvim_create_autocmd({ 'BufWritePost' }, {
  pattern = 'kitty.conf',
  command = 'silent !pkill -USR1 kitty',
})

-- Initiates the LSP for ansible, if available
local ansible_filetype_group = vim.api.nvim_create_augroup('FiletypeAnsible', { clear = true })
vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
  group = ansible_filetype_group,
  pattern = '*.ansible.yaml',
  callback = function()
    vim.cmd 'set filetype=ansible'

    vim.cmd 'LspStart ansiblels'
    vim.cmd 'LspStart yamlls'
    -- vim.cmd 'set filetype=ansible'
    -- pcall(vim.lsp.start, {
    --   name = 'ansiblels',
    --   cmd = { 'ansible-language-server', '--stdio' },
    -- })
  end,
})

local function strip_trailing_whitespace()
  local save = vim.fn.winsaveview() -- Salva a posição atual do cursor
  vim.cmd [[ %s/\s\+$//e ]] -- Remove espaços em branco no final de todas as linhas
  vim.fn.winrestview(save) -- Restaura a posição do cursor
end

vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = '*', -- Para todos os arquivos
  callback = strip_trailing_whitespace,
})

-- vim.api.nvim_create_autocmd({ "BufWritePost" }, {
-- 	pattern = "*.py",
-- 	callback = function()
-- 		vim.fn.system("autoimport " .. vim.fn.expand("%"))
-- 		-- and then reload the buffer
-- 		vim.cmd("edit")
-- 	end,
-- })
