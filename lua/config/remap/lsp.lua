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
    -- vim.lsp.buf.signature_help({ border = 'solid' })
  end, opts)

  -- -- Go to implementations excluding files with "mock" or "fake" in the path
  -- local function goto_filtered_implementations()
  --   local params = vim.lsp.util.make_position_params()
  --   vim.lsp.buf_request(0, 'textDocument/implementation', params, function(err, result, ctx)
  --     if err then
  --       vim.notify('LSP implementation error: ' .. (err.message or tostring(err)), vim.log.levels.ERROR)
  --       return
  --     end
  --     if not result or (type(result) == 'table' and vim.tbl_isempty(result)) then
  --       vim.notify('No implementations found', vim.log.levels.WARN)
  --       return
  --     end
  --
  --     if not vim.tbl_islist(result) then
  --       result = { result }
  --     end
  --
  --     local filtered = {}
  --     for _, loc in ipairs(result) do
  --       local uri = loc.uri or loc.targetUri
  --       local path = uri and vim.uri_to_fname(uri) or ''
  --       local lower = string.lower(path)
  --       if not lower:match('mock') and not lower:match('fake') then
  --         table.insert(filtered, loc)
  --       end
  --     end
  --
  --     if #filtered == 0 then
  --       vim.notify('No implementations after filter (excluding mock/fake)', vim.log.levels.WARN)
  --       return
  --     end
  --
  --     local client = ctx and ctx.client_id and vim.lsp.get_client_by_id(ctx.client_id) or nil
  --     local encoding = (client and client.offset_encoding) or 'utf-16'
  --
  --     if #filtered == 1 then
  --       vim.lsp.util.jump_to_location(filtered[1], encoding, true)
  --       return
  --     end
  --
  --     local items = vim.lsp.util.locations_to_items(filtered, encoding)
  --     vim.fn.setqflist({}, ' ', { title = 'Implementations (filtered)', items = items })
  --     vim.cmd('copen')
  --   end)
  -- end
  --

  -- Let Snack handle this
  -- opts.desc = 'Go to implementations'
  -- keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
  --
  -- opts.desc = 'Go to references'
  -- keymap.set('n', 'gr', vim.lsp.buf.references, opts) -- show diagnostics for line

  opts.desc = 'Show line diagnostics'
  keymap.set('n', 'gl', function()
    vim.diagnostic.open_float({ border = 'single' })
  end, opts) -- show diagnostics for line

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
    vim.lsp.buf.hover({ border = 'single' })
  end, opts) -- show documentation for what is under cursor
end

return M
