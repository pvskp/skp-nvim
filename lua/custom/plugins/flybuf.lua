return {
  'pvskp/flybuf.nvim',
  -- dir = "~/Documents/repos/flybuf.nvim/",
  lazy = false,
  config = function()
    local flybuf = require 'flybuf'
    vim.keymap.set('n', '<Tab>', flybuf.toggle, {})
    flybuf.setup {}
  end,
}
