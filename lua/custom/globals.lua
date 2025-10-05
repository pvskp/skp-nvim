P = function(v)
  print(vim.inspect(v))
  return v
end

LAZY_PLUGIN_SPEC = {}

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

--- Set the highlight colors for a highlight group
---@param hl_group_name string
---@param colors table
function set_hl(hl_group_name, colors)
  vim.api.nvim_set_hl(0, hl_group_name, colors)
end

function ToggleTrueFalse()
  local line = vim.api.nvim_get_current_line()
  local new_line = line:gsub('true', 'TOGGLE_PLACEHOLDER'):gsub('false', 'true'):gsub('TOGGLE_PLACEHOLDER', 'false')
  vim.api.nvim_set_current_line(new_line)
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
  return tonumber('0x' .. hex:sub(1, 2)), tonumber('0x' .. hex:sub(3, 4)), tonumber('0x' .. hex:sub(5, 6))
end

-- Função para converter um valor RGB para hexadecimal
local function rgb_to_hex(r, g, b)
  return string.format('#%02x%02x%02x', r, g, b)
end

-- Função para clarear uma cor
function Lighten_color(hex, factor)
  if hex == nil then
    vim.notify('Hex is nil')
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

--- Get the attributes from a highlight group recursively through links
---@param hl_name string
function Get_hl_through_links(hl_name)
  local hl = vim.api.nvim_get_hl(0, { name = hl_name })
  while hl.link ~= nil do
    hl = vim.api.nvim_get_hl(0, { name = hl.link })
  end
  return hl
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

function Dark_a_color(original_color, step)
  -- O valor de 256^2 (65536) e 256 são usados nas conversões.
  local BASE_QUAD = 65536 -- 256 * 256
  local BASE_SIMPLES = 256

  -- 1. CONVERTER DECIMAL PARA RGB

  -- O 'math.floor' garante que pegamos apenas a parte inteira (o valor do componente).
  local R = math.floor(original_color / BASE_QUAD)
  local rest = original_color % BASE_QUAD

  local G = math.floor(rest / BASE_SIMPLES)
  local B = rest % BASE_SIMPLES

  -- Print opcional para ver o RGB antes de escurecer
  -- print(string.format("RGB Original: (%d, %d, %d)", R, G, B))

  -- 2. ESCURECER (Diminuir R, G, B)

  -- Subtrai o passo e garante que o valor mínimo seja 0 (preto),
  -- pois uma cor não pode ter um valor negativo.
  local R_novo = math.max(0, R - step)
  local G_novo = math.max(0, G - step)
  local B_novo = math.max(0, B - step)

  -- Print opcional para ver o RGB depois de escurecer
  -- print(string.format("RGB Escurecido: (%d, %d, %d)", R_novo, G_novo, B_novo))

  -- 3. CONVERTER RGB DE VOLTA PARA DECIMAL

  local new_decimal = (R_novo * BASE_QUAD) + (G_novo * BASE_SIMPLES) + B_novo

  return new_decimal
end

Borders = define_borders('single') -- single / double / rounded
