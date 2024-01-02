local keymap = vim.keymap.set

local opts = { silent = true, noremap = false }

keymap("n", "<Space>", "<Nop>", { silent = true, remap = false })
vim.g.mapleader = " "
vim.g.maplocalleader = " "
-- key("n", "<C-e>", vim.cmd.Ex)

keymap("n", "<C-e>", ":Explore! 15<CR>", { silent = true, noremap = true })

keymap("n", "<leader>h", ":noh<CR>")

-- Copy line starting on cursor position
keymap("n", "Y", "v$y")
keymap({ "c", "i", "n" }, "<C-c>", "<Esc>")

-- Go to the end of line
keymap({ "n", "v" }, "<leader><leader>", "g_")

-- this one is a life saver (avoid nvim messing with your registers)
keymap("v", "p", '"_dP')

-- Move between buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Find mode
keymap("n", "<leader>f", ":find *")

function Search_in_directory()
	local ok, pattern = pcall(vim.fn.input, "Enter search pattern: ")
	if ok and pattern ~= "" then
		vim.cmd("silent! grep! " .. pattern .. " * 2> /dev/null")
		vim.cmd("copen")
	end
end

vim.api.nvim_set_keymap("n", "<leader>g", ":lua Search_in_directory()<CR>", { noremap = true, silent = true })

-- Split
keymap("n", "<M-j>", "<C-w>j")
keymap("n", "<M-k>", "<C-w>k")
keymap("n", "<M-l>", "<C-w>l")
keymap("n", "<M-h>", "<C-w>h")

function Exit_interactive_resize()
	local keymap_del = vim.api.nvim_del_keymap
	-- Remover mapeamentos temporários
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

vim.api.nvim_set_keymap("n", "<M-r>", "<cmd>lua Interactive_resize()<CR>", { noremap = true, silent = true })

keymap("n", "<M-=>", "<C-w>=")
keymap("n", "<C-s>", ":w<CR>", opts)
keymap("n", "<M-f>", ":term<CR>")
keymap("n", "Q", ":bd!<CR>", { silent = true })
keymap("n", "<C-q>", ":qa!<CR>", { silent = true })

keymap("v", "J", ":m '>+1<CR>gv=gv")
keymap("v", "K", ":m '<-2<CR>gv=gv")

keymap("v", ">", ">gv")
keymap("v", "<", "<gv")

--- LSP
keymap("n", "gl", vim.diagnostic.open_float)
keymap("n", "[d", vim.diagnostic.goto_prev)
keymap("n", "]d", vim.diagnostic.goto_next)
keymap("n", "<space>q", vim.diagnostic.setloclist)

-- Tab
keymap("n", "<M-a>c", function()
	vim.cmd("tabnew")
	vim.cmd("term")
end)
keymap("n", "<M-1>", "1gt")
keymap("n", "<M-2>", "2gt")
keymap("n", "<M-3>", "3gt")
keymap("n", "<M-4>", "4gt")
keymap("n", "<M-5>", "5gt")
keymap("n", "<M-6>", "6gt")
keymap("n", "<M-7>", "7gt")
keymap("n", "<M-8>", "8gt")
keymap("n", "<M-9>", "9gt")

-- Terminal mode
keymap("t", "<M-a>", "<C-\\><C-n>")
keymap("t", "<M-j>", "<C-\\><C-n><C-w>j", { silent = true })
keymap("t", "<M-k>", "<C-\\><C-n><C-w>k", { silent = true })
keymap("t", "<M-l>", "<C-\\><C-n><C-w>l", { silent = true })
keymap("t", "<M-h>", "<C-\\><C-n><C-w>h", { silent = true })

-- Copy all file
keymap("n", "<C-y>", ":%y+<CR>", { silent = true })

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

keymap("n", "<M-z>", toggle_zoom, { silent = true })
keymap("t", "<M-z>", function()
	vim.cmd("stopinsert")
	vim.defer_fn(function()
		toggle_zoom()
		vim.cmd("startinsert")
	end, 10)
end, { silent = true })

-- Execute last cmmand
keymap("n", "<leader>x", "@:", opts)

-- Source current file
keymap("n", "<leader>s", ":w<CR>:source %<CR>", opts)

-- Command mode
vim.api.nvim_set_keymap("c", "<C-x>", "<C-y>", { noremap = true })

local fold_close = function()
	pcall(vim.cmd.foldclose)
end

local fold_open = function()
	pcall(vim.cmd.foldopen)
end

-- fold
keymap("n", "-", fold_close, {})
keymap("n", "=", fold_open, {})
