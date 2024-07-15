return {
  "mistricky/codesnap.nvim",
  build = "make",
  version = "*",
  cmd = { "CodeSnap", "CodeSnapASCII" },
  keys = {
    { "<leader>k", "<cmd>CodeSnapASCII<cr>", mode = "x", desc = "Save selected code snapshot into clipboard" },
  },
  opts = {
    save_path = "~/Pictures/codesnap/",
    has_breadcrumbs = true,
    code_font_family = "JetBrainsMono Nerd Font",
    bg_theme = "grape",
    watermark = "",
    has_line_number = true,
  },
}
