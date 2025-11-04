local normal_hl = vim.api.nvim_get_hl(0, { name = 'Normal' })
local darker = Dark_a_color(normal_hl.bg, 6)

vim.api.nvim_set_hl(0, 'TreesitterContext', { bg = darker })
vim.api.nvim_set_hl(0, 'TreesitterContextLineNumber', { bg = darker })

vim.api.nvim_set_hl(0, 'WinBar', { bg = darker })

-- transparent background
-- vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
vim.api.nvim_set_hl(0, 'NormalFloat', { bg = darker })
vim.api.nvim_set_hl(0, 'FloatBorder', { bg = darker })
vim.api.nvim_set_hl(0, 'WinSeparator', { bg = darker, fg = darker })
vim.api.nvim_set_hl(0, 'Pmenu', { bg = 'none' })
vim.api.nvim_set_hl(0, 'Terminal', { bg = 'none' })
vim.api.nvim_set_hl(0, 'EndOfBuffer', { bg = 'none' })
vim.api.nvim_set_hl(0, 'FoldColumn', { bg = 'none' })
vim.api.nvim_set_hl(0, 'Folded', { bg = 'none' })
vim.api.nvim_set_hl(0, 'SignColumn', { bg = 'none' })
vim.api.nvim_set_hl(0, 'NormalNC', { bg = 'none' })
vim.api.nvim_set_hl(0, 'WhichKeyFloat', { bg = 'none' })
vim.api.nvim_set_hl(0, 'TelescopeBorder', { bg = 'none' })
vim.api.nvim_set_hl(0, 'TelescopeNormal', { bg = 'none' })
vim.api.nvim_set_hl(0, 'SnacksPickerInputBorder', { bg = 'none' })
vim.api.nvim_set_hl(0, 'TelescopePromptBorder', { bg = 'none' })
vim.api.nvim_set_hl(0, 'TelescopePromptTitle', { bg = 'none' })
-- vim.api.nvim_set_hl(0, 'TreesitterContextBottom', { underline = true, sp = 'gray' })

-- TreesitterContext = { bg = 'none' },
-- TreesitterContextLineNumber = { bg = 'none' }
