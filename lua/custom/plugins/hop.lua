return {
	"smoka7/hop.nvim",
	lazy = false,
	version = "*",
	opts = {},
	init = function()
		require("hop")
		vim.keymap.set("", "s", ":HopChar1<CR>", { silent = true })
	end,
}
