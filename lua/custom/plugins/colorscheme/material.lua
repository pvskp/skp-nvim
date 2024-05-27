return {
  'marko-cerovac/material.nvim',
  lazy = false,
  priority = 1000,

  opts = {
    contrast = {
      terminal = false, -- Enable contrast for the built-in terminal
      sidebars = false, -- Enable contrast for sidebar-like windows ( for example Nvim-Tree )
      floating_windows = true, -- Enable contrast for floating windows
      cursor_line = false, -- Enable darker background for the cursor line
      lsp_virtual_text = false, -- Enable contrasted background for lsp virtual text
      non_current_windows = true, -- Enable contrasted background for non-current windows
      filetypes = {}, -- Specify which filetypes get the contrasted (darker) background
    },

    styles = { -- Give comments style such as bold, italic, underline etc.
      comments = { --[[ italic = true ]]
      },
      strings = { --[[ bold = true ]]
      },
      keywords = { --[[ underline = true ]]
        bold = true,
      },
      functions = { bold = true },
      variables = {},
      operators = {},
      types = {},
    },

    plugins = { -- Uncomment the plugins that you use to highlight them
      -- Available plugins:
      -- "coc",
      -- "colorful-winsep",
      -- "dap",
      -- "dashboard",
      -- "eyeliner",
      -- "fidget",
      -- "flash",
      -- "gitsigns",
      -- "harpoon",
      -- "hop",
      -- "illuminate",
      -- "indent-blankline",
      -- "lspsaga",
      -- "mini",
      -- "neogit",
      -- "neotest",
      -- "neo-tree",
      -- "neorg",
      -- "noice",
      -- "nvim-cmp",
      -- "nvim-navic",
      -- "nvim-tree",
      -- "nvim-web-devicons",
      -- "rainbow-delimiters",
      -- "sneak",
      -- "telescope",
      -- "trouble",
      -- "which-key",
      -- "nvim-notify",
    },

    disable = {
      colored_cursor = false, -- Disable the colored cursor
      borders = false, -- Disable borders between verticaly split windows
      background = true, -- Prevent the theme from setting the background (NeoVim then uses your terminal background)
      term_colors = true, -- Prevent the theme from setting terminal colors
      eob_lines = false, -- Hide the end-of-buffer lines
    },

    high_visibility = {
      lighter = false, -- Enable higher contrast text for lighter style
      darker = false, -- Enable higher contrast text for darker style
    },

    lualine_style = 'default', -- Lualine style ( can be 'stealth' or 'default' )

    async_loading = true, -- Load parts of the theme asyncronously for faster startup (turned on by default)
  },

  config = function(_, opts)
    vim.g.material_style = 'oceanic'
    require('material').setup(opts)
    vim.cmd 'colorscheme material'
  end,
}
