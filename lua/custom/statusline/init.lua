-- require("custom.statusline.highlights")
require("custom.statusline.themes.tokyo-night")

local statusline_time = require("custom.statusline.time")
local git = require("custom.statusline.git")
local filetype_to_extension = require("custom.statusline.filetypes")
local extension_to_icon = require("custom.statusline.icon_by_file_extension")

statusline_time.setup()

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

function Statusline.branch()
  local branch = git.get_branch()
  if branch == "" then
    return ""
  end
  return string.format("  %s ", branch)
end

function Statusline.mode()
  local current_mode = vim.api.nvim_get_mode().mode
  return string.format(" %s ", modes[current_mode]):upper()
end

function Statusline.filename()
  local extension = filetype_to_extension[vim.bo.filetype]
  if extension ~= nil then
    local icon_t = extension_to_icon[extension]
    local icon = ""
    if icon_t ~= nil then
      icon = icon_t.icon
    end
    return string.format(" %s %%f ", icon)
  end
  return " %f "
end


function Statusline.percentage()
  return " %#StatuslineMode# %p%% "
end

function Statusline.inactive()
  return Statusline.filename()
end

function Statusline.accent()
  return "%#StatuslineMode#"
end

function Statusline.time()
  local hour = tonumber(os.date("%H"))
  local icon = ""
  local color = ""
  if hour >= 6 and hour < 10 then
    icon = ""
    color = "%#IconSun#"
  elseif hour >= 10 and hour < 17 then
    icon = ""
    color = "%#IconSun#"
  elseif hour >= 17 and hour < 19 then
    icon = ""
    color = "%#IconSunset#"
  else
    icon = ""
    color = "%#IconMoon#"
  end
  icon = color .. icon .. "%#StatuslineMode#"
  return string.format("󰥔 %s %s  ", statusline_time.get_time(), icon)
end

function Statusline.right()
  return table.concat({
    "%#StatuslineSeparator#",
    "",
    "%#StatuslineMode#",
    " ",
    Statusline.time()
  })
end

function Statusline.left()
  return table.concat({
    "%#StatuslineMode#",
    Statusline.mode(),
    "%#IconBranch#",
    Statusline.branch(),
    "%#StatuslineSeparator#",
    "",
    "%#Statusline#",
  })
end

function Statusline.center()
  return table.concat({
    " %= ",
    Statusline.filename(),
    " %= ",
  })
end


function Statusline.active()
  return table.concat({
    Statusline.left(),
    Statusline.center(),
    Statusline.right()
  })
end

function Statusline.setup()

  vim.api.nvim_create_autocmd({ "WinEnter", "BufEnter", "TermLeave", "TermClose" }, {
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
