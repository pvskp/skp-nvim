vim.api.nvim_create_autocmd('PackChanged', {
  callback = function(ev)
    local name, kind = ev.data.spec.name, ev.data.kind
    if name == 'nvim-treesitter' and kind == 'update' then
      if not ev.data.active then vim.cmd.packadd('nvim-treesitter') end
      vim.cmd('TSUpdate')
    end
  end
})

vim.pack.add({
  Gh('nvim-treesitter/nvim-treesitter')
})

local ensure_install = {
  'go',
  'lua',
  'python',
  'bash',
  'zsh',
}

local ensure_enabled = vim.list_extend(
  vim.fn.deepcopy(ensure_install),
  {'http'}
)

require('nvim-treesitter').install(ensure_install)

vim.api.nvim_create_autocmd('FileType', {
  pattern = ensure_enabled,
  callback = function()
    vim.treesitter.start()
    vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
    vim.wo.foldmethod = 'expr'
  end,
})
