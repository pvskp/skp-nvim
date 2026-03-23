vim.pack.add({
  Gh('aserowy/tmux.nvim')
})

local opts = { silent = true }

require('tmux').setup()

Map('n', '<M-h>', function() require('tmux').move_left() end, opts)
Map('n', '<M-l>', function() require('tmux').move_right() end, opts)
Map('n', '<M-j>', function() require('tmux').move_bottom() end, opts)
Map('n', '<M-k>', function() require('tmux').move_top() end, opts)
Map('n', '<M-Left>', function() require('tmux').resize_left('3') end, opts)
Map('n', '<M-Right>', function() require('tmux').resize_right('3') end, opts)
Map('n', '<M-Down>', function() require('tmux').resize_bottom('3') end, opts)
Map('n', '<M-Up>', function() require('tmux').resize_top('3') end, opts)
