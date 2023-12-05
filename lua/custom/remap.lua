vim.g.mapleader = " "
vim.keymap.set("n", "<C-e>", vim.cmd.Ex)
vim.keymap.set("n", "<leader>h", ":noh<CR>")

-- Split
vim.keymap.set("n", "<M-j>", "<C-w>j")
vim.keymap.set("n", "<M-k>", "<C-w>k")
vim.keymap.set("n", "<M-l>", "<C-w>l")
vim.keymap.set("n", "<M-h>", "<C-w>h")

vim.keymap.set("n", "<M-s>", function()
    vim.cmd("split")
    vim.cmd("wincmd j")
    vim.cmd("term")
end)

vim.keymap.set("n", "<M-d>", function()
    vim.cmd("vsplit")
    vim.cmd("wincmd l")
    vim.cmd("term")
end)

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
    local opts = { noremap = true }

    keymap("n", "k", ":resize -2<CR>", opts)
    keymap("n", "j", ":resize +2<CR>", opts)
    keymap("n", "l", ":vertical resize -2<CR>", opts)
    keymap("n", "h", ":vertical resize +2<CR>", opts)

    keymap("n", "<C-c>", "<cmd>lua Exit_interactive_resize()<CR>", opts)
    keymap("n", "q", "<cmd>lua Exit_interactive_resize()<CR>", opts)
end

vim.api.nvim_set_keymap(
    "n",
    "<M-r>",
    "<cmd>lua Interactive_resize()<CR>",
    { noremap = true, silent = true }
)

vim.keymap.set("n", "<M-=>", "<C-w>=")
vim.keymap.set("n", "<C-s>", ":w<CR>")
vim.keymap.set("n", "<M-f>", ":term<CR>")
vim.keymap.set("n", "Q", ":q!<CR>")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("v", ">", ">gv")
vim.keymap.set("v", "<", "<gv")


--- LSP
vim.keymap.set('n', 'gl', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

-- Tab
vim.keymap.set("n", "<M-a>c", function ()
    vim.cmd("tabnew")
    vim.cmd("term")
end)
vim.keymap.set("n", "<M-1>", "1gt")
vim.keymap.set("n", "<M-2>", "2gt")
vim.keymap.set("n", "<M-3>", "3gt")
vim.keymap.set("n", "<M-4>", "4gt")
vim.keymap.set("n", "<M-5>", "5gt")
vim.keymap.set("n", "<M-6>", "6gt")
vim.keymap.set("n", "<M-7>", "7gt")
vim.keymap.set("n", "<M-8>", "8gt")
vim.keymap.set("n", "<M-9>", "9gt")

-- Terminal mode
vim.keymap.set("t", "<M-q>", "<C-\\><C-n>")
vim.keymap.set("t", "<M-j>", "<C-\\><C-n><C-w>j", { silent = true })
vim.keymap.set("t", "<M-k>", "<C-\\><C-n><C-w>k", { silent = true })
vim.keymap.set("t", "<M-l>", "<C-\\><C-n><C-w>l", { silent = true })
vim.keymap.set("t", "<M-h>", "<C-\\><C-n><C-w>h", { silent = true })

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

vim.keymap.set('n', '<M-z>', toggle_zoom, { silent = true })
vim.keymap.set('t', '<M-z>', function()
    vim.cmd('stopinsert')
    vim.defer_fn(function()
        toggle_zoom()
        vim.cmd('startinsert')
    end, 10)
end, { silent = true })
