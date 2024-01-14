-- Key mappings for general functionality
local km = vim.keymap.set
local opts = { silent = true, noremap = false }

-- Leader key settings
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Disable space key
km("n", "<Space>", "<Nop>", { silent = true, remap = false })

-- File explorer
km("n", "<C-e>", ":Explore! 15<CR>", { silent = true, noremap = true })

-- Copy line from cursor position
km("n", "Y", "v$y")
km({ "c", "i", "n" }, "<C-c>", "<Esc>")

-- Movement key mappings
km({ "n", "v" }, "<leader><leader>", "g_")
km({ "n", "v" }, "<C-j>", "%")

-- Avoid messing with registers
km("v", "<leader>p", '"_dP')

-- Buffer navigation
km("n", "<S-l>", ":bnext<CR>", opts)
km("n", "<S-h>", ":bprevious<CR>", opts)

-- Find mode
km("n", "<leader>f", ":find *")

-- Search in directory
vim.api.nvim_set_keymap("n", "<leader>g", ":lua Search_in_directory()<CR>", { noremap = true, silent = true })

-- Window splitting
km("n", "<M-j>", "<C-w>j")
km("n", "<M-k>", "<C-w>k")
km("n", "<M-l>", "<C-w>l")
km("n", "<M-h>", "<C-w>h")

-- Resize window
vim.api.nvim_set_keymap("n", "<M-r>", "<cmd>lua Interactive_resize()<CR>", { noremap = true, silent = true })

km("n", "<M-=>", "<C-w>=")
km("n", "<C-s>", ":w<CR>", opts)
km("n", "<M-f>", ":term<CR>")
km("n", "Q", ":bd!<CR>", { silent = true })
km("n", "<C-q>", ":qa!<CR>", { silent = true })

-- Visual mode mappings
km("v", "<M-j>", ":m '>+1<CR>gv=gv")
km("v", "<M-k>", ":m '<-2<CR>gv=gv")
km("v", ">", ">gv")
km("v", "<", "<gv")

-- LSP (Language Server Protocol) mappings
km("n", "gl", vim.diagnostic.open_float)
km("n", "[d", vim.diagnostic.goto_prev)
km("n", "]d", vim.diagnostic.goto_next)
km("n", "<space>q", vim.diagnostic.setloclist)

-- Tab key mappings
km("n", "<M-a>c", function()
	vim.cmd("tabnew")
	vim.cmd("term")
end)
km("n", "<M-1>", "1gt")
km("n", "<M-2>", "2gt")
km("n", "<M-3>", "3gt")
km("n", "<M-4>", "4gt")
km("n", "<M-5>", "5gt")
km("n", "<M-6>", "6gt")
km("n", "<M-7>", "7gt")
km("n", "<M-8>", "8gt")
km("n", "<M-9>", "9gt")

-- Terminal mode mappings
km("t", "<M-a>", "<C-\\><C-n>")
km("t", "<M-j>", "<C-\\><C-n><C-w>j", { silent = true })
km("t", "<M-k>", "<C-\\><C-n><C-w>k", { silent = true })
km("t", "<M-l>", "<C-\\><C-n><C-w>l", { silent = true })
km("t", "<M-h>", "<C-\\><C-n><C-w>h", { silent = true })

-- Copy entire file
km("n", "<C-y>", ":%y+<CR>", { silent = true })

-- Window zoom
local window_zoomed = false
local window_zoom_restore = {}

local function toggle_zoom()
	if window_zoomed then
		-- Restore window
		vim.cmd(window_zoom_restore.cmd)
		window_zoomed = false
	else
		-- Store current window state
		window_zoom_restore = {
			cmd = "resize " .. vim.api.nvim_win_get_height(0) .. "|vertical resize " .. vim.api.nvim_win_get_width(0),
			win = vim.api.nvim_get_current_win(),
		}
		-- Maximize window
		vim.cmd("resize | vertical resize")
		window_zoomed = true
	end
end

km("n", "<M-z>", toggle_zoom, { silent = true })
km("t", "<M-z>", function()
	vim.cmd("stopinsert")
	vim.defer_fn(function()
		toggle_zoom()
		vim.cmd("startinsert")
	end, 10)
end, { silent = true })

-- Execute last command
km("n", "<leader>x", "@:", opts)

-- Command mode mappings
vim.api.nvim_set_keymap("c", "<C-x>", "<C-y>", { noremap = true })

-- Folding
km("n", "-", function()
	pcall(vim.cmd.foldclose)
end, {})
km("n", "=", function()
	pcall(vim.cmd.foldopen)
end, {})

-- Other remaps
km({ "n", "v" }, ".", ":")

-- Substitute word under cursor
vim.keymap.set("n", "<Leader>sw", ":%s/\\<<C-r><C-w>\\>/", {
	desc = "[S]ubstitute [W]ord under cursor",
})

-- Toggle plugin on and off
vim.api.nvim_set_keymap("n", "<C-t>", ":lua TogglePonPoff()<CR>", opts)
vim.api.nvim_set_keymap("v", "<C-t>", ":lua TogglePonPoffSelection()<CR>", opts)
