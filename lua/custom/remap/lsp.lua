local M = {}

function M.setup(bufnr)
  local keymap = vim.keymap -- for conciseness
  local opts = { noremap = true, silent = true }

  opts.buffer = bufnr

  keymap.set('n', '<leader>ll', function()
    local new_config = not vim.diagnostic.config().virtual_lines
    if new_config then
      vim.notify('Virtual lines ON', vim.log.levels.INFO)
    else
      vim.notify('Virtual lines OFF', vim.log.levels.INFO)
    end
    vim.diagnostic.config({ virtual_lines = new_config })
  end, { desc = 'Toggle diagnostic virtual_lines' })

  opts.desc = 'Toggle inlay hint'
  keymap.set('n', '<leader>li', function()
    vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
  end, { desc = opts.desc })

  -- opts.desc = 'Go to declaration in vertical split'
  keymap.set('n', 'gV', function()
    vim.cmd('vsplit')
    vim.lsp.buf.definition()
  end, opts)

  opts.desc = 'Go to declaration in horizontal split'
  keymap.set('n', 'gh', function()
    vim.cmd('split')
    vim.lsp.buf.definition()
  end, opts)

  opts.desc = 'See available code actions'
  keymap.set({ 'n', 'v' }, '<leader>la', vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

  -- opts.desc = 'Restart neovim'
  -- keymap.set('n', '<leader>rr', '<cmd>restart<cr>', opts)

  opts.desc = 'Smart rename'
  keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts) -- smart rename

  opts.desc = 'Show line diagnostics'
  keymap.set('n', '<leader>d', vim.diagnostic.open_float, opts) -- show diagnostics for line

  opts.desc = 'Formats code'
  keymap.set('n', '<leader>lf', vim.lsp.buf.format, opts)

  opts.desc = 'Show LSP signature'
  vim.keymap.set('i', '<C-k>', function()
    vim.lsp.buf.signature_help({ border = 'solid' })
  end, opts)

  opts.desc = 'Go to references'
  keymap.set('n', 'gr', vim.lsp.buf.references, opts) -- show diagnostics for line

  opts.desc = 'Show line diagnostics'
  keymap.set('n', 'gl', vim.diagnostic.open_float, opts) -- show diagnostics for line

  opts.desc = 'Go to previous diagnostic'
  keymap.set('n', '[d', function()
    vim.diagnostic.jump({ count = -1, float = true })
  end, opts) -- jump to previous diagnostic in buffer

  opts.desc = 'Go to next diagnostic'
  keymap.set('n', ']d', function()
    vim.diagnostic.jump({ count = 1, float = true })
  end, opts) -- jump to next diagnostic in buffer

  opts.desc = 'Opens quickfix list with diagnostics'
  vim.keymap.set('n', '<leader>oq', vim.diagnostic.setloclist, opts)

  opts.desc = 'Show documentation for what is under cursor'
  keymap.set('n', 'K', function()
    vim.lsp.buf.hover({ border = 'solid' })
  end, opts) -- show documentation for what is under cursor
end

return M
