local function dark_highlight()

end

local function light_highlight()

end

if vim.cmd.colorscheme() == "default" then
  if vim.opt.background._value == "dark" then
    dark_highlight()
  else
    light_highlight()
  end
end
