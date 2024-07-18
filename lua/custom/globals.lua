P = function(v)
  print(vim.inspect(v))
  return v
end

LAZY_PLUGIN_SPEC = {}

function ToggleTrueFalse()
  local line = vim.api.nvim_get_current_line()
  local new_line = line
      :gsub('true', 'TOGGLE_PLACEHOLDER')
      :gsub('false', 'true')
      :gsub('TOGGLE_PLACEHOLDER', 'false')
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
    Error = ' ',
    Warn = ' ',
    Hint = ' ',
    Info = ' ',
  },
  changes = {
    Added = ' ',
    Removed = ' ',
    Modified = '󰜥 ',
  },
  telescope = {
    prompt_prefix = {
      -- icon = '  ',
      icon = ' ',
      -- color = '#e6cc80',
    },
    selection_caret = {
      -- icon = ' 󱈛 ',
      icon = ' ',
      -- icon = '  ',
      -- color = 'Orange',
    },
  },
  lualine = {
    branch = '',
  },
}

USE_DEVICONS = true

-- Função para converter um valor hexadecimal para RGB
local function hex_to_rgb(hex)
  hex = hex:gsub('#', '')
  return tonumber('0x' .. hex:sub(1, 2)),
      tonumber('0x' .. hex:sub(3, 4)),
      tonumber('0x' .. hex:sub(5, 6))
end

-- Função para converter um valor RGB para hexadecimal
local function rgb_to_hex(r, g, b)
  return string.format('#%02x%02x%02x', r, g, b)
end

-- Função para clarear uma cor
function Lighten_color(hex, factor)
  if hex == nil then
    vim.notify 'Hex is nil'
    return hex
  end
  factor = factor or 1.2 -- Define o fator padrão como 1.2 se não for especificado
  local r, g, b = hex_to_rgb(hex)
  r = math.min(255, math.floor(r * factor))
  g = math.min(255, math.floor(g * factor))
  b = math.min(255, math.floor(b * factor))
  vim.notify('Original hex: ' .. hex)
  vim.notify('Lightened hex: ' .. rgb_to_hex(r, g, b))
  return rgb_to_hex(r, g, b)
end

function Get_highlight_fg(name)
  local hl = vim.api.nvim_get_hl(0, { name = name, link = false })
  if hl and hl.fg then
    return string.format('#%06x', hl.fg)
  else
    return nil
  end
end

function Get_highlight_bg(name)
  local hl = vim.api.nvim_get_hl(0, { name = name, link = false })
  if hl and hl.bg then
    return string.format('#%06x', hl.bg)
  else
    return nil
  end
end

local function define_borders(border)
  local r = { simple = border }
  if border == 'single' then
    r.borderchars = { '─', '│', '─', '│', '┌', '┐', '┘', '└' }
    r.borderchars_alt = { '┌', '─', '┐', '│', '┘', '─', '└', '│' }
  elseif border == 'double' then
    r.borderchars = { '═', '║', '═', '║', '╔', '╗', '╝', '╚' }
    r.borderchars_alt = { '╔', '═', '╗', '║', '╝', '═', '╚', '║' }
  elseif border == 'rounded' then
    r.borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' }
    r.borderchars_alt = { '╭', '─', '╮', '│', '╯', '─', '╰', '│' }
  else
    r.borderchars = {}
    r.borderchars_alt = {}
  end
  return r
end

Borders = define_borders 'single' -- single / double / rounded
