return {
  'ray-x/lsp_signature.nvim',
  event = 'LspAttach',
  opts = {
    hint_prefix = "🐼 ", -- Panda for parameter
    always_trigger = true,
    toggle_key = "<C-x>",
    bind = true, -- This is mandatory, otherwise border config won't get registered.
    handler_opts = {
      border = Borders.simple
    }
  },
  config = function(_, opts)
    require("lsp_signature").setup(opts)
  end
}
