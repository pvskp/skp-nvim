local ranger_hide_barbecue = function()
  vim.cmd('Barbecue hide')
  vim.cmd('Ranger')
end

return {
  'francoiscabrol/ranger.vim',
  lazy = false,
  keys = {
    { '<leader>e', ranger_hide_barbecue },
    { '<C-e>', ranger_hide_barbecue },
  },
  dependencies = {
    'rbgrouleff/bclose.vim',
  },
  init = function()
    vim.g.ranger_map_keys = false
    vim.g.ranger_replace_netrw = 1

    vim.api.nvim_create_autocmd({ 'TermClose' }, {
      pattern = 'term://*ranger*',
      callback = function()
        vim.api.nvim_input('<CR>')
      end,
    })

    vim.api.nvim_create_autocmd({ 'TermOpen' }, {
      pattern = 'term://*ranger*',
      callback = function(args)
        vim.api.nvim_set_option_value('filetype', 'ranger', { buf = args.buf })
      end,
    })

    vim.api.nvim_create_autocmd({ 'TermLeave' }, {
      pattern = 'term://*ranger*',
      callback = function(args)
        vim.cmd('Barbecue show')
      end,
    })
  end,
}
