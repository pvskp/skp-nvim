return {
  "ruifm/gitlinker.nvim",
  keys = {
    {
      '<leader>gY',
      '<cmd>lua require"gitlinker".get_repo_url()<cr>',
    },
    {
      '<leader>gB',
      '<cmd>lua require"gitlinker".get_repo_url({action_callback = require"gitlinker.actions".open_in_browser})<cr>',
    }
  },
  dependencies = {
    "nvim-lua/plenary.nvim"
  },
  config = function(_, _)
    require("gitlinker").setup(
      {
        callbacks = {
          ["gitlab.mostqi.com"] = function(url_data)
            local url = require "gitlinker.hosts".get_gitlab_type_url(url_data)
            url = string.gsub(url, "https://", "http://")
            return url
          end,
        }
      }
    )
  end
}
