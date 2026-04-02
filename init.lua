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
    automatic_nested_syntaxes = 1
  }
}
