return {
  "gelguy/wilder.nvim",
  event = "CmdlineEnter",
  opts = {
    modes = { ":", "/", "?" },
  },
  config = function(_, opts)
    local wilder = require("wilder")
    wilder.setup(opts)

    wilder.set_option(
      "renderer",
      wilder.popupmenu_renderer(wilder.popupmenu_border_theme({
        -- highlights = {
        -- 	border = "Normal", -- highlight to use for the border
        -- },
        -- 'single', 'double', 'rounded' or 'solid'
        -- can also be a list of 8 characters, see :h wilder#popupmenu_border_theme() for more details
        next_key = "<C-n>",
        previous_key = "<C-p>",
        border = Borders.simple,
        left = { " ", wilder.popupmenu_devicons() },
        right = { " ", wilder.popupmenu_scrollbar() },
      }))
    )
  end,
}
