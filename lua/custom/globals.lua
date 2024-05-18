P = function(v)
  print(vim.inspect(v))
  return v
end

LAZY_PLUGIN_SPEC = {}
pon = true
poff = false

-- Função para alternar "true" para "false" e vice-versa
function ToggleTrueFalse()
  -- Pega a linha atual
  local line = vim.api.nvim_get_current_line()
  -- Alterna "true" para "false" e vice-versa
  local new_line = line
    :gsub('true', 'TOGGLE_PLACEHOLDER')
    :gsub('false', 'true')
    :gsub('TOGGLE_PLACEHOLDER', 'false')
  -- Define a linha atual com o novo valor
  vim.api.nvim_set_current_line(new_line)
end

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
--- @param color integer
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
  local string_hl = vim.api.nvim_get_hl(0, { name = src, create = false })
  vim.api.nvim_set_hl(0, dest, {
    fg = FormatColor(string_hl.fg),
    bg = FormatColor(string_hl.bg),
    bold = string_hl.bold,
    italic = string_hl.italic,
  })
end

Symbols = {
  diagnostics = {
    Error = '󱎶 ',
    Warn = '󰂚 ',
    Hint = ' ',
    Info = '󰓹 ',
  },
  changes = {
    Added = ' ',
    Removed = ' ',
    Modified = '󰜥 ',
  },
  telescope = {
    prompt_prefix = ' ',
    selection_caret = '󰜴 ',
  },
}

function Highlight_word(word, color)
  local group_name = 'Highlight' .. word
  vim.cmd(string.format('highlight %s guifg=%s', group_name, color))
  vim.cmd(string.format('syntax match %s /\\<%s\\>/', group_name, word))
end
