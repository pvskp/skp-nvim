vim.pack.add({
	Gh("ibhagwan/fzf-lua"),
})

local fzf = require("fzf-lua")

---@module "fzf-lua"
---@type fzf-lua.Config
---@diagnostic disable: missing-fields
fzf.setup({
	"ivy",
	fzf_colors = { true, },
  fzf_opts = { ['--gutter'] = ' ', },
	ui_select = function(fzf_opts, _)
		---@type fzf-lua.Config
		local select_opts = {
			winopts = {
				fullscreen = false,
				border = "single",
				title_pos = "center",
				backdrop = 60,
				row = 0.18,
				col = 0.5,
				width = 0.55,
				height = 0.55,
				preview = {
					hidden = true,
				},
			},
		}
		return vim.tbl_deep_extend("force", fzf_opts, select_opts)
	end,
})
