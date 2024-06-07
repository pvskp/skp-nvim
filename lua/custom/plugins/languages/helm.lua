return {
  'towolf/vim-helm',
  ft = 'helm',
  -- lazy = false,
  config = function()
    -- Disabls treesitter for helm files
    vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
      pattern = '*.yaml',
      callback = function()
        if vim.bo.filetype == 'helm' then
          vim.cmd 'TSDisable highlight'
          -- vim.cmd("LspStop yamlls")
          -- vim.cmd("LspStart helm_ls")
        end
      end,
    })
  end,
}
