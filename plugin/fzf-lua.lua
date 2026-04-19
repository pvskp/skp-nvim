vim.pack.add({
	Gh("ibhagwan/fzf-lua"),
})

---@module "fzf-lua"
---@type fzf-lua.Config|{}
---@diagnostic disable: missing-fields
require("fzf-lua").setup({ "ivy" })
