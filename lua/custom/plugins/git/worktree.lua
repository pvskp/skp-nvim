return {
  'ThePrimeagen/git-worktree.nvim',
  event = 'VeryLazy',
  config = function()
    require('telescope').load_extension 'git_worktree'
    local ext = require('telescope').extensions
    vim.keymap.set('n', '<leader>w', ext.git_worktree.git_worktrees, {})
    vim.keymap.set('n', '<leader>,', ext.git_worktree.create_git_worktree, {})
  end,
}
