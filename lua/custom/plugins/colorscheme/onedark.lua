local set_highlights = function()
  set_hl("MatchParen", { bg = Onedark.red, fg = "#ffffff" })

  set_hl("CursorLineNr", { fg = Onedark.orange, bold = true })

  set_hl("TelescopePromptBorder", { fg = Onedark.light_grey })
  set_hl("TelescopeResultsBorder", { fg = Onedark.light_grey })
  set_hl("TelescopePreviewBorder", { fg = Onedark.light_grey })

  set_hl("GitSignsCurrentLineBlame", { fg = Onedark.bg2 })

  set_hl('MiniFilesNormal', { bg = nil })
  set_hl("MiniFilesBorder", { fg = Onedark.light_grey })
  set_hl('MiniFilesTitle', { fg = Onedark.green })
  set_hl('MiniFilesTitleFocused', { fg = Onedark.green, bold = true })

  set_hl('TreesitterContextLineNumber', { bg = Onedark.bg1 })
  set_hl('TreesitterContextBottom', {
    fg = nil,
    bg = nil,
    sp = Onedark.grey,
    -- underline = true
  })
end

set_highlights()

return {
  'navarasu/onedark.nvim',
  priority = 1000,
  dependencies = {
    "echasnovski/mini.files"
  },
  lazy = false,
  opts = {
    -- Main options --
    style = 'dark',               -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
    transparent = false,          -- Show/hide background
    term_colors = true,           -- Change terminal color as per the selected theme style
    ending_tildes = false,        -- Show the end-of-buffer tildes. By default they are hidden
    cmp_itemkind_reverse = false, -- reverse item kind highlights in cmp menu

    -- toggle theme style ---
    toggle_style_key = nil,                                                              -- keybind to toggle theme style. Leave it nil to disable it, or set it to a string, for example "<leader>ts"
    toggle_style_list = { 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer', 'light' }, -- List of styles to toggle between

    -- Change code style ---
    -- Options are italic, bold, underline, none
    -- You can configure multiple style with comma separated, For e.g., keywords = 'italic,bold'
    code_style = {
      comments = 'italic',
      keywords = 'bold',
      functions = 'bold',
      strings = 'none',
      variables = 'none',
    },

    -- Lualine options --
    lualine = {
      transparent = false, -- lualine center bar transparency
    },

    -- Custom Highlights --
    colors = {},     -- Override default colors
    highlights = {}, -- Override highlight groups

    -- Plugins Config --
    diagnostics = {
      darker = true,     -- darker colors for diagnostic
      undercurl = true,  -- use undercurl instead of underline for diagnostics
      background = true, -- use background color for virtual text
    },
  },
  config = function(_, opts)
    require('onedark').setup(opts)
    require('onedark').load()
    -- set_highlights()
  end,
}
