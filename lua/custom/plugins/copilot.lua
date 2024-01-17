Copilot_started = 1
local copilot_toggle = function()
	if Copilot_started == 1 then
		Copilot_started = 0
		vim.cmd([[Copilot disable]])
		print("[Copilot] disabled")
		return
	end
	Copilot_started = 1
	vim.cmd([[Copilot enable]])
	print("[Copilot] enabled")
end

vim.keymap.set("n", "<leader>tc", copilot_toggle, {
	desc = "[T]oggle [C]opilot  ",
})

return {
	"zbirenbaum/copilot.lua",
	cmd = "Copilot",
	-- lazy = false,
	dependencies = {
		"zbirenbaum/copilot-cmp",
		-- cmd = "Copilot",
	},

	config = function()
		local copilot_lua = require("copilot")
		-- local copilot_cmp = require("copilot_cmp")

		copilot_lua.setup({
			suggestion = {
				enabled = true,
				auto_trigger = false,
				keymap = {
					-- accept = "<M-l>",
					accept = "<C-a>",
					accept_word = false,
					accept_line = false,
					next = "<Right>",
					prev = "<Left>",
					dismiss = "<C-c>",
				},
			},
			panel = { enabled = false },
			filetypes = {
				yaml = true,
				markdown = true,
				help = false,
				gitcommit = false,
				gitrebase = false,
				hgcommit = false,
				svn = false,
				cvs = false,
				["."] = false,
			},
		})
		-- copilot_cmp.setup()
	end,
}
