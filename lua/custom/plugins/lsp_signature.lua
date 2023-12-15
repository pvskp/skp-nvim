return {
  "ray-x/lsp_signature.nvim",
  -- event = "VeryLazy",
  opts = {},
  config = function()
    local cfg = {
      hint_prefix = "🐼 ", -- Panda for parameter, NOTE: for the terminal not support emoji, might crash
      handler_opts = {
        border = "double", -- double, rounded, single, shadow, none, or a table of borders
      },
      transparency = nil, -- disabled by default, allow floating win transparent value 1~100
      shadow_blend = 0, -- if you using shadow as border use this set the opacity
    }
    require("lsp_signature").setup(cfg)
  end,
}
