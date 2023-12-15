return {
  "goolord/alpha-nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local dashboard = require("alpha.themes.dashboard")

    dashboard.section.header.val = {
      [[ ooooo      ooo               .                        ]],
      [[ `888b.     `8'             .o8                        ]],
      [[  8 `88b.    8   .oooo.   .o888oo oooo  oooo  oooo d8b ]],
      [[  8   `88b.  8  `P  )88b    888   `888  `888  `888""8P ]],
      [[  8     `88b.8   .oP"888    888    888   888   888     ]],
      [[  8       `888  d8(  888    888 .  888   888   888     ]],
      [[ o8o        `8  `Y888""8o   "888"  `V88V"V8P' d888b    ]],
    }

    dashboard.section.buttons.val = {
      dashboard.button("f", "  Find file", ":Telescope find_files <CR>"),
      dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
      dashboard.button("r", "  Recently used files", ":Telescope oldfiles <CR>"),
      dashboard.button("t", "󱎸  Find text", ":Telescope live_grep <CR>"),
      dashboard.button("c", "  Configuration", ":e $MYVIMRC <CR>"),
      dashboard.button("q", "  Quit Neovim", ":qa<CR>"),
    }

    local function footer()
      return ""
    end

    dashboard.section.footer.val = footer()

    dashboard.section.footer.opts.hl = "Type"
    dashboard.section.header.opts.hl = "Include"
    dashboard.section.buttons.opts.hl = "Keyword"

    dashboard.opts.opts.noautocmd = true
    -- vim.cmd([[autocmd User AlphaReady echo 'ready']])
    require("alpha").setup(dashboard.opts)
  end,
}
