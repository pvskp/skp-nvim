local function lazy_stats()
  if pcall(require, 'lazy') then
    local stats = require('lazy').stats()
    return string.format('\t\t\t\t🎉 loaded %d/%d plugins', stats.loaded, stats.count)
  end
  return ''
end

return {
  'goolord/alpha-nvim',
  -- event = 'VimEnter',
  lazy = false,
  dependencies = {
    "nvim-telescope/telescope.nvim"
  },
  keys = {
    {
      '<leader>a',
      '<cmd>Alpha<cr>',
      desc = 'Homepage',
    },
  },
  config = function()
    local alpha = require 'alpha'
    local dashboard = require 'alpha.themes.dashboard'
    dashboard.section.header.val = {
      '          ▀████▀▄▄              ▄█ ',
      '            █▀    ▀▀▄▄▄▄▄    ▄▄▀▀█ ',
      '    ▄        █          ▀▀▀▀▄  ▄▀  ',
      '   ▄▀ ▀▄      ▀▄              ▀▄▀  ',
      '  ▄▀    █     █▀   ▄█▀▄      ▄█    ',
      '  ▀▄     ▀▄  █     ▀██▀     ██▄█   ',
      '   ▀▄    ▄▀ █   ▄██▄   ▄  ▄  ▀▀ █  ',
      '    █  ▄▀  █    ▀██▀    ▀▀ ▀▀  ▄▀  ',
      '   █   █  █      ▄▄           ▄▀   ',
      '                neovim             ',
    }

    dashboard.section.buttons.val = {
      dashboard.button('ff', '  Find file', "<cmd>lua Telescope_find_files()<CR>"),
      dashboard.button('n', '  New file', ':ene<CR>'),
      dashboard.button('g', '  Find text', "<cmd>lua Telescope_live_grep()<CR>"),
      dashboard.button('p', '  Projects', "<cmd>lua Telescope_find_git_files()<CR>"),
      -- dashboard.button('u', '  Recently used files', ':Telescope oldfiles <CR>'),
      dashboard.button('c', '  Configuration', ':e $MYVIMRC | lcd ~/.config/nvim <CR>'),
      dashboard.button('e', '  Explorer', '<cmd>OpenFileManager <CR>'),
      -- dashboard.button('3', '  Open i3 config', ': e ~/.config/i3/config | lcd ~/.config/i3 <CR>'),
      dashboard.button('r', '  Restore last session', ':SessionRestore <CR>'),
      dashboard.button('s', '  Sync plugins', ':Lazy sync<CR>'),
      dashboard.button('q', '  Quit', ':qa<CR>'),
    }

    dashboard.section.footer.val = {
      '  github.com/pvskp |   pvskp.com',
      '',
      '',
      '',
      lazy_stats(),
    }

    vim.api.nvim_set_hl(0, 'AlphaHeader', {
      fg = TokyoNight.orange,
    })

    vim.api.nvim_set_hl(0, 'AlphaButtons', {
      fg = TokyoNight.cyan,
    })

    for _, button in ipairs(dashboard.section.buttons.val) do
      button.opts.hl = 'AlphaButtons'
      button.opts.hl_shortcut = 'AlphaShortcut'
    end

    dashboard.section.header.opts.hl = 'AlphaHeader'

    alpha.setup(dashboard.opts)

    vim.api.nvim_create_autocmd({ 'FileType' }, {
      pattern = 'alpha',
      callback = function()
        vim.cmd 'setlocal nofoldenable'
        vim.cmd 'setlocal nonumber'
        vim.cmd 'setlocal norelativenumber'

        vim.b.miniindentscope_disable = true
      end,
    })
  end,
}
