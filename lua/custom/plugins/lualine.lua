-- return {}
return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("lualine").setup({
			options = {
				icons_enabled = true,
				-- theme = "auto",
				theme = "ayu",
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
				disabled_filetypes = {
					statusline = {},
					winbar = {},
				},
				ignore_focus = {},
				always_divide_middle = true,
				globalstatus = false,
				refresh = {
					statusline = 1000,
					tabline = 1000,
					winbar = 1000,
				},
			},
			sections = {
				lualine_a = {
					{
						"mode",
						padding = 0,
						color = function()
							-- Get current mode
							-- get corresponding highlight group based on mode

							local hl = vim.api.nvim_get_hl
							local function return_hl_background(hlg_name)
								local group = hl(0, { name = hlg_name })
								if group.fg ~= nil then
									return (("#%06x"):format(group.bg))
								end

								return "None"
							end

							local mode_color = {
								n = return_hl_background("lualine_a_normal"),
								i = return_hl_background("lualine_a_insert"),
								v = return_hl_background("lualine_a_visual"),
								[""] = return_hl_background("lualine_a_visual"),
								V = return_hl_background("lualine_a_visual"),
								c = return_hl_background("lualine_a_command"),
								no = return_hl_background("lualine_a_normal"),
								s = return_hl_background("lualine_a_replace"),
								S = return_hl_background("lualine_a_replace"),
								[""] = return_hl_background("lualine_a_replace"),
								ic = return_hl_background("lualine_a_insert"),
								R = return_hl_background("lualine_a_replace"),
								Rv = return_hl_background("lualine_a_replace"),
								cv = return_hl_background("lualine_a_command"),
								ce = return_hl_background("lualine_a_command"),
								r = return_hl_background("lualine_a_replace"),
								rm = return_hl_background("lualine_a_replace"),
								["r?"] = return_hl_background("lualine_a_replace"),
								["!"] = return_hl_background("lualine_a_command"),
								t = return_hl_background("lualine_a_terminal"),
							}

							local statusline_bg = return_hl_background("StatusLineNC")

							return {
								fg = mode_color[vim.fn.mode()],
								bg = statusline_bg,
							}
						end,
						fmt = function(str)
							local mode_icon = {
								n = "",
								i = "󰲶",
								v = "󰌽",
								[""] = "󰌽",
								V = "󰌽",
								c = "",
								no = "󰌽",
								s = "󰌽",
								S = "󰌽",
								[""] = "󰌽",
								ic = "󰲶",
								R = "󰌽",
								Rv = "󰌽",
								cv = "",
								ce = "",
								r = "󰌽",
								rm = "󰌽",
								["r?"] = "󰌽",
								["!"] = "󰌽",
								t = "󰌽",
							}

							-- return "▊ " .. str .. " " .. mode_icon[vim.fn.mode()]
							return "█ " .. "󰻀"
						end,
					},
				},
				lualine_b = { { "branch", color = "StatusLineNC", icon = { " ", color = { fg = "#d699b6" } } } },
				lualine_c = {
					"%=",
					{ "filetype", icon_only = true },
					{ "filename" },
				},
				lualine_x = {
					"diff",
					{
						"diagnostics",
						padding = 0,
						fmt = function(str)
							return str .. " █"
						end,
					},
				},
				lualine_y = {},
				lualine_z = {
					-- "location",
				},
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				-- lualine_c = {'filename'},
				lualine_x = {
					"location",
				},
				lualine_y = { "progress" },
				lualine_z = {},
			},
			tabline = {},
			winbar = {},
			inactive_winbar = {},
			extensions = {},
		})
	end,
}
