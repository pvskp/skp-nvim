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
        nested_syntaxes = {
          python = 'python',
          ['c++'] = 'cpp',
          go = 'go',
          bash = 'bash',
          sh = 'sh',
        },
      },
    }

    vim.api.nvim_create_autocmd('BufEnter', {
      pattern = '*.md',
      callback = function()
        vim.cmd.set('ft=markdown')
      end,
    })

    vim.api.nvim_create_autocmd('FileType', {
      pattern = 'vimwiki',
      callback = function(args)
        vim.api.nvim_set_option_value('wrap', false, { scope = 'local' })
        vim.api.nvim_set_option_value('textwidth', 80, { scope = 'local' })
        vim.api.nvim_set_option_value('colorcolumn', '81', { scope = 'local' })

        -- vim.o.wrap = false
        -- vim.o.textwidth = 80
        -- vim.o.colorcolumn = '81'

        -- ESSENCIAL: Ativa a quebra automática de texto (t) e em comentários (c)
        -- 't' -> Auto-wrap usando textwidth
        -- 'q' -> Permite formatar parágrafos com 'gq'
        -- 'j' -> Remove caracteres de comentário ao juntar linhas, se aplicável
        -- vim.opt_local.formatoptions = vim.opt_local.formatoptions + { t = true, q = true, j = true }
        vim.opt_local.formatoptions = 'tcqj'
      end,
    })
  end,
}
