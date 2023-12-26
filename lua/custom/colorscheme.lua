-- local colorscheme = "evening"
-- local colorscheme = "base16-windows-highcontrast"
local colorscheme = "neobones"
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
	print("colorscheme " .. colorscheme .. " not found.")
end
