local key = vim.keymap.set

local opts = { silent = true, noremap = false }

key("n", "<Space>", "<Nop>", { silent = true, remap = false })
vim.g.mapleader = " "
vim.g.maplocalleader = " "
-- key("n", "<C-e>", vim.cmd.Ex)

key("n", "<C-e>", ":Explore! 15<CR>", { silent = true, noremap = true })

key("n", "<leader>h", ":noh<CR>")

key({ "n", "v" }, ";", "g_")
key({ "n", "v" }, ",", "_")

-- Copy line starting on cursor position
key("n", "Y", "v$y")
key("i", "<C-c>", "<Esc>")

-- this one is a life saver (avoid nvim messing with your registers)
key("v", "p", '"_dP')

-- Move between buffers
key("n", "<S-l>", ":bnext<CR>", opts)
key("n", "<S-h>", ":bprevious<CR>", opts)

-- Find mode
key("n", "<leader>f", ":find *")

function Search_in_directory()
	local ok, pattern = pcall(vim.fn.input, "Enter search pattern: ")
	if ok and pattern ~= "" then
		vim.cmd("silent! grep! " .. pattern .. " * 2> /dev/null")
		vim.cmd("copen")
	end
end

vim.api.nvim_set_keymap("n", "<leader>g", ":lua Search_in_directory()<CR>", { noremap = true, silent = true })

-- Split
key("n", "<M-j>", "<C-w>j")
key("n", "<M-k>", "<C-w>k")
key("n", "<M-l>", "<C-w>l")
key("n", "<M-h>", "<C-w>h")

function Exit_interactive_resize()
	local keymap = vim.api.nvim_del_keymap
	-- Remover mapeamentos temporários
	keymap("n", "k")
	keymap("n", "j")
	keymap("n", "h")
	keymap("n", "l")
	keymap("n", "<C-c>")
	keymap("n", "q")
end

function Interactive_resize()
	local keymap = vim.api.nvim_set_keymap
	local interactive_resize_opts = { noremap = true }

	keymap("n", "k", ":resize -2<CR>", interactive_resize_opts)
	keymap("n", "j", ":resize +2<CR>", interactive_resize_opts)
	keymap("n", "l", ":vertical resize -2<CR>", interactive_resize_opts)
	keymap("n", "h", ":vertical resize +2<CR>", interactive_resize_opts)

	keymap("n", "<C-c>", "<cmd>lua Exit_interactive_resize()<CR>", interactive_resize_opts)
	keymap("n", "q", "<cmd>lua Exit_interactive_resize()<CR>", interactive_resize_opts)
end

vim.api.nvim_set_keymap("n", "<M-r>", "<cmd>lua Interactive_resize()<CR>", { noremap = true, silent = true })

key("n", "<M-=>", "<C-w>=")
key("n", "<C-s>", ":w<CR>", opts)
key("n", "<M-f>", ":term<CR>")
key("n", "Q", ":bd!<CR>", { silent = true })
key("n", "<C-q>", ":qa!<CR>", { silent = true })

key("v", "J", ":m '>+1<CR>gv=gv")
key("v", "K", ":m '<-2<CR>gv=gv")

key("v", ">", ">gv")
key("v", "<", "<gv")

--- LSP
key("n", "gl", vim.diagnostic.open_float)
key("n", "[d", vim.diagnostic.goto_prev)
key("n", "]d", vim.diagnostic.goto_next)
key("n", "<space>q", vim.diagnostic.setloclist)

-- Tab
key("n", "<M-a>c", function()
	vim.cmd("tabnew")
	vim.cmd("term")
end)
key("n", "<M-1>", "1gt")
key("n", "<M-2>", "2gt")
key("n", "<M-3>", "3gt")
key("n", "<M-4>", "4gt")
key("n", "<M-5>", "5gt")
key("n", "<M-6>", "6gt")
key("n", "<M-7>", "7gt")
key("n", "<M-8>", "8gt")
key("n", "<M-9>", "9gt")

-- Terminal mode
key("t", "<M-a>", "<C-\\><C-n>")
key("t", "<M-j>", "<C-\\><C-n><C-w>j", { silent = true })
key("t", "<M-k>", "<C-\\><C-n><C-w>k", { silent = true })
key("t", "<M-l>", "<C-\\><C-n><C-w>l", { silent = true })
key("t", "<M-h>", "<C-\\><C-n><C-w>h", { silent = true })

-- Copy all file
key("n", "<C-y>", ":%y+<CR>", { silent = true })

-- Window zoom
local window_zoomed = false
local window_zoom_restore = {}

local function toggle_zoom()
	if window_zoomed then
		-- Restaurar a janela
		vim.cmd(window_zoom_restore.cmd)
		window_zoomed = false
	else
		-- Armazenar o estado da janela atual
		window_zoom_restore = {
			cmd = "resize " .. vim.api.nvim_win_get_height(0) .. "|vertical resize " .. vim.api.nvim_win_get_width(0),
			win = vim.api.nvim_get_current_win(),
		}
		-- Maximizar a janela
		vim.cmd("resize | vertical resize")
		window_zoomed = true
	end
end

key("n", "<M-z>", toggle_zoom, { silent = true })
key("t", "<M-z>", function()
	vim.cmd("stopinsert")
	vim.defer_fn(function()
		toggle_zoom()
		vim.cmd("startinsert")
	end, 10)
end, { silent = true })

-- Execute last cmmand
key("n", "<leader>x", "@:", opts)

-- Source current file
key("n", "<leader>s", ":w<CR>:source %<CR>", opts)

-- -- Open file under cursor on terminal
-- local terminal_cwd = vim.fn.getcwd()
-- function Open_file_under_cursor()
--     local filename = vim.fn.expand('<cfile>')
--     if filename ~= '' then
--         if not filename:match('^/') then
--             filename = terminal_cwd .. '/' .. filename
--         end
--         vim.cmd('vsplit ' .. vim.fn.fnameescape(filename))
--         vim.cmd('stopinsert')
--     end
-- end

-- vim.api.nvim_set_keymap(
--     'n',
--     '<C-x>',
--     '<cmd>lua Open_file_under_cursor()<CR>',
--     {
--         noremap = true,
--         silent = true
--     }
-- )
