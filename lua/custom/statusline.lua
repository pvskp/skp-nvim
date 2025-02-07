---@diagnostic disable: param-type-mismatch
local modes = {
  ["n"] = "NORMAL",
  ["no"] = "NORMAL",
  ["v"] = "VISUAL",
  -- ["V"] = "VISUAL LINE",
  ["V"] = "VISUAL",
  [""] = "VISUAL BLOCK",
  ["s"] = "SELECT",
  ["S"] = "SELECT LINE",
  [""] = "SELECT BLOCK",
  ["i"] = "INSERT",
  ["ic"] = "INSERT",
  ["R"] = "REPLACE",
  ["Rv"] = "VISUAL REPLACE",
  ["c"] = "COMMAND",
  ["cv"] = "VIM EX",
  ["ce"] = "EX",
  ["r"] = "PROMPT",
  ["rm"] = "MOAR",
  ["r?"] = "CONFIRM",
  ["!"] = "SHELL",
  ["t"] = "TERMINAL",
}

Statusline = {}

Statusline.mode = function()
  local current_mode = vim.api.nvim_get_mode().mode
  return string.format("%%#StatuslineMode# %s %%#Statusline# ", modes[current_mode]):upper()
end

Statusline.filename = function()
  return " %f "
end

Statusline.percentage = function()
  return " %#StatuslineMode# %p%% "
end

Statusline.inactive = function()
  return Statusline.filename()
end

Statusline.active = function()
  local statusline = Statusline.mode()
  return table.concat({
    Statusline.mode(),
    Statusline.filename(),
    "%m %= ",
    Statusline.percentage(),
  })
end

vim.api.nvim_set_hl(0, "StatuslineMode", {
  bg = "white",
  fg = "black",
})

vim.api.nvim_set_hl(0, "Statusline", {
  bg = "black",
  fg = "white",
})


Statusline.setup = function()
  vim.api.nvim_create_autocmd({ "WinEnter", "BufEnter" }, {
    pattern = "*",
    command = "setlocal statusline=%!v:lua.Statusline.active()"
  })

  vim.api.nvim_create_autocmd({ "WinLeave", "BufLeave" }, {
    pattern = "*",
    command = "setlocal statusline=%!v:lua.Statusline.inactive()"
  })
  return Statusline.active()
end

vim.opt.laststatus = 2
vim.opt.statusline = "%!v:lua.Statusline.setup()"
