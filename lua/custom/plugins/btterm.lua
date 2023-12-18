return {
  "pvskp/btterm",
  dir = "~/Documents/repos/btterm",
  -- dev = true,
  lazy = false,
  init = function ()
    local opts = { silent = true }
    vim.keymap.set({"n", "t"}, "<M-d>" , ":lua require('btterm').open_side_term()<CR>", opts)
    vim.keymap.set({"n", "t"}, "<M-s>" , ":lua require('btterm').open_bottom_term()<CR>", opts)
  end
}
