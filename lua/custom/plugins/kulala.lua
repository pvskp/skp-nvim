---@module "lazy"
---@type LazyPluginSpec
return {
  'mistweaverco/kulala.nvim',
  ft = { 'http', 'rest' },
  opts = {
    global_keymaps = true,
    global_keymaps_prefix = '',
    kulala_keymaps_prefix = '',
  },
}
