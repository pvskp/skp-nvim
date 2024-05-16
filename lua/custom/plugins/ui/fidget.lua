return {
  'j-hui/fidget.nvim',
  -- lazy = false,
  event = 'LspAttach',
  opts = {
    notification = {
      window = {
        winblend = 0, -- Background color opacity in the notification window
      },
    },
  },
}
