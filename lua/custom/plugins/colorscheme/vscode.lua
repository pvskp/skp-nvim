return {
  "Mofiqul/vscode.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    vim.o.background = 'dark'
    local c = require('vscode.colors').get_colors()
    local color_bg = c.vscDarkBlue
    require('vscode').setup({
      -- Enable italic comment
      italic_comments = true,

      -- Underline `@markup.link.*` variants
      underline_links = true,

      -- Disable nvim-tree background color
      disable_nvimtree_bg = true,

      -- Apply theme colors to terminal
      terminal_colors = true,

      -- Override highlight groups (see ./lua/vscode/theme.lua)
      group_overrides = {
        -- this supports the same val table as vim.api.nvim_set_hl
        -- use colors from this colorscheme by requiring vscode.colors!
        Cursor = { fg = color_bg, bg = c.vscLightGreen, bold = true },
        Statusline = { bg = c.vscLeftDark },
        StatuslineMode = { bg = color_bg },
        StatuslineSeparator = { fg = color_bg, bg = c.vscLeftDark },
        IconBranch = { fg = c.vscOrange, bg = color_bg },
        IconSun = { fg = c.vscYellow, bg = color_bg },
        IconSunset = { fg = c.vscOrange, bg = color_bg },
        IconMoon = { fg = c.vscAccentBlue, bg = color_bg },
        TreesitterContext = { bg = "#1a1a1a" },
        TreesitterContextLineNumber = { bg = "#1a1a1a" },
        TreesitterContextBottom = {underline = true, sp = "#000000"}
      }
    })

    vim.cmd.colorscheme "vscode"
  end,
}
