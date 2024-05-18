return {
  'rmagatti/auto-session',
  lazy = true,
  init = function()
    vim.o.sessionoptions =
      'blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions'
    local function restore()
      if vim.fn.argc(-1) > 0 then
        return
      end

      vim.schedule(function()
        require('auto-session').AutoRestoreSession()
      end)
    end

    local lazy_view_win = nil

    vim.api.nvim_create_autocmd('User', {
      pattern = 'VeryLazy',
      callback = function()
        local lazy_view = require 'lazy.view'

        if lazy_view.visible() then
          lazy_view_win = lazy_view.view.win
        else
          restore()
        end
      end,
    })

    vim.api.nvim_create_autocmd('WinClosed', {
      callback = function(event)
        if not lazy_view_win or event.match ~= tostring(lazy_view_win) then
          return
        end

        restore()
      end,
    })
  end,
  opts = {
    log_level = 'error',
    auto_session_suppress_dirs = {},
    -- ⚠️ This will only work if Telescope.nvim is installed
    -- The following are already the default values, no need to provide them if these are already the settings you want.
    session_lens = {
      -- If load_on_setup is set to false, one needs to eventually call `require("auto-session").setup_session_lens()` if they want to use session-lens.
      buftypes_to_ignore = {}, -- list of buffer types what should not be deleted from current session
      load_on_setup = false,
      theme_conf = { border = true },
      previewer = false,
    },
  },
}
