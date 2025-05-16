return {
  'navarasu/onedark.nvim',
  priority = 1000,
  dependencies = {
    'echasnovski/mini.files',
  },
  lazy = false,
  ---@module 'onedark'
  opts = {
    -- Main options --
    style = 'deep', -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
    transparent = false, -- Show/hide background
    term_colors = true, -- Change terminal color as per the selected theme style
    ending_tildes = false, -- Show the end-of-buffer tildes. By default they are hidden
    cmp_itemkind_reverse = false, -- reverse item kind highlights in cmp menu

    -- toggle theme style ---
    toggle_style_key = nil, -- keybind to toggle theme style. Leave it nil to disable it, or set it to a string, for example "<leader>ts"
    toggle_style_list = { 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer', 'light' }, -- List of styles to toggle between

    -- Change code style ---
    -- Options are italic, bold, underline, none
    -- You can configure multiple style with comma separated, For e.g., keywords = 'italic,bold'
    code_style = {
      comments = 'italic',
      keywords = 'bold',
      functions = 'bold',
      strings = 'italic',
      variables = 'none',
    },

    -- Lualine options --
    lualine = {
      transparent = false, -- lualine center bar transparency
    },

    -- Custom Highlights --
    colors = {}, -- Override default colors
    highlights = {
      ['TrueHighlighGroup'] = { fg = '$green' },
      ['FalseHighlighGroup'] = { fg = '$red' },
      ['TreesitterContextLineNumber'] = { bg = '$bg1' },
      ['DiffAdd'] = { bg = '$green', fg = '#ffffff' },
      ['DiffChange'] = { bg = '$yellow', fg = '#ffffff' },
      ['DiffDeleted'] = { bg = '$red', fg = '#ffffff' },
      ['@string'] = { fg = '$yellow' },
      ['RenderMarkdownH1Bg'] = { fg = '$green', bg = '$bg1' },
      ['RenderMarkdownH2Bg'] = { fg = '$yellow', bg = '$bg1' },
      ['RenderMarkdownH3Bg'] = { fg = '$orange', bg = '$bg1' },
      ['RenderMarkdownH4Bg'] = { fg = '$red', bg = '$bg1' },
      ['RenderMarkdownH5Bg'] = { fg = '$purple', bg = '$bg1' },
      ['RenderMarkdownH6Bg'] = { fg = '$orange', bg = '$bg1' },
    }, -- Override highlight groups

    -- Plugins Config --
    diagnostics = {
      darker = true, -- darker colors for diagnostic
      undercurl = true, -- use undercurl instead of underline for diagnostics
      background = true, -- use background color for virtual text
    },
  },
  config = function(_, opts)
    require('onedark').setup(opts)
    require('onedark').load()
    vim.api.nvim_set_hl(0, '@boolean', { bold = true })
    vim.api.nvim_set_hl(0, 'TreesitterContextBottom', { underline = true, sp = '#455574' })
  end,
}
