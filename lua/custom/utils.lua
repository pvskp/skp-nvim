function Search_in_directory()
	local ok, pattern = pcall(vim.fn.input, "Enter search pattern: ")
	if ok and pattern ~= "" then
		vim.cmd("silent! grep! " .. pattern .. " * 2> /dev/null")
		vim.cmd("copen")
	end
end

function Exit_interactive_resize()
	local keymap_del = vim.api.nvim_del_keymap
	keymap_del("n", "k")
	keymap_del("n", "j")
	keymap_del("n", "h")
	keymap_del("n", "l")
	keymap_del("n", "<C-c>")
	keymap_del("n", "q")
end

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

function TogglePonPoff()
	local row, col = unpack(vim.api.nvim_win_get_cursor(0))
	local line = vim.api.nvim_get_current_line()

	if line:find("poff") then
		line = line:gsub("poff", "pon")
	elseif line:find("pon") then
		line = line:gsub("pon", "poff")
	else
		return
	end

	vim.api.nvim_set_current_line(line)

	vim.api.nvim_win_set_cursor(0, { row, col })
end

function TogglePonPoffSelection()
	local start_line = vim.fn.line("'<")
	local end_line = vim.fn.line("'>")

	local lines = vim.api.nvim_buf_get_lines(0, start_line - 1, end_line, false)

	for i, line in ipairs(lines) do
		if line:find("poff") then
			lines[i] = line:gsub("poff", "pon")
		elseif line:find("pon") then
			lines[i] = line:gsub("pon", "poff")
		end
	end

	vim.api.nvim_buf_set_lines(0, start_line - 1, end_line, false, lines)
end
