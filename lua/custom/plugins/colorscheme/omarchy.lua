local chunk, err = loadfile(vim.fn.expand('~/.config/omarchy/current/theme/neovim.lua'))

local function get_colorscheme()
  local new_table = {}
  if not err and chunk then
    local theme = chunk()

    if #theme == 1 then
      if theme[1].config then
        return theme
      end
      theme[1].opts.colorscheme()
      return {}
    end

    for index, value in ipairs(theme) do
      if value[1] ~= 'LazyVim/LazyVim' then
        new_table = value
        break
      end
    end

    for index, value in ipairs(theme) do
      if value[1] == 'LazyVim/LazyVim' then
        new_table.config = function()
          -- require(new_table.name).setup()
          if type(value.opts.colorscheme) == 'string' then
            vim.cmd.colorscheme(value.opts.colorscheme)
          else
            value[1].opts.colorscheme()
          end
        end
      end
    end
  end
  new_table.lazy = false
  return new_table
end

return get_colorscheme()
