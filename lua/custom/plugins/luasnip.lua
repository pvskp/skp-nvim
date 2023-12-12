-- vim.keymap.set({"i"}, "<C-K>", function() ls.expand() end, {silent = true})
vim.keymap.set({"i", "s"}, "<Tab>", function() require('luasnip').jump( 1) end, {silent = true})
vim.keymap.set({"i", "s"}, "<S-Tab>", function() require('luasnip').jump(-1) end, {silent = true})
return {
  "L3MON4D3/LuaSnip", -- snippet engine,
}
