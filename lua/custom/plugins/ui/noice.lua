return {
  "folke/noice.nvim",
  event = "VeryLazy",
  opts = {
    messages = {
      -- view = 'mini',
      -- view_error = 'mini',
      -- view_warn = 'mini',
      -- view_history = 'mini',
      -- view_search = 'mini',
    },
    -- add any options here
    lsp = {
      progress = {
        enabled = false,
      },
      hover = {
        enabled = false,
      },
      signature = {
        enabled = false,
      },
      message = {
        -- Messages shown by lsp servers
        enabled = true,
      },
      -- defaults for hover and signature help
      documentation = {
        view = "hover",
        opts = {
          lang = "markdown",
          replace = true,
          render = "plain",
          format = { "{message}" },
          win_options = { concealcursor = "n", conceallevel = 3 },
        },
      },
    },
    routes = {
      {
        view = "notify",
        filter = { event = "msg_showmode" },
      },
    },
  },
  dependencies = {
    -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
    "MunifTanjim/nui.nvim",
    -- OPTIONAL:
    --   `nvim-notify` is only needed, if you want to use the notification view.
    --   If not available, we use `mini` as the fallback
    "rcarriga/nvim-notify",
  },
  config = function(_, opts)
    require("notify").setup({
      background_colour = "#000000",
    })

    require("noice").setup(opts)
  end
}
