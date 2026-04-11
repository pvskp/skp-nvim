local opt = vim.opt
local o = vim.o

o.clipboard = "unnamedplus"
o.swapfile = false
o.undofile = true

vim.api.nvim_create_autocmd("FileType", {
	pattern = "*",
	callback = function()
		vim.opt_local.formatoptions:remove({ "c", "r", "o" })
	end,
})

--------------
--- Search ---
--------------
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.hlsearch = false
vim.o.inccommand = "split"

---------------
--- Visuals ---
---------------
vim.o.laststatus = 3
opt.number = true
opt.wrap = false
opt.scrolloff = 99999
opt.fillchars = {
	vert = "│",
	eob = " ",
}

o.cursorline = true
o.cursorlineopt = "number"

o.cmdheight = 0

-------------
--- Split ---
-------------
o.splitbelow = true
o.splitright = true
o.equalalways = true

-----------------------------
--- Tabulation/Identation ---
-----------------------------
o.expandtab = true
o.tabstop = 2
o.shiftwidth = 2
o.smartindent = true
o.autoindent = true

---------------
--- Folding ---
---------------

function Custom_foldtext()
	return string.format(" %s", vim.fn.getline(vim.v.foldstart))
end

o.foldmethod = "indent"
o.foldlevelstart = 99
o.foldlevel = 99
o.foldenable = true

o.foldcolumn = "auto"

-- this allows the fold to use the current code syntax
opt.foldtext = ""

opt.fillchars:append({
	fold = " ",
	foldopen = "‐",
	foldclose = "›",
	-- foldopen = '',
	-- foldclose = '',
	foldsep = " ",
	foldinner = " ",
})

--------------------------
--- Lsp format on save ---
--------------------------

vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function ()
    vim.hl.on_yank({timeout = 300})
  end
})

-- vim.api.nvim_create_autocmd('LspAttach', {
--   group = vim.api.nvim_create_augroup('my.lsp', {}),
--   callback = function(ev)
--     local client = assert(vim.lsp.get_client_by_id(ev.data.client_id))
--
--     if not client:supports_method('textDocument/willSaveWaitUntil')
--         and client:supports_method('textDocument/formatting') then
--       vim.api.nvim_create_autocmd('BufWritePre', {
--         group = vim.api.nvim_create_augroup('my.lsp', { clear = false }),
--         buffer = ev.buf,
--         callback = function()
--           vim.lsp.buf.format({ bufnr = ev.buf, id = client.id, timeout_ms = 1000 })
--         end,
--       })
--     end
--   end,
-- })

require('vim._core.ui2').enable({
  enable = true,
})
