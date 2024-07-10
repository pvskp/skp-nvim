local colors = {
  black        = 'Black',
  white        = 'NvimLightGray1',
  red          = 'Red',
  green        = 'NvimLightGreen',
  blue         = 'NvimLightBlue',
  yellow       = 'NvimLightMagenta',
  gray         = 'DarkGrey',
  darkgray     = 'NvimDarkGray2',
  lightgray    = 'NvimDarkGray3',
  inactivegray = 'NvimDarkGray4',
}

if vim.opt.background._value == "dark" then
  return {
    normal = {
      a = { bg = colors.green, fg = colors.black, gui = 'bold' },
      b = { bg = colors.darkgray, fg = colors.white },
      c = { bg = colors.lightgray, fg = colors.gray }
    },
    insert = {
      a = { bg = colors.blue, fg = colors.black, gui = 'bold' },
      b = { bg = colors.lightgray, fg = colors.white },
      c = { bg = colors.lightgray, fg = colors.white }
    },
    visual = {
      a = { bg = colors.yellow, fg = colors.black, gui = 'bold' },
      b = { bg = colors.darkgray, fg = colors.white },
      c = { bg = colors.inactivegray, fg = colors.black }
    },
    replace = {
      a = { bg = colors.red, fg = colors.black, gui = 'bold' },
      b = { bg = colors.darkgray, fg = colors.white },
      c = { bg = colors.black, fg = colors.white }
    },
    command = {
      a = { bg = colors.yellow, fg = colors.black, gui = 'bold' },
      b = { bg = colors.darkgray, fg = colors.white },
      c = { bg = colors.inactivegray, fg = colors.black }
    },
    inactive = {
      a = { bg = colors.inactivegray, fg = colors.gray },
      b = { bg = colors.inactivegray, fg = colors.gray },
      c = { bg = colors.inactivegray, fg = colors.gray }
    }
  }
end
