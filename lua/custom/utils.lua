--- Search_in_directory is used to search for a pattern in the current directory
function Search_in_directory()
	local ok, pattern = pcall(vim.fn.input, "Enter search pattern: ")
	if ok and pattern ~= "" then
		vim.cmd("silent! grep! " .. pattern .. " * 2> /dev/null")
		vim.cmd("copen")
	end
end

--- Exit_interactive_resize is used to exit the interactive resize mode
function Exit_interactive_resize()
	local keymap_del = vim.api.nvim_del_keymap
	keymap_del("n", "k")
	keymap_del("n", "j")
	keymap_del("n", "h")
	keymap_del("n", "l")
	keymap_del("n", "<C-c>")
	keymap_del("n", "q")
end

--- Interactive_resize is used to resize windows interactively
function Interactive_resize()
	local keymap_set = vim.api.nvim_set_keymap
	local interactive_resize_opts = { noremap = true }

	keymap_set("n", "k", ":resize -2<CR>", interactive_resize_opts)
	keymap_set("n", "j", ":resize +2<CR>", interactive_resize_opts)
	keymap_set("n", "l", ":vertical resize -2<CR>", interactive_resize_opts)
	keymap_set("n", "h", ":vertical resize +2<CR>", interactive_resize_opts)
	keymap_set("n", "<C-c>", "<cmd>lua Exit_interactive_resize()<CR>", interactive_resize_opts)
	keymap_set("n", "q", "<cmd>lua Exit_interactive_resize()<CR>", interactive_resize_opts)
end
