local theme = require('custom.plugins.current-theme.theme.neovim')
if #theme < 2 then
  if theme['opts'] ~= nil then
  elseif theme[1].opts ~= nil then
    if type(theme[1].opts.colorscheme) == 'string' then
      local colorscheme = theme[1].opts.colorscheme
      vim.cmd.colorscheme(colorscheme)
    elseif type(theme[1].opts.colorscheme) == 'function' then
      theme[1].opts.colorscheme()
    end
  end
else
  local t_row = theme[1]
  if theme[1][1] ~= 'LazyVim/LazyVim' then
    t_row = theme[2]
  end

  local colorscheme = t_row.opts.colorscheme
  vim.cmd.colorscheme(colorscheme)
end
