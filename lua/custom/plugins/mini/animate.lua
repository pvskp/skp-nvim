return {
  'echasnovski/mini.nvim',
  lazy = false,
  version = false,
  config = function()
    local animate = require 'mini.animate'
    animate.setup {
      cursor = {
        enable = false,
      },
      scroll = {
        enable = false,
      },
      resize = {
        enable = true,
      },

      open = {
        enable = false,
        -- Animate for 400 milliseconds with linear easing
        timing = animate.gen_timing.linear { duration = 500, unit = 'total' },

        -- Animate with wiping from nearest edge instead of default static one
        winconfig = animate.gen_winconfig.center { direction = 'from_edge' },

        -- Make bigger windows more transparent
        winblend = animate.gen_winblend.linear { from = 0, to = 100 },
      },

      close = {
        enable = false,
        -- Animate for 400 milliseconds with linear easing
        timing = animate.gen_timing.linear { duration = 500, unit = 'total' },

        -- Animate with wiping to nearest edge instead of default static one
        winconfig = animate.gen_winconfig.wipe { direction = 'to_edge' },

        -- Make bigger windows more transparent
        winblend = animate.gen_winblend.linear { from = 100, to = 0 },
      },
    }
  end,
}
