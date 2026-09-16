-- vim.pack.add({ Gh("afonsofrancof/OSC11.nvim") })

-- require("osc11").setup({
-- 	-- Function to call when switching to dark theme
-- 	on_dark = function()
-- 		vim.o.background = "dark"
-- 		vim.cmd.colorscheme("catppuccin")
-- 	end,
-- 	-- Function to call when switching to light theme
-- 	on_light = function()
-- 		vim.o.background = "light"
-- 		vim.cmd.colorscheme("catppuccin")
-- 	end,
-- })

-- vim.cmd.colorscheme("retrobox")

vim.pack.add({
  Gh("folke/tokyonight.nvim"),
  Gh("EdenEast/nightfox.nvim"),
})

local function tokyonight(scheme)
  require("tokyonight").setup({
    transparent = true, -- Enable this to disable setting the background color
  })

  vim.cmd.colorscheme(scheme or "tokyonight")
end

local function nightfox(scheme)
  require("nightfox").setup({
    -- transparent = true, -- Enable this to disable setting the background color
  })

  vim.cmd.colorscheme(scheme or "duskfox")

  vim.api.nvim_set_hl(0, "FloatBorder", {
    fg = Bg("NormalFloat"),
    bg = Bg("NormalFloat")
  })

  vim.api.nvim_set_hl(0, "FloatTitle", {
    fg = Fg("FloatTitle"),
    bg = Bg("NormalFloat")
  })

  vim.api.nvim_set_hl(0, "MiniFilesTitle", {
    fg = Fg("FloatTitle"),
    bg = Bg("NormalFloat")
  })

  vim.api.nvim_set_hl(0, "MiniFilesBorderModified", {
    fg = Fg("MiniFilesBorder"),
    bg = Bg("MiniFilesBorder")
  })

  vim.api.nvim_set_hl(0, "MiniFilesTitleFocused", {
    fg = Fg("NvimString"),
    bg = Bg("NormalFloat"),
    bold = true,
  })

  vim.api.nvim_set_hl(0, "TreesitterContextLineNumber", {
    fg = Fg("FloatTitle"),
    bg = Bg("NormalFloat")
  })
end

-- Esquema vem do themeswitcher: themes/<tema>/nvim/theme.lua é copiado para
-- current/nvim/theme.lua e chega aqui pelo symlink ~/.config/nvim/lua/theme.lua.
-- Fallback para quando o arquivo não existe (ex.: máquina sem o switcher).
local ok, theme = pcall(require, "theme")
if not ok then
  theme = { scheme = "duskfox", background = "dark" }
end

vim.o.background = theme.background or "dark"

local scheme = theme.scheme or "duskfox"
if scheme:match("^tokyonight") then
  tokyonight(scheme)
else
  nightfox(scheme)
end

vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    local hl = "DiagnosticUnderlineWarn"
    vim.api.nvim_set_hl(0, hl, {
      fg = Fg(hl),
      underline = false,
      undercurl = true,
    })

    hl = "DiagnosticUnderlineError"
    vim.api.nvim_set_hl(0, hl, {
      fg = Fg(hl),
      underline = false,
      undercurl = true,
    })
  end,
})

vim.api.nvim_create_autocmd("OptionSet", {
  pattern = "background",
  -- once = true,
  callback = function()
    -- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })

    local hl = "Title"
    vim.api.nvim_set_hl(0, hl, { fg = Fg(hl), bold = true })
    vim.api.nvim_set_hl(0, "FloatBorder", { fg = Bg("NormalFloat"), bg = Bg("NormalFloat") })

    vim.api.nvim_set_hl(0, "MiniFilesTitle", {
      fg = Fg("Title"),
      bg = Bg("NormalFloat"),
      bold = true,
    })

    hl = "VertSplit"
    vim.api.nvim_set_hl(0, hl, {
      fg = Fg("StatusLineNC"),
      bg = nil,
    })

    hl = "SignColumn"
    vim.api.nvim_set_hl(0, hl, {
      fg = Fg(hl),
      bg = "none",
    })

    hl = "FoldColumn"
    vim.api.nvim_set_hl(0, hl, {
      fg = Fg(hl),
      bg = "none",
    })

    hl = "CursorLineNr"
    vim.api.nvim_set_hl(0, hl, {
      fg = Fg(hl),
      bg = "none",
    })

    hl = "CursorLineSign"
    vim.api.nvim_set_hl(0, hl, {
      fg = "none",
      bg = "none",
    })

    hl = "CursorLineFold"
    vim.api.nvim_set_hl(0, hl, {
      fg = "none",
      bg = "none",
    })

    -- hl = "DiagnosticUnderlineWarn"
    -- vim.api.nvim_set_hl(0, hl, {
    -- 	underline = false,
    -- 	undercurl = true,
    -- })

    vim.api.nvim_set_hl(0, "MiniFilesTitleFocused", {
      fg = Fg("NvimString"),
      bg = Bg("NormalFloat"),
      bold = true,
    })

    vim.api.nvim_set_hl(0, "SpellBad", {
      fg = "#cdd6f4",
      bg = "#89556b",
    })

    vim.api.nvim_set_hl(0, "@string.special.url", {
      link = "Directory",
    })
  end,
})
