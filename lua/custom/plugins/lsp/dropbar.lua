return {
  'Bekaboo/dropbar.nvim',
  lazy = false,
  -- event = "VeryLazy",
  keys = {
    {
      '<leader>n',
      function()
        require('dropbar.api').pick()
      end,
      desc = 'Dropbar Pick'
    }
  },
  dependencies = {
    'nvim-telescope/telescope-fzf-native.nvim'
  },
  config = function()
    local open_item_and_close_menu = function()
      local utils = require('dropbar.utils')
      local menu = utils.menu.get_current()
      if not menu then
        return
      end

      local cursor = vim.api.nvim_win_get_cursor(menu.win)
      local entry = menu.entries[cursor[1]]
      -- stolen from https://github.com/Bekaboo/dropbar.nvim/issues/66
      local component = entry:first_clickable(entry.padding.left + entry.components[1]:bytewidth())
      if component then
        menu:click_on(component, nil, 1, 'l')
      end
    end

    local dropbar = require('dropbar')
    local utils = require('dropbar.utils')
    dropbar.setup({
      menu = {
        keymaps = {
          ['h'] = '<C-w>q',
          ['l'] = function()
            local menu = utils.menu.get_current()
            if not menu then
              return
            end
            local cursor = vim.api.nvim_win_get_cursor(menu.win)
            local component = menu.entries[cursor[1]]:first_clickable(cursor[2])
            if component then
              menu:click_on(component, nil, 1, 'l')
            end
          end,
          ['<CR>'] = open_item_and_close_menu,
        }
      },
    })
  end
}
