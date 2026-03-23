require("utils")

vim.pack.add({
	Gh("neovim/nvim-lspconfig"),
	Gh("folke/lazydev.nvim"),
	Gh("mason-org/mason-lspconfig.nvim"),
	{ src = Gh("mason-org/mason.nvim"), version = vim.version.range("*") },
})

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function()
		vim.pack.add({
			Gh("folke/trouble.nvim"),
		})
		require("trouble").setup()
	end,
})

require("lazydev").setup()

require("mason").setup()

vim.diagnostic.config({
	virtual_text = true,
	underline = true,
	signs = false,
})

require("mason-lspconfig").setup({
	automatic_enable = true,
	ensure_installed = {
		"lua_ls",
		"gopls",
		"bashls",
		"jsonls",
	},
})

-- vim.lsp.enable({
--   "lua_ls",
--   "gopls",
-- })
