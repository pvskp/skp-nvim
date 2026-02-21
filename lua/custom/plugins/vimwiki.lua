---@module "lazy"
---@type LazyPluginSpec
return {
  'vimwiki/vimwiki',
  lazy = false,
  init = function()
    vim.g.vimwiki_folding = 'list'
    vim.g.vimwiki_conceallevel = 3
    vim.g.vimwiki_ext2syntax = vim.empty_dict()
    vim.g.vimwiki_list = {
      {
        path = '~/Documents/repos/mywiki/',
        -- syntax = 'markdown',
        -- ext = '.md',
      },
    }

    vim.api.nvim_create_autocmd('BufEnter', {
      pattern = '*.md',
      callback = function()
        vim.cmd.set('ft=markdown')
      end,
    })

    -- vim.api.nvim_create_autocmd('FileType', {
    --   pattern = 'vimwiki',
    --   callback = function(args)
    --     vim.api.nvim_set_option_value('wrap', false, { scope = 'local' })
    --   end,
    -- })
  end,
}
