return {
  'nvim-lualine/lualine.nvim',
  dependencies = {
    {
      'pvskp/battery.nvim',
      -- dir = "~/Documents/repos/battery.nvim/",
      opts = {
        update_rate_seconds = 30,           -- Number of seconds between checking battery status
        show_status_when_no_battery = true, -- Don't show any icon or text when no battery found (desktop for example)
        show_plugged_icon = true,           -- If true show a cable icon alongside the battery icon when plugged in
        show_unplugged_icon = true,         -- When true show a diconnected cable icon when not plugged in
        show_percent = true,                -- Whether or not to show the percent charge remaining in digits
        vertical_icons = true,              -- When true icons are vertical, otherwise shows horizontal battery icon
        multiple_battery_selection = 1,     -- Which battery to choose when multiple found. "max" or "maximum", "min" or "minimum" or a number to pick the nth battery found (currently linux acpi only)
      },
    },
    {
      'archibate/lualine-time',
    }
  },
  event = 'VimEnter',
  init = function()
    vim.opt.showmode = false
  end,

  config = function()
    local opts = require 'custom.plugins.ui.lualine.themes.supax'

    if vim.g.colors_name == nil then
      local default_theme = require 'custom.plugins.ui.lualine.themes.colors.default'
      opts.options.theme = default_theme
      require('lualine').setup(opts)
      return
    end
    require('lualine').setup(opts)

    if vim.g.colors_name == 'nord' then
      vim.api.nvim_set_hl(0, 'lualine_a_inactive', { fg = Nord.white, bg = Nord.light_gray })
    end
  end,
}
