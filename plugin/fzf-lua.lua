vim.pack.add({
	Gh("ibhagwan/fzf-lua"),
})

local fzf = require("fzf-lua")

---@module "fzf-lua"
---@type fzf-lua.Config|{}
---@diagnostic disable: missing-fields
fzf.setup({
	"ivy",
	ui_select = function(fzf_opts, items)
		---@type fzf-lua.Config
		local select_opts = {
			winopts = {
				fullscreen = false,
        border = "single",
        row = 0.5,
        col = 0.5,
        height = 20,
        width = 100,
			},
		}

		return vim.tbl_deep_extend("force", fzf_opts, select_opts)
	end,
})
