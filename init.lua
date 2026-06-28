require("options")
require("keymap")

vim.g.vimwiki_folding = 'list'
vim.g.vimwiki_conceallevel = 3

vim.g.vimwiki_global_ext = 0
vim.g.vimwiki_ext2syntax = {
  ['.mw'] = 'media'
}

vim.g.vimwiki_list = {
  {
    path = '~/personal-sync/wiki/',
    syntax = 'markdown',
    ext = 'md'
  },
  {
    automatic_nested_syntaxes = 1
  }
}

vim.g.vimwiki_key_mappings = {
  linkgs = 0
}
