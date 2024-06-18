return {
  "folke/edgy.nvim",
  event = "VeryLazy",
  dependencies = { "folke/trouble.nvim" },
  keys = {
    {
      "<leader>e", function()
      require("edgy").toggle("right")
    end
    }
  },
  init = function()
    vim.opt.laststatus = 3
    vim.opt.splitkeep = "screen"
  end,
  opts = {
    animate = {
      enabled = true,
      fps = 100, -- frames per second
      cps = 120, -- cells per second
      on_begin = function()
        vim.g.minianimate_disable = true
      end,
      on_end = function()
        vim.g.minianimate_disable = false
      end,
    },

    right = {
      {
        ft = "trouble",
        pinned = true,
        title = "Sidebar",
        filter = function(_buf, win)
          if vim.w[win].trouble then
            return vim.w[win].trouble.mode == "symbols"
          end
          return false
        end,
        open = "Trouble symbols position=left focus=false filter.buf=0",
        size = {
          height = 0.6,
          width = 0.2
        },
      },
      {
        ft = "trouble",
        pinned = true,
        title = "Troubles",
        filter = function(_buf, win)
          if vim.w[win].trouble then
            return vim.w[win].trouble.mode == "diagnostics"
          end
          return false
        end,
        open = "Trouble diagnostics focus=false filter.severity=vim.diagnostic.severity.ERROR",
        size = {
          height = 0.4
        },
      },
    },
  },
}
