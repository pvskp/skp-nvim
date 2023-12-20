return {}
-- return {
-- 	"ggandor/leap.nvim",
-- 	lazy = false,
-- 	priority = 1000,
-- 	init = function()
-- 		local group = vim.api.nvim_create_augroup("LeapColorScheme", { clear = true })
-- 		vim.api.nvim_create_autocmd("ColorScheme", {
-- 			group = group,
-- 			pattern = "*",
-- 			callback = function()
-- 				require("leap").init_highlight(true)
-- 			end,
-- 		})

-- 		vim.keymap.set("n", "s", "<Plug>(leap-forward-to)")
-- 		vim.keymap.set("n", "S", "<Plug>(leap-backward-to)")
-- 	end,
-- }
