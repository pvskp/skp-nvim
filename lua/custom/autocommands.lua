--- Resize Neovim split when the system window is resized
vim.api.nvim_create_autocmd('VimResized', {
  callback = function()
    vim.cmd('vertical wincmd =')
    vim.cmd('horizontal wincmd =')
  end
})

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

vim.api.nvim_create_autocmd({ 'TermOpen' }, {
  group = vim.api.nvim_create_augroup('TermAutoCMD', { clear = true }),
  pattern = '*',
  command = 'startinsert',
})

vim.api.nvim_create_autocmd({ 'TermClose' }, {
  group = vim.api.nvim_create_augroup('TermAutoCMD', { clear = true }),
  pattern = '*',
  command = '',
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

-- Removes trailing spaces
vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = '*',
  callback = function()
    local save = vim.fn.winsaveview()
    vim.cmd [[ %s/\s\+$//e ]]
    vim.fn.winrestview(save)
  end,
})

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(event)
    -- The following two autocommands are used to highlight references of the
    -- word under your cursor when your cursor rests there for a little while.
    --    See `:help CursorHold` for information about when this is executed
    --
    -- When you move your cursor, the highlights will be cleared (the second autocommand).
    local client = vim.lsp.get_client_by_id(event.data.client_id)
    if client and client.server_capabilities.documentHighlightProvider then
      local highlight_augroup = vim.api.nvim_create_augroup('kickstart-lsp-highlight', { clear = false })
      vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
        buffer = event.buf,
        group = highlight_augroup,
        callback = vim.lsp.buf.document_highlight,
      })

      vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
        buffer = event.buf,
        group = highlight_augroup,
        callback = vim.lsp.buf.clear_references,
      })
    end
  end
})
