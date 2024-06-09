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
      icon = '  ',
      color = '#e6cc80',
    },
    selection_caret = {
      icon = ' 󱈛 ',
      color = '#3399e7',
    },
  },
  lualine = {
    branch = '',
  },
}

USE_DEVICONS = true

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
