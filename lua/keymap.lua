require("utils")

vim.g.mapleader = " "
vim.g.maplocalleader = " "

Map("n", "<c-e>", "<cmd>Explore<cr>", { desc = "Open Explorer" })
Map("n", "<c-s>", "<cmd>w<cr>", { desc = "Open Explorer" })
Map("n", "<c-q>", "<cmd>qall!<cr>", { desc = "Close all" })
Map({ "n", "v" }, "<c-j>", "%", { desc = "Go to next matching", noremap = true })
Map({ "n", "v" }, "<space><space>", "g_", { desc = "Go to the end of line", noremap = true })
Map("n", "<tab>", "<c-6>", { desc = "Go to last buffer" })

Map("n", "<c-y>", "<cmd>%y<CR>", { desc = "Copy all file" })

Map("n", "<leader>q", "1z=", { desc = "Accepts first spell fix" })

vim.keymap.set("n", "<leader>R", function()
  local session = vim.fn.stdpath("state") .. "/restart_session.vim"
  vim.cmd("mksession! " .. vim.fn.fnameescape(session))
  vim.cmd("restart source " .. vim.fn.fnameescape(session))
end, { desc = "Restart Neovim" })

Map("n", "H", "zc", { desc = "Close fold" })
Map("n", "L", "zO", { desc = "Open fold" })

Map("n", "<leader>eh", "<cmd>bprev<cr>", { desc = "Go to previous buffer" })
Map("n", "<leader>el", "<cmd>bnext<cr>", { desc = "Go to next buffer" })
Map("n", "<leader>eq", "<cmd>bdelete<cr>", { desc = "Close buffer" })

Map("n", "<leader>nj", "]]", { desc = "Go to previous function/method", remap = true })
Map("n", "<leader>nk", "[[", { desc = "Go to next function/method", remap = true })
Map("n", "<leader>nq", "", { desc = "Stop search", remap = false })

Map("n", "q:", "q:?", { desc = "Opens command history with search" })

Map("n", "<leader>rr", function()
  MiniSessions.read("Session.vm")
end, { desc = "Reload session" })

Map("n", "<leader>rs", function()
  MiniSessions.write("Session.vm")
end, { desc = "Write session" })

Map("n", "<leader>F", function()
  print(vim.fn.expand("%"))
end, { desc = "Prints current file relative path" })

Map("n", "<leader>cf", function()
  require("conform").format({ lsp_format = "fallback" }, function(err, did_edit)
    if err ~= nil then
      vim.notify("Failed to format", vim.log.levels.ERROR)
      return
    end

    if not did_edit then
      vim.notify("Nothing to do", vim.log.levels.INFO)
      return
    end

    vim.notify("Code Formated", vim.log.levels.INFO)
  end)
end, { desc = "Opens command history with search" })

local opts = {}
opts.desc = "Toggle Git Overlay"
Map("n", "<c-g>", function()
  MiniDiff.toggle_overlay(0)
end, opts)

--- Mini keymaps
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    local ok, _ = pcall(require, "mini.misc")
    if ok then
      Map("n", "<c-w>z", MiniMisc.zoom, { desc = "Zoom window" })
    end

    local ok, _ = pcall(require, "mini.files")
    if ok then
      Map("n", "<c-e>", function()
        MiniFiles.open(vim.api.nvim_buf_get_name(0), false)
      end, { desc = "Pick files" })
    end

    --- fzf-lua mappings
    local ok, fzf = pcall(require, "fzf-lua")
    if ok then
      Map("n", "<leader>f", function()
        fzf.files()
      end, { desc = "Pick files" })
      Map("n", "<leader>h", function()
        fzf.help_tags()
      end, { desc = "Pick help" })
      Map("n", "<leader>sh", function()
        fzf.highlights()
      end, { desc = "Pick highlight groups" })
      Map("n", "<leader>sb", function()
        fzf.buffers()
      end, { desc = "Pick buffers" })
      Map("n", "<leader>g", function()
        fzf.live_grep()
      end, { desc = "Live Grep" })
      Map({ "n", "v" }, "<leader>sw", function()
        fzf.grep_cword()
      end, { desc = "Search for word under cursor" })
    end
  end,
})

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local opts = { buffer = args.buf }

    local float_window_config = {
      max_height = 15,
      max_width = 80,
      border = "solid",
    }

    local definition_func = vim.lsp.buf.definition
    local references_func = vim.lsp.buf.references
    local implementation_func = vim.lsp.buf.implementation

    local fzf_available, fzf = pcall(require, "fzf-lua")

    if fzf_available and fzf then
      definition_func = function()
        fzf.lsp_definitions()
      end
      references_func = function()
        fzf.lsp_references()
      end
      implementation_func = function()
        fzf.lsp_implementations()
      end
    end

    opts.desc = "Go to definition"
    Map("n", "gd", definition_func, opts)

    opts.desc = "Go to references"
    Map("n", "gr", references_func, opts)

    opts.desc = "Go to implementation"
    Map("n", "gi", implementation_func, opts)

    opts.desc = "Digraph"
    Map("i", "<C-l>", "<C-k>", opts)

    opts.desc = "Show signature help"
    Map("i", "<C-k>", function()
      vim.lsp.buf.signature_help(float_window_config)
    end, opts)

    opts.desc = "Show line diagnostics"
    Map("n", "gl", function()
      vim.diagnostic.open_float(float_window_config)
    end, opts)

    opts.desc = "LSP rename"
    Map("n", "<leader>rn", function()
      vim.lsp.buf.rename()
    end, opts)

    opts.desc = "Code Actions"
    Map("n", "<leader>la", function()
      vim.lsp.buf.code_action()
    end, opts)

    opts.desc = "Open definition on vertical split"
    Map("n", "gV", function()
      vim.cmd.vsplit()
      vim.lsp.buf.definition()
    end, opts)

    opts.desc = "Open definition on horizontal split"
    Map("n", "gS", function()
      vim.cmd.split()
      vim.lsp.buf.definition()
    end, opts)

    opts.desc = "LSP Hover"
    Map("n", "K", function()
      vim.lsp.buf.hover(float_window_config)
    end, opts)

    --- trouble
    opts.desc = "Open Trouble window"
    Map("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", opts)
  end,
})
