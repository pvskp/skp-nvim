return {
  "folke/noice.nvim",
  event = "VeryLazy",
  opts = {
    lsp = {
      progress = {
        enabled = false,
        format = "lsp_progress",
        format_done = "lsp_progress_done",
        throttle = 1000 / 30, -- frequency to update lsp progress message
        view = "mini",
      },
      hover = {
        enabled = false,
      },
      signature = {
        enabled = false,
      },
      message = {
        enabled = true,
      },
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
        filter = { event = "notify", find = "No information available" },
        opts = { skip = true },
      },
    },
  },
  dependencies = {
    "MunifTanjim/nui.nvim",
    {
      "rcarriga/nvim-notify",
      keys = {
        {
          '<Esc>',
          function()
            local esc_key = vim.api.nvim_replace_termcodes("<Esc>", true, false, true)
            vim.api.nvim_feedkeys(esc_key, "n", false)

            -- this closes the notification
            for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
              if vim.api.nvim_get_option_value('filetype', {
                    buf = bufnr
                  }) == 'notify' and vim.api.nvim_buf_is_loaded(bufnr) then
                vim.api.nvim_win_close(vim.fn.bufwinid(bufnr), false)
              end
            end
          end,
          mode = { "n", "v" }
        }
      },
      opts = {
        fps = 60,
        icons = {
          DEBUG = " ",
          ERROR = " ",
          INFO = " ",
          TRACE = "✎ ",
          WARN = " "
        },
        render = "default",
        stages = "fade_in_slide_out",
        minimum_width = 30,
        max_width = 30,
        top_down = false,
      },
    },
  },
  config = function(_, opts)
    require("notify").setup({
      background_colour = "#000000",
    })

    require("noice").setup(opts)
    vim.cmd 'highlight NotifyINFOBorder guifg=#334de6'
    vim.cmd 'highlight NotifyINFOTitle  guifg=#3380e6'
    vim.cmd 'highlight NotifyINFOIcon   guifg=#3380e6'
  end
}
