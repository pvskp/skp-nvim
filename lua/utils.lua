--- Returns the 'plugin' formatted to use the Github URL
---
--- @param plugin string Plugin path to use (i.g., 'neovim/nvim-lspconfig')
--- @return string Parsed path, (i.g., 'https://github.com/neovim/nvim-lspconfig')
function Gh(plugin)
	return "https://github.com/"..plugin
end

--- Return the foreground color for the given highlight group
---
--- @param hl_name string The highlight group name
--- @return string The foreground value
function Fg(hl_name)
  local hl_info = vim.api.nvim_get_hl(0, {name = hl_name, link = false})
  if hl_info.fg == nil then
    return 'none'
  end
  return string.format('#%06x', hl_info.fg)
end

--- Return the background color for the given highlight group
---
--- @param hl_name string The highlight group name
--- @return string The background value
function Bg(hl_name)
  local hl_info = vim.api.nvim_get_hl(0, {name = hl_name, link = false})
  if hl_info.bg == nil then
    return 'none'
  end
  return string.format('#%06x', hl_info.bg)
end


Map = vim.keymap.set
