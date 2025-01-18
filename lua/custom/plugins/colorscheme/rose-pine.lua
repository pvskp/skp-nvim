return {
  'rose-pine/neovim',
  name = 'rose-pine',
  priority = 1000,
  lazy = false,
  init = function()
    vim.opt.laststatus = 2 -- Or 3 for global statusline
    vim.opt.statusline = " %f %m %= %y %p%% "
  end,
  opts = {
    variant = 'moon',      -- auto, main, moon, or dawn
    dark_variant = 'moon', -- main, moon, or dawn
    dim_inactive_windows = false,
    extend_background_behind_borders = true,

    enable = {
      terminal = true,
      legacy_highlights = true, -- Improve compatibility for previous versions of Neovim
      migrations = true,        -- Handle deprecated options automatically
    },


    highlight_groups = {
      Comment = { italic = true },
      StatusLine = { fg = "love", bg = "love", blend = 10 },
      StatusLineNC = { fg = "subtle", bg = "surface" },

      -- VertSplit = { fg = "muted", bg = "muted" },
    },

    styles = {
      bold = true,
      italic = false,
      transparency = false,
    },
  },

  config = function(_, opts)
    require('rose-pine').setup(opts)
    vim.cmd [[colorscheme rose-pine]]

    -- set_hl("StatusLine", { fg = "#ffffff", bg = "#907aa9" })
    -- set_hl("TreesitterContextBottom", { underline = true, sp = "#907aa9" })
    set_hl("htmlLink", { underline = false })
    set_hl("@markup.link.label.tsx", { fg = Rosepine.love, underline = false })
  end,
}

--- TreesitterContextBottom xxx cterm=underline gui=underline guisp=NvimDarkGrey3
