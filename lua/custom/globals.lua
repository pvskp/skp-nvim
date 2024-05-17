P = function(v)
  print(vim.inspect(v))
  return v
end

LAZY_PLUGIN_SPEC = {}
pon = true
poff = false

--- Adds a plugin to the LazySpec
--- @param active boolean
--- @param plugin_relative_path string
--- @usage spec(true, "colorschemes.catppuccin")
--- @return nil
spec = function(active, plugin_relative_path)
  if active == false then
    return
  end
  local plugins = 'custom.plugins.'
  table.insert(LAZY_PLUGIN_SPEC, { import = plugins .. plugin_relative_path })
end

--- Formats a color code into hex
--- @param color string
--- @return string | nil
function FormatColor(color)
  if not color then
    return nil
  end
  return string.format('#%06x', color)
end

--- Copies highlight from src to dest
--- @param src any
--- @param dest any
--- @return nil
function CopyHighlight(src, dest)
  local string_hl = vim.api.nvim_get_hl_by_name(src, true)
  vim.api.nvim_set_hl(0, dest, {
    fg = FormatColor(string_hl.foreground),
    bg = FormatColor(string_hl.background),
    bold = string_hl.bold,
    italic = string_hl.italic,
  })
end

Symbols = {
  diagnostics = {
    Error = '󱎶 ',
    Warn = ' ',
    Hint = '',
    Info = '󰓹 ',
  },
  changes = {
    Added = ' ',
    Removed = ' ',
    Modified = '󰜥 ',
  },
  telescope = {
    prompt_prefix = '󰁔 ',
    selection_caret = '󰃚 ',
  },
}

function Highlight_word(word, color)
  local group_name = 'Highlight' .. word
  vim.cmd(string.format('highlight %s guifg=%s', group_name, color))
  vim.cmd(string.format('syntax match %s /\\<%s\\>/', group_name, word))
end
